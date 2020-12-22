package pl.machnio.shoppingList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.machnio.shoppingList.entity.Ingredient;
import pl.machnio.shoppingList.service.interfaces.IngredientService;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final IngredientService ingredientService;

    public AdminController(IngredientService ingredientService) {
        this.ingredientService = ingredientService;
    }

    @GetMapping("/add-new-ingredient")
    public String addNewIngredient(Model model) {
        model.addAttribute("ingredient", new Ingredient());
        return "admin/addIngredient";
    }

    @PostMapping("/add-new-ingredient")
    public String addingNewIngredient(@Valid Ingredient ingredient, BindingResult result) {
        if (result.hasErrors()) {
            return "admin/addIngredient";
        }
        ingredientService.saveIngredient(ingredient);
        return "redirect:/logged-user/dashboard";
    }

}
