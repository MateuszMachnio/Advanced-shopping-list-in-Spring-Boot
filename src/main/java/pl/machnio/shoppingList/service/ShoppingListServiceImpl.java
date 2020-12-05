package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.IngredientWithQuantity;
import pl.machnio.shoppingList.entity.shoppingListCreating.ShoppingList;
import pl.machnio.shoppingList.repository.IngredientWithQuantityRepository;
import pl.machnio.shoppingList.repository.ShoppingListRepository;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Map;

public class ShoppingListServiceImpl implements ShoppingListService {

    private final ShoppingListRepository shoppingListRepository;
    private final IngredientWithQuantityRepository ingredientWithQuantityRepository;
    private final IngredientService ingredientService;

    public ShoppingListServiceImpl(ShoppingListRepository shoppingListRepository, IngredientWithQuantityRepository ingredientWithQuantityRepository, IngredientService ingredientService) {
        this.shoppingListRepository = shoppingListRepository;
        this.ingredientWithQuantityRepository = ingredientWithQuantityRepository;
        this.ingredientService = ingredientService;
    }

    @Override
    public ShoppingList findById(long id) {
        return shoppingListRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such ShoppingList"));
    }

    @Override
    public ShoppingList saveShoppingList(Map<String, Integer> shoppingList) {
        ShoppingList properShoppingList = new ShoppingList();
        shoppingList.forEach((s, integer) -> {
            IngredientWithQuantity ingredientWithQuantity = new IngredientWithQuantity(ingredientService.findByName(s), integer);
            IngredientWithQuantity savedIWQ = ingredientWithQuantityRepository.save(ingredientWithQuantity);
            properShoppingList.addIngredientWithQuantity(savedIWQ);
        });
        return shoppingListRepository.save(properShoppingList);
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
