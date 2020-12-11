package pl.machnio.shoppingList.service;

import org.springframework.stereotype.Service;
import pl.machnio.shoppingList.entity.Ingredient;
import pl.machnio.shoppingList.repository.IngredientRepository;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class IngredientServiceImpl implements IngredientService{

    private final IngredientRepository ingredientRepository;

    public IngredientServiceImpl(IngredientRepository ingredientRepository) {
        this.ingredientRepository = ingredientRepository;
    }

    @Override
    public Ingredient findById(long id) {
        return ingredientRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such Ingredient"));
    }

    @Override
    public Ingredient findByName(String name) {
        return ingredientRepository.findByName(name).orElse(null);
//        orElseThrow(() -> new EntityNotFoundException("There is no such Ingredient"));
    }

    @Override
    public Ingredient saveIngredient(Ingredient ingredient) {
        return ingredientRepository.save(ingredient);
    }

    @Override
    public void updateIngredient(Ingredient ingredient) {
        ingredientRepository.save(ingredient);
    }

    @Override
    public void deleteIngredient(long id) {
        ingredientRepository.deleteById(id);
    }

    @Override
    public List<Ingredient> findAllIngredients() {
        return ingredientRepository.findAll();
    }

}
