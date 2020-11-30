package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.Recipe;

import java.util.List;

public interface RecipeService {

    Recipe findById(long id);

    Recipe saveRecipe(Recipe recipe);

    void updateRecipe(Recipe recipe);

    void deleteRecipeById(long id);

    public void deleteRecipe(Recipe recipe);

    List<Recipe> findAllRecipes();

}
