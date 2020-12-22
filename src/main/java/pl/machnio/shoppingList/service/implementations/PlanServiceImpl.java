package pl.machnio.shoppingList.service.implementations;

import org.springframework.stereotype.Service;
import pl.machnio.shoppingList.entity.Plan;
import pl.machnio.shoppingList.repository.PlanRepository;
import pl.machnio.shoppingList.repository.PlanScheduleRepository;
import pl.machnio.shoppingList.service.interfaces.PlanService;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class PlanServiceImpl implements PlanService {

    private final PlanRepository planRepository;
    private final PlanScheduleRepository planScheduleRepository;

    public PlanServiceImpl(PlanRepository planRepository, PlanScheduleRepository planScheduleRepository) {
        this.planRepository = planRepository;
        this.planScheduleRepository = planScheduleRepository;
    }

    @Override
    public Plan findById(long id) {
        return planRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such Plan"));
    }

    @Override
    public Plan savePlan(Plan plan) {
        return planRepository.save(plan);
    }

    @Override
    public void updatePlan(Plan plan) {
        planRepository.save(plan);
    }

    @Override
    public void deletePlanById(long id) {
        planRepository.deleteById(id);
    }

    @Override
    public List<Plan> findAllPlans() {
        return planRepository.findAll();
    }
}
