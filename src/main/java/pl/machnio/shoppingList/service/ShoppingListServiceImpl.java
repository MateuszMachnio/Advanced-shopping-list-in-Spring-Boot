package pl.machnio.shoppingList.service;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.machnio.shoppingList.entity.Ingredient;
import pl.machnio.shoppingList.entity.IngredientWithQuantity;
import pl.machnio.shoppingList.entity.User;
import pl.machnio.shoppingList.entity.shoppingListCreating.ShoppingList;
import pl.machnio.shoppingList.repository.IngredientWithQuantityRepository;
import pl.machnio.shoppingList.repository.ShoppingListRepository;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Map;

@Service
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
    @Transactional
    public ShoppingList findByIdWithSetOfIngredientsWithQuantities(long id) {
        ShoppingList shoppingList = findById(id);
        Hibernate.initialize(shoppingList.getIngredientsWithQuantities());
        return shoppingList;
    }

    @Override
    public ShoppingList saveShoppingList(Map<String, Integer> shoppingList) {
        ShoppingList properShoppingList = new ShoppingList();
        shoppingList.forEach((s, integer) -> {
            IngredientWithQuantity ingredientWithQuantity = new IngredientWithQuantity(ingredientService.findByName(s), integer);
//            ingredientWithQuantity.setIngredient(ingredientService.findByName(s));
//            ingredientWithQuantity.setQuantity(integer);
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
