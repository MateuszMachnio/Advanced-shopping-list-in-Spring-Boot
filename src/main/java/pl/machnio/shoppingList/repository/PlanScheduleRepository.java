package pl.machnio.shoppingList.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.machnio.shoppingList.entity.DayOfTheWeek;
import pl.machnio.shoppingList.entity.PlanSchedule;

import javax.validation.constraints.NotNull;
import java.util.List;

public interface PlanScheduleRepository extends JpaRepository<PlanSchedule, Long> {

    List<PlanSchedule> findByPlanIdAndDayOfTheWeek(Long plan_id, DayOfTheWeek dayOfTheWeek);

    List<PlanSchedule> findByPlanIdAndDayOfTheWeekId(Long plan_id, Long dayOfTheWeek_id);

    List<PlanSchedule> findByPlanId(Long plan_id);
}
