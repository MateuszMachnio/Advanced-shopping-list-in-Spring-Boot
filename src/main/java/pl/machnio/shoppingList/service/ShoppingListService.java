package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.shoppingListCreating.ShoppingList;

import java.util.List;

public interface ShoppingListService {

    ShoppingList findById(long id);

    ShoppingList saveShoppingList(ShoppingList shoppingList);

    void updateShoppingList(ShoppingList shoppingList);

    void deleteShoppingList(long id);

    List<ShoppingList> findAllShoppingLists();
    
}
