package pl.machnio.shoppingList.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import pl.machnio.shoppingList.entity.Ingredient;
import pl.machnio.shoppingList.service.IngredientService;

@Component
public class IngredientConverter implements Converter<String, Ingredient> {

    private final IngredientService ingredientService;

    public IngredientConverter(IngredientService ingredientService) {
        this.ingredientService = ingredientService;
    }

    @Override
    public Ingredient convert(String s) {
        return ingredientService.findByName(s);
    }
}
