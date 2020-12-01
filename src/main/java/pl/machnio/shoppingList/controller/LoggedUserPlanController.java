package pl.machnio.shoppingList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.machnio.shoppingList.entity.*;
import pl.machnio.shoppingList.service.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/logged-user/plan")
public class LoggedUserPlanController {

    private final PlanService planService;
    private final UserService userService;
    private final RecipeService recipeService;
    private final MealNameService mealNameService;
    private final DayOfTheWeekService dayOfTheWeekService;
    private final PlanScheduleService planScheduleService;

    public LoggedUserPlanController(PlanService planService, UserService userService, RecipeService recipeService, MealNameService mealNameService, DayOfTheWeekService dayOfTheWeekService, PlanScheduleService planScheduleService) {
        this.planService = planService;
        this.userService = userService;
        this.recipeService = recipeService;
        this.mealNameService = mealNameService;
        this.dayOfTheWeekService = dayOfTheWeekService;
        this.planScheduleService = planScheduleService;
    }

    @ModelAttribute("recipes")
    public List<Recipe> getRecipes() {
        return recipeService.findAllRecipes();
    }

    @ModelAttribute("mealNames")
    public List<MealName> getMealNames() {
        return mealNameService.findAllMealNames();
    }

    @ModelAttribute("daysOfTheWeek")
    public List<DayOfTheWeek> getDaysOfTheWeek() {
        return dayOfTheWeekService.findAllDaysOfTheWeek();
    }


    @GetMapping("/add")
    public String addPlan(Model model) {
        model.addAttribute("plan", new Plan());
        return "/logged-user/plan/add";
    }

    @PostMapping("/add")
    public String addingPlan(@Valid Plan plan, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "/logged-user/plan/add";
        }
        Plan savedPlan = planService.savePlan(plan);
        User currentUser = userService.getCurrentUserWithPlans();
        currentUser.addPlan(savedPlan);
        userService.updateUser(currentUser);
        model.addAttribute("planSchedule", new PlanSchedule());
        model.addAttribute("planId", savedPlan.getId());
        return "/logged-user/plan/addRecipeToPlan";
    }

    @PostMapping("/add-recipe")
    public String addRecipeToPlan(@Valid PlanSchedule planSchedule, BindingResult result) {
        if (result.hasErrors()) {
            return "/logged-user/plan/addRecipeToPlan";
        }
        planScheduleService.savePlanSchedule(planSchedule);
        return "redirect:list";
    }

    @GetMapping("/list")
    public String showPlans(Model model) {
        model.addAttribute("plans", userService.getCurrentUserWithPlans().getPlans());
        return "/logged-user/plan/list";
    }

}
