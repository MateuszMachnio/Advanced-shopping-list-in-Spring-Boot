package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.shoppingListCreating.ShoppingList;

import java.util.List;
import java.util.Map;

public interface ShoppingListService {

    ShoppingList findById(long id);

    public ShoppingList findByIdWithSetOfIngredientsWithQuantities(long id);

    public ShoppingList saveShoppingList(Map<String, Integer> shoppingList);

    void updateShoppingList(ShoppingList shoppingList);

    void deleteShoppingList(long id);

    List<ShoppingList> findAllShoppingLists();
    
}
