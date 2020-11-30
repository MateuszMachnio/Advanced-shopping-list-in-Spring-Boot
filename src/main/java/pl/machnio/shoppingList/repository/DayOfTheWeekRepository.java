package pl.machnio.shoppingList.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.machnio.shoppingList.entity.DayOfTheWeek;

@Repository
public interface DayOfTheWeekRepository extends JpaRepository<DayOfTheWeek, Long> {
}
