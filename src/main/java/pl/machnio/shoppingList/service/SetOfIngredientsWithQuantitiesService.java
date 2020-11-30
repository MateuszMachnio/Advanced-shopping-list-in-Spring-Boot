package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.SetOfIngredientsWithQuantities;

import java.util.List;

public interface SetOfIngredientsWithQuantitiesService {

    SetOfIngredientsWithQuantities findById(long id);

    public SetOfIngredientsWithQuantities findByIdWithSetOfIngredientsWithQuantity(long id);

    SetOfIngredientsWithQuantities saveSetOfIngredientsWithQuantities(SetOfIngredientsWithQuantities setOfIngredientsWithQuantities);

    void updateSetOfIngredientsWithQuantities(SetOfIngredientsWithQuantities setOfIngredientsWithQuantities);

    void deleteSetOfIngredientsWithQuantitiesById(long id);

    List<SetOfIngredientsWithQuantities> findAllSetOfIngredientsWithQuantities();
}
