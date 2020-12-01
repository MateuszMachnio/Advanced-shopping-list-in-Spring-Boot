package pl.machnio.shoppingList.entity;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "plan_schedule")
public class PlanSchedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    @ManyToOne
    @JoinColumn(name = "recipe_id")
    private Recipe recipe;

    @NotEmpty
    @ManyToOne
    @JoinColumn(name = "meal_id")
    private MealName mealName;

    @NotEmpty
    @ManyToOne
    @JoinColumn(name = "day_id")
    private DayOfTheWeek dayOfTheWeek;

    @NotEmpty
    @ManyToOne
    @JoinColumn(name = "plan_id")
    private Plan plan;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }

    public MealName getMealName() {
        return mealName;
    }

    public void setMealName(MealName mealName) {
        this.mealName = mealName;
    }

    public DayOfTheWeek getDayOfTheWeek() {
        return dayOfTheWeek;
    }

    public void setDayOfTheWeek(DayOfTheWeek dayOfTheWeek) {
        this.dayOfTheWeek = dayOfTheWeek;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PlanSchedule that = (PlanSchedule) o;
        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "PlanSchedule{" +
                "id=" + id +
                ", recipe=" + recipe +
                ", mealName=" + mealName +
                ", dayOfTheWeek=" + dayOfTheWeek +
                ", plan=" + plan +
                '}';
    }
}
