package pl.machnio.shoppingList.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.machnio.shoppingList.entity.SetOfIngredientsWithQuantities;
import pl.machnio.shoppingList.repository.SetOfIngredientsWithQuantitiesRepository;

import javax.persistence.EntityNotFoundException;

public class SetOfIngredientsWithQuantitiesConverter implements Converter<String, SetOfIngredientsWithQuantities> {

    @Autowired
    private SetOfIngredientsWithQuantitiesRepository setOfIngredientsWithQuantitiesRepository;

    @Override
    public SetOfIngredientsWithQuantities convert(String s) {
        if (Long.parseLong(s) <= 0) {
            return null;
        }
        return setOfIngredientsWithQuantitiesRepository.findById(Long.parseLong(s)).orElseThrow(() -> new EntityNotFoundException("SetOfIngredientsWithQuantities not found. Id: " + s));
    }
}
