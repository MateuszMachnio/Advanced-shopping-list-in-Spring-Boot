package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.PlanSchedule;

import java.util.List;

public interface PlanScheduleService {

    PlanSchedule findById(long id);

    PlanSchedule savePlanSchedule(PlanSchedule planSchedule);

    void updatePlanSchedule(PlanSchedule planSchedule);

    void deletePlanSchedule(long id);

    List<PlanSchedule> findAllPlanSchedules();
}
