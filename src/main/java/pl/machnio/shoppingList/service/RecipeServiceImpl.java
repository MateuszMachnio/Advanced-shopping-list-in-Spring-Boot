package pl.machnio.shoppingList.service;

import org.springframework.stereotype.Service;
import pl.machnio.shoppingList.entity.IngredientWithQuantity;
import pl.machnio.shoppingList.entity.Recipe;
import pl.machnio.shoppingList.entity.SetOfIngredientsWithQuantities;
import pl.machnio.shoppingList.repository.IngredientWithQuantityRepository;
import pl.machnio.shoppingList.repository.RecipeRepository;
import pl.machnio.shoppingList.repository.SetOfIngredientsWithQuantitiesRepository;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Set;

@Service
public class RecipeServiceImpl implements RecipeService {

    private final RecipeRepository recipeRepository;
    private final IngredientWithQuantityRepository ingredientWithQuantityRepository;
    private final SetOfIngredientsWithQuantitiesRepository setOfIngredientsWithQuantitiesRepository;

    public RecipeServiceImpl(RecipeRepository recipeRepository, IngredientWithQuantityRepository ingredientWithQuantityRepository, SetOfIngredientsWithQuantitiesRepository setOfIngredientsWithQuantitiesRepository) {
        this.recipeRepository = recipeRepository;
        this.ingredientWithQuantityRepository = ingredientWithQuantityRepository;
        this.setOfIngredientsWithQuantitiesRepository = setOfIngredientsWithQuantitiesRepository;
    }

    @Override
    public Recipe findById(long id) {
        return recipeRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such Plan"));
    }

    @Override
    public Recipe saveRecipe(Recipe recipe) {
        return recipeRepository.save(recipe);
    }

    @Override
    public void updateRecipe(Recipe recipe) {
        recipeRepository.save(recipe);
    }

    @Override
    public void deleteRecipeById(long id) {
        recipeRepository.deleteById(id);
    }

    @Override
    public void deleteRecipe(Recipe recipe) {
        recipeRepository.delete(recipe);
    }

    @Override
    public List<Recipe> findAllRecipes() {
        return recipeRepository.findAll();
    }

    @Override
    public List<Recipe> findAllOriginal() {
        return recipeRepository.findAllByOriginalTrueOrderByName();
    }

    @Override
    public List<Recipe> findAllByNameContains(String name) {
        return recipeRepository.findAllByNameContains(name);
    }

    @Override
    public Recipe createCopyOfRecipe(long recipeId) {
        Recipe recipe = findById(recipeId);

        SetOfIngredientsWithQuantities setOfIngredientsWithQuantities = new SetOfIngredientsWithQuantities();
        Set<IngredientWithQuantity> ingredientsWithQuantities = recipe.getSetOfIngredientsWithQuantities().getIngredientsWithQuantities();
        ingredientsWithQuantities.forEach(ingredientWithQuantity -> {
            IngredientWithQuantity newIngredientWithQuantity = new IngredientWithQuantity(ingredientWithQuantity.getIngredient(), ingredientWithQuantity.getQuantity());
            setOfIngredientsWithQuantities.addIngredientWithQuantity(ingredientWithQuantityRepository.save(newIngredientWithQuantity));
        });
        SetOfIngredientsWithQuantities savedSet = setOfIngredientsWithQuantitiesRepository.save(setOfIngredientsWithQuantities);

        Recipe newRecipe = new Recipe(recipe.getName(), recipe.getDescription(), recipe.getPreparation(), recipe.getNumberOfServings(), recipe.getPreparationTime(), false, savedSet);
        return saveRecipe(newRecipe);
    }

}
