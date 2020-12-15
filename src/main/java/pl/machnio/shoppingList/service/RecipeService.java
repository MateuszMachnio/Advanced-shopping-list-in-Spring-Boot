package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.Recipe;

import java.util.List;

public interface RecipeService {

    Recipe findById(long id);

    Recipe findBySetOfIWQId(long setOfIngredientsWithQuantities_id);

    Recipe saveRecipe(Recipe recipe);

    void updateRecipe(Recipe recipe);

    void deleteRecipeById(long id);

    public void deleteRecipe(Recipe recipe);

    List<Recipe> findAllRecipes();

    public Recipe createCopyOfRecipe(long recipeId);

    List<Recipe> findAllOriginal();

    List<Recipe> findAllByNameContains(String name);

}
