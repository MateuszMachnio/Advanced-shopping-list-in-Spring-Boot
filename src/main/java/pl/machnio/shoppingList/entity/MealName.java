package pl.machnio.shoppingList.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "meal_names")
public class MealName {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "meal_name", nullable = false, unique = true, length = 15)
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MealName mealName = (MealName) o;
        return id.equals(mealName.id) &&
                name.equals(mealName.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }

    @Override
    public String toString() {
        return "MealName{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
