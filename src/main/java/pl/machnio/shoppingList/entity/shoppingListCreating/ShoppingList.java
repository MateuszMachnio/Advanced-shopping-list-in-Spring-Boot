package pl.machnio.shoppingList.entity.shoppingListCreating;

import org.springframework.web.bind.annotation.GetMapping;
import pl.machnio.shoppingList.entity.IngredientWithQuantity;
import pl.machnio.shoppingList.entity.SetOfIngredientsWithQuantities;
import pl.machnio.shoppingList.entity.User;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "shopping_lists")
public class ShoppingList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "shopping_list_id")
    private Set<IngredientWithQuantity> ingredientsWithQuantities = new HashSet<>();

//    @NotNull
//    @OneToOne(optional = false)
//    @JoinColumn(name = "user_id")
//    private User user;

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
        return new HashSet<>(ingredientsWithQuantities);
    }

    public void setIngredientsWithQuantities(Set<IngredientWithQuantity> ingredientsWithQuantities) {
        this.ingredientsWithQuantities = ingredientsWithQuantities;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ShoppingList that = (ShoppingList) o;
        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "ShoppingList{" +
                "id=" + id +
                '}';
    }
}
