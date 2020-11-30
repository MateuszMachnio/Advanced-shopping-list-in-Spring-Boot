package pl.machnio.shoppingList.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.machnio.shoppingList.entity.SetOfIngredientsWithQuantities;

public interface SetOfIngredientsWithQuantitiesRepository extends JpaRepository<SetOfIngredientsWithQuantities, Long> {
}
