package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.Ingredient;

import java.util.List;

public interface IngredientService {

    Ingredient findById(long id);

    Ingredient saveIngredient(Ingredient ingredient);

    void updateIngredient(Ingredient ingredient);

    void deleteIngredient(long id);

    List<Ingredient> findAllIngredients();

}
