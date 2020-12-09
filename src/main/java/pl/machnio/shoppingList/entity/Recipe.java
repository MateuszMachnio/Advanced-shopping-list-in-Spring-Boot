package pl.machnio.shoppingList.entity;

import org.hibernate.validator.constraints.Range;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.Objects;

@Entity
@Table(name = "recipes")
public class Recipe implements Comparable<Recipe> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(max = 50)
    @Column(nullable = false, length = 50)
    private String name;

    @NotBlank
    @Column(nullable = false)
    private String description;

    private Boolean original;

    @NotBlank
    @Column(nullable = false)
    private String preparation;

    @Range(min = 1, max = 150)
    @Column(name = "number_of_servings", nullable = false)
    private int numberOfServings;

    @Range(min = 1, max = 300)
    @Column(name = "preparation_time", nullable = false)
    private int preparationTime;

    @Column(name = "created_on")
    private LocalDateTime created;

    @Column(name = "updated_on")
    private LocalDateTime updated;

    @NotNull
    @OneToOne(optional = false)
    @JoinColumn(name = "set_of_ingr_with_quant_id")
    private SetOfIngredientsWithQuantities setOfIngredientsWithQuantities;

    public Recipe() {
    }

    public Recipe(String name, String description, String preparation, int numberOfServings, int preparationTime, boolean original, SetOfIngredientsWithQuantities setOfIngredientsWithQuantities) {
        this.name = name;
        this.description = description;
        this.preparation = preparation;
        this.numberOfServings = numberOfServings;
        this.preparationTime = preparationTime;
        this.original = original;
        this.setOfIngredientsWithQuantities = setOfIngredientsWithQuantities;
    }

    @PrePersist
    public void setCreated() {
        this.created = LocalDateTime.now();
    }

    @PreUpdate
    public void setUpdated() {
        this.updated = LocalDateTime.now();
    }

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNumberOfServings() {
        return numberOfServings;
    }

    public void setNumberOfServings(int numberOfServings) {
        this.numberOfServings = numberOfServings;
    }

    public int getPreparationTime() {
        return preparationTime;
    }

    public void setPreparationTime(int preparationTime) {
        this.preparationTime = preparationTime;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public LocalDateTime getUpdated() {
        return updated;
    }

    public void setUpdated(LocalDateTime updated) {
        this.updated = updated;
    }

    public String getPreparation() {
        return preparation;
    }

    public void setPreparation(String preparation) {
        this.preparation = preparation;
    }

    public SetOfIngredientsWithQuantities getSetOfIngredientsWithQuantities() {
        return setOfIngredientsWithQuantities;
    }

    public void setSetOfIngredientsWithQuantities(SetOfIngredientsWithQuantities setOfIngredientsWithQuantities) {
        this.setOfIngredientsWithQuantities = setOfIngredientsWithQuantities;
    }

    public boolean isOriginal() {
        return original;
    }

    public void setOriginal(boolean original) {
        this.original = original;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Recipe recipe = (Recipe) o;
        return id.equals(recipe.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Recipe{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", numberOfServings=" + numberOfServings +
                ", preparationTime=" + preparationTime +
                ", created=" + created +
                ", updated=" + updated +
                '}';
    }

    @Override
    public int compareTo(Recipe recipe) {
        return name.compareToIgnoreCase(recipe.name);
    }
}
