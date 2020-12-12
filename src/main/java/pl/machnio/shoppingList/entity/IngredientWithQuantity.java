package pl.machnio.shoppingList.entity;

import org.hibernate.validator.constraints.Range;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Objects;

@Entity
@Table(name = "ingredients_with_quantities")
public class IngredientWithQuantity implements Comparable<IngredientWithQuantity> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "ingredient_id")
    private Ingredient ingredient;

    @NotNull
    @Range(min = 1, max = 5000)
    private Integer quantity;

    public IngredientWithQuantity() {
    }

    public IngredientWithQuantity(Ingredient ingredient, int quantity) {
        this.ingredient = ingredient;
        this.quantity = quantity;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }

    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        IngredientWithQuantity that = (IngredientWithQuantity) o;
        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "IngredientWithQuantity{" +
                "id=" + id +
                ", ingredient=" + ingredient +
                ", quantity=" + quantity +
                '}';
    }

    @Override
    public int compareTo(IngredientWithQuantity ingredientWithQuantity) {
        return this.ingredient.getName().compareToIgnoreCase(ingredientWithQuantity.ingredient.getName());
    }
}
