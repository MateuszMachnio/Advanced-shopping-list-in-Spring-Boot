package pl.machnio.shoppingList.service;

import org.springframework.stereotype.Service;
import pl.machnio.shoppingList.entity.DayOfTheWeek;
import pl.machnio.shoppingList.entity.IngredientWithQuantity;
import pl.machnio.shoppingList.entity.MealName;
import pl.machnio.shoppingList.entity.PlanSchedule;
import pl.machnio.shoppingList.repository.DayOfTheWeekRepository;
import pl.machnio.shoppingList.repository.MealNameRepository;
import pl.machnio.shoppingList.repository.PlanScheduleRepository;

import javax.persistence.EntityNotFoundException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class PlanScheduleServiceImpl implements PlanScheduleService {

    private final PlanScheduleRepository planScheduleRepository;
    private final DayOfTheWeekRepository dayOfTheWeekRepository;
    private final MealNameRepository mealNameRepository;

    public PlanScheduleServiceImpl(PlanScheduleRepository planScheduleRepository, DayOfTheWeekRepository dayOfTheWeekRepository, MealNameRepository mealNameRepository) {
        this.planScheduleRepository = planScheduleRepository;
        this.dayOfTheWeekRepository = dayOfTheWeekRepository;
        this.mealNameRepository = mealNameRepository;
    }

    @Override
    public PlanSchedule findById(long id) {
        return planScheduleRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such PlanSchedule"));
    }

    @Override
    public PlanSchedule savePlanSchedule(PlanSchedule planSchedule) {
        return planScheduleRepository.save(planSchedule);
    }

    @Override
    public void updatePlanSchedule(PlanSchedule planSchedule) {
        planScheduleRepository.save(planSchedule);
    }

    @Override
    public void deletePlanSchedule(long id) {
        planScheduleRepository.deleteById(id);
    }

    @Override
    public void deleteAll(List<PlanSchedule> planSchedules) {
        planScheduleRepository.deleteAll(planSchedules);
    }

    @Override
    public List<PlanSchedule> findAllPlanSchedules() {
        return planScheduleRepository.findAll();
    }

    @Override
    public List<PlanSchedule> findAllByPlanId(Long plan_id) {
        return planScheduleRepository.findAllByPlanId(plan_id);
    }

    @Override
    public Map<DayOfTheWeek, List<PlanSchedule>> findPlanSchedulesByPlanId(long plan_id) {
        List<DayOfTheWeek> weekDays = dayOfTheWeekRepository.findAll();
        Map<DayOfTheWeek, List<PlanSchedule>> planScheduleMap = new TreeMap<>();
        for (DayOfTheWeek dayOfTheWeek : weekDays) {
            List<PlanSchedule> plans = planScheduleRepository.findByPlanIdAndDayOfTheWeek(plan_id, dayOfTheWeek);
            Collections.sort(plans);
            planScheduleMap.put(dayOfTheWeek, plans);
        }
        return planScheduleMap;
    }

    @Override
    public List<MealName> findMealsOfTheDayThatLeft(long plan_id, long dayOfTheWeek_id) {
        List<MealName> allMeals = mealNameRepository.findAll();
        List<PlanSchedule> plans = planScheduleRepository.findByPlanIdAndDayOfTheWeekId(plan_id, dayOfTheWeek_id);
        Set<MealName> savedMeals = plans.stream()
                .map(PlanSchedule::getMealName)
                .collect(Collectors.toSet());
        allMeals.removeAll(savedMeals);
        return allMeals;
    }

    @Override
    public Map<String, Integer> shoppingListIngredients(long plan_id) {
        List<PlanSchedule> plans = planScheduleRepository.findAllByPlanId(plan_id);

        List<Set<IngredientWithQuantity>> listOfIngredientsWithQuantitiesSets = plans.stream()
                .map(planSchedule -> planSchedule.getRecipe().getSetOfIngredientsWithQuantities().getIngredientsWithQuantities())
                .collect(Collectors.toList());

        Set<Set<String>> setIngredientsNamesSets = listOfIngredientsWithQuantitiesSets.stream()
                .map(ingredientWithQuantities -> ingredientWithQuantities.stream()
                        .map(ingredientWithQuantity -> ingredientWithQuantity.getIngredient().getName())
                        .collect(Collectors.toSet())
                )
                .collect(Collectors.toSet());

        Set<String> distinctIngredients = new HashSet<>();

        for (Set<String> strings : setIngredientsNamesSets) {
            distinctIngredients.addAll(strings);
        }

        Map<String, Integer> shoppingList = new TreeMap<>();
        for (String ingredient : distinctIngredients) {
            List<Optional<Integer>> collect2 = listOfIngredientsWithQuantitiesSets.stream()
                    .map(ingredientWithQuantities -> ingredientWithQuantities.stream()
                            .filter(ingredientWithQuantity -> ingredientWithQuantity.getIngredient().getName().equals(ingredient))
                            .map(IngredientWithQuantity::getQuantity)
                            .findFirst()
                    )
                    .collect(Collectors.toList());

            int sumOfProduct = 0;
            for (Optional<Integer> ingredient1 : collect2) {
                if (ingredient1.isPresent()) {
                    sumOfProduct += ingredient1.get();
                }
            }
            shoppingList.put(ingredient, sumOfProduct);
        }

        return shoppingList;
    }
}