package pl.machnio.shoppingList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.machnio.shoppingList.entity.*;
import pl.machnio.shoppingList.entity.shoppingListCreating.ShoppingList;
import pl.machnio.shoppingList.pdf.IngredientsWithQuantitiesPDFExporter;
import pl.machnio.shoppingList.service.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/logged-user/plan")
public class LoggedUserPlanController {

    private final PlanService planService;
    private final UserService userService;
    private final MealNameService mealNameService;
    private final PlanScheduleService planScheduleService;
    private final ShoppingListService shoppingListService;
    private final IngredientWithQuantityService ingredientWithQuantityService;

    public LoggedUserPlanController(PlanService planService, UserService userService, MealNameService mealNameService, PlanScheduleService planScheduleService, ShoppingListService shoppingListService, IngredientWithQuantityService ingredientWithQuantityService) {
        this.planService = planService;
        this.userService = userService;
        this.mealNameService = mealNameService;
        this.planScheduleService = planScheduleService;
        this.shoppingListService = shoppingListService;
        this.ingredientWithQuantityService = ingredientWithQuantityService;
    }

    @ModelAttribute("recipes")
    public Set<Recipe> getRecipes() {
        return new TreeSet<>(userService.getCurrentUserWithRecipes().getRecipes());
    }

    @ModelAttribute("mealNames")
    public List<MealName> getMealNames() {
        List<MealName> mealNames = mealNameService.findAllMealNames();
        Collections.sort(mealNames);
        return mealNames;
    }

    @GetMapping("/add")
    public String addPlan(Model model) {
        model.addAttribute("plan", new Plan());
        return "/logged-user/plan/add";
    }

    @PostMapping("/add")
    public String addingPlan(@Valid Plan plan, BindingResult result) {
        if (result.hasErrors()) {
            return "/logged-user/plan/add";
        }
        Plan savedPlan = planService.savePlan(plan);
        User currentUser = userService.getCurrentUserWithPlans();
        currentUser.addPlan(savedPlan);
        userService.updateUser(currentUser);
        return "redirect:list";
    }

    @GetMapping("/list")
    public String showPlans(Model model) {
        model.addAttribute("plans", new TreeSet<>(userService.getCurrentUserWithPlans().getPlans()));
        return "/logged-user/plan/list";
    }

    @GetMapping("/details/{planId}")
    public String planDetails(@PathVariable long planId, Model model) {
        if (userService.currentUserHasPlan(planId)) {
            model.addAttribute("plan", planService.findById(planId));
            model.addAttribute("planSchedule", planScheduleService.findPlanSchedulesByPlanId(planId));
            return "/logged-user/plan/details";
        }
        return "redirect:/logged-user/plan/list";
    }

    @PostMapping("/add-recipe")
    public String addRecipeToPlan(@ModelAttribute("planId") long planId, @ModelAttribute("dayId") long dayId, Model model) {
        model.addAttribute("planSchedule", new PlanSchedule());
        model.addAttribute("mealNames", planScheduleService.findMealsOfTheDayThatLeft(planId, dayId));
        model.addAttribute("planId", planId);
        model.addAttribute("dayId", dayId);
        return "/logged-user/plan/addRecipeToPlan";
    }

    @PostMapping("/adding-recipe")
    public String addingRecipeToPlan(@Valid PlanSchedule planSchedule, BindingResult result, Model model) {
        Long planId = planSchedule.getPlan().getId();
        if (result.hasErrors()) {
            Long dayId = planSchedule.getDayOfTheWeek().getId();
            model.addAttribute("mealNames", planScheduleService.findMealsOfTheDayThatLeft(planId, dayId));
            model.addAttribute("planId", planId);
            model.addAttribute("dayId", dayId);
            return "/logged-user/plan/addRecipeToPlan";
        }
        planScheduleService.savePlanSchedule(planSchedule);
        return "redirect:details/" + planId;
    }

    @PostMapping("/delete")
    public String deletePlan(@ModelAttribute("planId") long planId, Model model) {
        model.addAttribute("plan", planService.findById(planId));
        model.addAttribute("planSchedule", planScheduleService.findPlanSchedulesByPlanId(planId));
        return "/logged-user/plan/delete";
    }

    @PostMapping("/deleting")
    public String deletingPlan(Plan plan) {
        User currentUserWithPlans = userService.getCurrentUserWithPlans();
        currentUserWithPlans.removePlan(plan);
        userService.updateUser(currentUserWithPlans);
        planScheduleService.deleteAll(planScheduleService.findAllByPlanId(plan.getId()));
        planService.deletePlanById(plan.getId());
        return "redirect:list";
    }

    @PostMapping("/remove-schedule")
    public String removeScheduleFromPlan(@ModelAttribute("planId") long planId, @ModelAttribute("scheduleId") long scheduleId) {
        planScheduleService.deletePlanSchedule(scheduleId);
        return "redirect:/logged-user/plan/details/" + planId;
    }

    @GetMapping("/shopping-list/{planId}")
    public String createList(@PathVariable long planId, @RequestParam(required = false) Long shoppingListId, Model model) {
        if (shoppingListId == null) {
            Map<String, Integer> shoppingList = planScheduleService.shoppingListIngredients(planId);
            ShoppingList savedShoppingList = shoppingListService.saveShoppingList(shoppingList);
            User currentUser = userService.getCurrentUser();
            ShoppingList userShoppingList = currentUser.getShoppingList();
            currentUser.setShoppingList(savedShoppingList);
            userService.updateUser(currentUser);
            if (userShoppingList != null) {
                shoppingListService.deleteShoppingList(userShoppingList.getId());
            }
            model.addAttribute("shoppingList", savedShoppingList);
        } else {
            model.addAttribute("shoppingList", shoppingListService.findByIdWithSetOfIngredientsWithQuantities(shoppingListId));
        }
        model.addAttribute("planId", planId);

        return "logged-user/plan/shoppingList/creatingShoppingList";
    }

    @PostMapping("/shopping-list/edit")
    public String editIngredient(@ModelAttribute("planId") long planId, @ModelAttribute("shoppingListId") long shoppingListId, @ModelAttribute("IWQId") long IWQId, Model model) {
        model.addAttribute("ingredientWithQuantity", ingredientWithQuantityService.findById(IWQId));
        model.addAttribute("planId", planId);
        model.addAttribute("shoppingListId", shoppingListId);
        return "logged-user/plan/shoppingList/editIngredientWithQuantity";
    }

    @PostMapping("/shopping-list/editing")
    public String editingIngredient(@Valid IngredientWithQuantity ingredientWithQuantity, BindingResult result, @ModelAttribute("planId") long planId, @ModelAttribute("shoppingListId") long shoppingListId, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("planId", planId);
            model.addAttribute("shoppingListId", shoppingListId);
            return "logged-user/plan/shoppingList/editIngredientWithQuantity";
        }
        ingredientWithQuantityService.updateIngredientWithQuantity(ingredientWithQuantity);
        return "redirect:" + planId + "?shoppingListId=" + shoppingListId;
    }

    @PostMapping("/shopping-list/delete")
    public String deleteIngredient(@ModelAttribute("planId") long planId, @ModelAttribute("shoppingListId") long shoppingListId, @ModelAttribute("IWQId") long IWQId, Model model) {
        model.addAttribute("ingredientWithQuantity", ingredientWithQuantityService.findById(IWQId));
        model.addAttribute("planId", planId);
        model.addAttribute("shoppingListId", shoppingListId);
        return "logged-user/plan/shoppingList/deleteIngredientWithQuantity";
    }

    @PostMapping("/shopping-list/deleting")
    public String deletingIngredient(IngredientWithQuantity ingredientWithQuantity, @ModelAttribute("planId") long planId, @ModelAttribute("shoppingListId") long shoppingListId) {
        ShoppingList shoppingList = shoppingListService.findByIdWithSetOfIngredientsWithQuantities(shoppingListId);
        shoppingList.removeIngredientWithQuantity(ingredientWithQuantity);
        shoppingListService.updateShoppingList(shoppingList);
        ingredientWithQuantityService.deleteIngredientWithQuantityById(ingredientWithQuantity.getId());
        return "redirect:" + planId + "?shoppingListId=" + shoppingListId;
    }

    @GetMapping("/shopping-list/export/{shoppingListId}")
    public void exportToPDF(@PathVariable long shoppingListId, HttpServletResponse response) throws IOException {
        response.setContentType("application/pdf; charset=UTF-8");
        DateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=shopping_list_" + currentDateTime + ".pdf";

        response.setHeader(headerKey, headerValue);

        //pobieramy dane
        IngredientsWithQuantitiesPDFExporter exporter = new IngredientsWithQuantitiesPDFExporter(shoppingListService.findByIdWithSetOfIngredientsWithQuantities(shoppingListId));
        exporter.export(response);

    }

}
