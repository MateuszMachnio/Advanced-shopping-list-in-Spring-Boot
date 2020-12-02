package pl.machnio.shoppingList.service;

import org.springframework.stereotype.Service;
import pl.machnio.shoppingList.entity.DayOfTheWeek;
import pl.machnio.shoppingList.entity.PlanSchedule;
import pl.machnio.shoppingList.repository.DayOfTheWeekRepository;
import pl.machnio.shoppingList.repository.PlanScheduleRepository;

import javax.persistence.EntityNotFoundException;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class PlanScheduleServiceImpl implements PlanScheduleService {

    private final PlanScheduleRepository planScheduleRepository;
    private final DayOfTheWeekRepository dayOfTheWeekRepository;

    public PlanScheduleServiceImpl(PlanScheduleRepository planScheduleRepository, DayOfTheWeekRepository dayOfTheWeekRepository) {
        this.planScheduleRepository = planScheduleRepository;
        this.dayOfTheWeekRepository = dayOfTheWeekRepository;
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
}
