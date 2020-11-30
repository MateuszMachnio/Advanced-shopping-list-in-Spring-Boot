package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.Plan;

import java.util.List;

public interface PlanService {

    Plan findById(long id);

    Plan savePlan(Plan plan);

    void updatePlan(Plan plan);

    void deletePlanById(long id);

    List<Plan> findAllPlans();

}
