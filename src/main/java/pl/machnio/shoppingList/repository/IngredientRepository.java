package pl.machnio.shoppingList.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.machnio.shoppingList.entity.Ingredient;

import javax.validation.constraints.NotBlank;
import java.util.Optional;

@Repository
public interface IngredientRepository extends JpaRepository<Ingredient, Long> {

    Optional<Ingredient> findByName(@NotBlank String name);
}
