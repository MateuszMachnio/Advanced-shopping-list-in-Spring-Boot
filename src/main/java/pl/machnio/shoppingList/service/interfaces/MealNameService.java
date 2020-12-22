package pl.machnio.shoppingList.service.interfaces;

import pl.machnio.shoppingList.entity.Ingredient;
import pl.machnio.shoppingList.entity.MealName;

import java.util.List;

public interface MealNameService {

    MealName findById(long id);

    MealName saveMealName(MealName mealName);

    void updateMealName(MealName mealName);

    void deleteMealName(long id);

    List<MealName> findAllMealNames();
}
