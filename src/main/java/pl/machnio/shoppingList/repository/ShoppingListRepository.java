package pl.machnio.shoppingList.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.machnio.shoppingList.entity.shoppingListCreating.ShoppingList;

public interface ShoppingListRepository extends JpaRepository<ShoppingList, Long> {
}
