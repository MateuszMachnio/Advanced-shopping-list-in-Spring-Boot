package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.DayOfTheWeek;
import pl.machnio.shoppingList.entity.MealName;
import pl.machnio.shoppingList.entity.PlanSchedule;

import java.util.List;
import java.util.Map;

public interface PlanScheduleService {

    PlanSchedule findById(long id);

    PlanSchedule savePlanSchedule(PlanSchedule planSchedule);

    void updatePlanSchedule(PlanSchedule planSchedule);

    void deletePlanSchedule(long id);

    List<PlanSchedule> findAllPlanSchedules();

    public Map<DayOfTheWeek, List<PlanSchedule>> findPlanSchedulesByPlanId(long plan_id);

    public List<MealName> findMealsOfTheDayThatLeft(long plan_id, long dayOfTheWeek_id);
}
