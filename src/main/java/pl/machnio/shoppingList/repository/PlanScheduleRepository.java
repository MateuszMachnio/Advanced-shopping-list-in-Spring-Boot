package pl.machnio.shoppingList.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.machnio.shoppingList.entity.PlanSchedule;

public interface PlanScheduleRepository extends JpaRepository<PlanSchedule, Long> {
}
