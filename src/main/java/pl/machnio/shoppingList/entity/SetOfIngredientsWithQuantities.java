package pl.machnio.shoppingList.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "set_of_ingredients_with_quantities")
public class SetOfIngredientsWithQuantities {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany
    @JoinColumn(name = "set_of_ingr_with_quant_id")
    private Set<IngredientWithQuantity> ingredientsWithQuantities = new HashSet<>();

    public void addIngredientWithQuantity(IngredientWithQuantity ingredientWithQuantity) {
        ingredientsWithQuantities.add(ingredientWithQuantity);
    }

    public void removeIngredientWithQuantity(IngredientWithQuantity ingredientWithQuantity) {
        ingredientsWithQuantities.remove(ingredientWithQuantity);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set<IngredientWithQuantity> getIngredientsWithQuantities() {
        return ingredientsWithQuantities;
    }

    public void setIngredientsWithQuantities(Set<IngredientWithQuantity> ingredientsWithQuantities) {
        this.ingredientsWithQuantities = ingredientsWithQuantities;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SetOfIngredientsWithQuantities that = (SetOfIngredientsWithQuantities) o;
        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "SetOfIngredientsWithQuantities{" +
                "id=" + id +
                '}';
    }
}
