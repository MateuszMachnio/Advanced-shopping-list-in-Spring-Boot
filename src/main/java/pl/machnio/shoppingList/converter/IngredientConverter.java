package pl.machnio.shoppingList.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.machnio.shoppingList.entity.Ingredient;
import pl.machnio.shoppingList.repository.IngredientRepository;

import javax.persistence.EntityNotFoundException;

public class IngredientConverter implements Converter<String, Ingredient> {

    @Autowired
    private IngredientRepository ingredientRepository;

    @Override
    public Ingredient convert(String s) {
        if (Long.parseLong(s) <= 0) {
            return null;
        }
        return ingredientRepository.findById(Long.parseLong(s)).orElseThrow(() -> new EntityNotFoundException("Ingredient not found. Id: " + s));
    }
}

