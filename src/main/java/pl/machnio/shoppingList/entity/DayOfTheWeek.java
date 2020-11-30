package pl.machnio.shoppingList.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "day_of_the_week")
public class DayOfTheWeek {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "day_name", nullable = false, unique = true, length = 15)
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
        DayOfTheWeek that = (DayOfTheWeek) o;
        return id.equals(that.id) &&
                name.equals(that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }

    @Override
    public String toString() {
        return "DayOfTheWeek{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
