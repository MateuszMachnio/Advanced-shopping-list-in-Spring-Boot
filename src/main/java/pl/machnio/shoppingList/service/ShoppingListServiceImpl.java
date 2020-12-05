package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.shoppingListCreating.ShoppingList;
import pl.machnio.shoppingList.repository.ShoppingListRepository;

import javax.persistence.EntityNotFoundException;
import java.util.List;

public class ShoppingListServiceImpl implements ShoppingListService {

    private final ShoppingListRepository shoppingListRepository;

    public ShoppingListServiceImpl(ShoppingListRepository shoppingListRepository) {
        this.shoppingListRepository = shoppingListRepository;
    }

    @Override
    public ShoppingList findById(long id) {
        return shoppingListRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such ShoppingList"));
    }

    @Override
    public ShoppingList saveShoppingList(ShoppingList shoppingList) {
        return shoppingListRepository.save(shoppingList);
    }

    @Override
    public void updateShoppingList(ShoppingList shoppingList) {
        shoppingListRepository.save(shoppingList);
    }

    @Override
    public void deleteShoppingList(long id) {
        shoppingListRepository.deleteById(id);
    }

    @Override
    public List<ShoppingList> findAllShoppingLists() {
        return shoppingListRepository.findAll();
    }
}
