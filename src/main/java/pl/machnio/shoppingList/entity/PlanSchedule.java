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
    @ManyToMany
    @JoinTable(name = "schedule_recipes", joinColumns = @JoinColumn(name = "schedule_id"), inverseJoinColumns = @JoinColumn(name = "recipe_id"))
    private Set<Recipe> recipes = new HashSet<>();

    @NotEmpty
    @ManyToMany
    @JoinTable(name = "schedule_meals", joinColumns = @JoinColumn(name = "schedule_id"), inverseJoinColumns = @JoinColumn(name = "meal_id"))
    private Set<MealName> meals = new HashSet<>();

    @NotEmpty
    @ManyToMany
    @JoinTable(name = "schedule_days", joinColumns = @JoinColumn(name = "schedule_id"), inverseJoinColumns = @JoinColumn(name = "day_id"))
    private Set<DayOfTheWeek> days = new HashSet<>();

    @NotEmpty
    @ManyToMany
    @JoinTable(name = "schedule_plans", joinColumns = @JoinColumn(name = "schedule_id"), inverseJoinColumns = @JoinColumn(name = "plan_id"))
    private Set<Plan> plans = new HashSet<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set<Recipe> getRecipes() {
        return recipes;
    }

    public void setRecipes(Set<Recipe> recipes) {
        this.recipes = recipes;
    }

    public Set<MealName> getMeals() {
        return meals;
    }

    public void setMeals(Set<MealName> meals) {
        this.meals = meals;
    }

    public Set<DayOfTheWeek> getDays() {
        return days;
    }

    public void setDays(Set<DayOfTheWeek> days) {
        this.days = days;
    }

    public Set<Plan> getPlans() {
        return plans;
    }

    public void setPlans(Set<Plan> plans) {
        this.plans = plans;
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
                '}';
    }
}
