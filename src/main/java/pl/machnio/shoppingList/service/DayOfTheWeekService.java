package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.DayOfTheWeek;
import pl.machnio.shoppingList.entity.Ingredient;

import java.util.List;

public interface DayOfTheWeekService {

    DayOfTheWeek findById(long id);

    DayOfTheWeek saveDayOfTheWeek(DayOfTheWeek dayOfTheWeek);

    void updateDayOfTheWeek(DayOfTheWeek dayOfTheWeek);

    void deleteDayOfTheWeek(long id);

    List<DayOfTheWeek> findAllDaysOfTheWeek();
}
