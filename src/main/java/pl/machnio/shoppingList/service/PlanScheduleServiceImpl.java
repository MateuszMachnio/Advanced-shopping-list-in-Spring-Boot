package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.PlanSchedule;
import pl.machnio.shoppingList.repository.PlanScheduleRepository;

import javax.persistence.EntityNotFoundException;
import java.util.List;

public class PlanScheduleServiceImpl implements PlanScheduleService {

    private final PlanScheduleRepository planScheduleRepository;

    public PlanScheduleServiceImpl(PlanScheduleRepository planScheduleRepository) {
        this.planScheduleRepository = planScheduleRepository;
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
    public List<PlanSchedule> findAllPlanSchedules() {
        return planScheduleRepository.findAll();
    }
}
