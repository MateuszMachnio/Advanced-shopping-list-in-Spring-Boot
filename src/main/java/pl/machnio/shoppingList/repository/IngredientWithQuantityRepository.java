package pl.machnio.shoppingList.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.machnio.shoppingList.entity.IngredientWithQuantity;

public interface IngredientWithQuantityRepository extends JpaRepository<IngredientWithQuantity, Long> {
}
