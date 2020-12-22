package pl.machnio.shoppingList.service.implementations;

import org.springframework.stereotype.Service;
import pl.machnio.shoppingList.entity.IngredientWithQuantity;
import pl.machnio.shoppingList.repository.IngredientWithQuantityRepository;
import pl.machnio.shoppingList.service.interfaces.IngredientWithQuantityService;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class IngredientWithQuantityServiceImpl implements IngredientWithQuantityService {

    private final IngredientWithQuantityRepository ingredientWithQuantityRepository;

    public IngredientWithQuantityServiceImpl(IngredientWithQuantityRepository ingredientWithQuantityRepository) {
        this.ingredientWithQuantityRepository = ingredientWithQuantityRepository;
    }

    @Override
    public IngredientWithQuantity findById(long id) {
        return ingredientWithQuantityRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such IngredientWithQuantity"));
    }

    @Override
    public IngredientWithQuantity saveIngredientWithQuantity(IngredientWithQuantity ingredientWithQuantity) {
        return ingredientWithQuantityRepository.save(ingredientWithQuantity);
    }

    @Override
    public void updateIngredientWithQuantity(IngredientWithQuantity ingredientWithQuantity) {
        ingredientWithQuantityRepository.save(ingredientWithQuantity);
    }

    @Override
    public void deleteIngredientWithQuantityById(long id) {
        ingredientWithQuantityRepository.deleteById(id);
    }

    @Override
    public List<IngredientWithQuantity> findAllIngredientsWithQuantities() {
        return ingredientWithQuantityRepository.findAll();
    }
}
