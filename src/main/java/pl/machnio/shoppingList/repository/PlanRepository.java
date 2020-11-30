package pl.machnio.shoppingList.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.machnio.shoppingList.entity.Plan;

@Repository
public interface PlanRepository extends JpaRepository<Plan, Long> {
}
