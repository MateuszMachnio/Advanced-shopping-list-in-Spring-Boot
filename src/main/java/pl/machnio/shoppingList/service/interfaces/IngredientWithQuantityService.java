package pl.machnio.shoppingList.service.interfaces;

import pl.machnio.shoppingList.entity.IngredientWithQuantity;

import java.util.List;

public interface IngredientWithQuantityService {

    IngredientWithQuantity findById(long id);

    IngredientWithQuantity saveIngredientWithQuantity(IngredientWithQuantity ingredientWithQuantity);

    void updateIngredientWithQuantity(IngredientWithQuantity ingredientWithQuantity);

    void deleteIngredientWithQuantityById(long id);

    List<IngredientWithQuantity> findAllIngredientsWithQuantities();

}
