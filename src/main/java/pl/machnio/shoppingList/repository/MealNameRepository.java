package pl.machnio.shoppingList.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.machnio.shoppingList.entity.MealName;

public interface MealNameRepository extends JpaRepository<MealName, Long> {
}
