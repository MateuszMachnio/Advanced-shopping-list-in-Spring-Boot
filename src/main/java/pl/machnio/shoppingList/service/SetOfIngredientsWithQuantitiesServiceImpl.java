package pl.machnio.shoppingList.service;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.machnio.shoppingList.entity.SetOfIngredientsWithQuantities;
import pl.machnio.shoppingList.repository.SetOfIngredientsWithQuantitiesRepository;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class SetOfIngredientsWithQuantitiesServiceImpl implements SetOfIngredientsWithQuantitiesService {

    private final SetOfIngredientsWithQuantitiesRepository setOfIngredientsWithQuantitiesRepository;

    public SetOfIngredientsWithQuantitiesServiceImpl(SetOfIngredientsWithQuantitiesRepository setOfIngredientsWithQuantitiesRepository) {
        this.setOfIngredientsWithQuantitiesRepository = setOfIngredientsWithQuantitiesRepository;
    }

    @Override
    public SetOfIngredientsWithQuantities findById(long id) {
        return setOfIngredientsWithQuantitiesRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such SetOfIngredientsWithQuantities"));
    }

    @Override
    @Transactional
    public SetOfIngredientsWithQuantities findByIdWithSetOfIngredientsWithQuantity(long id) {
        SetOfIngredientsWithQuantities set = findById(id);
        Hibernate.initialize(set.getIngredientsWithQuantities());
        return set;
    }

    @Override
    public SetOfIngredientsWithQuantities saveSetOfIngredientsWithQuantities(SetOfIngredientsWithQuantities setOfIngredientsWithQuantities) {
        return setOfIngredientsWithQuantitiesRepository.save(setOfIngredientsWithQuantities);
    }

    @Override
    public void updateSetOfIngredientsWithQuantities(SetOfIngredientsWithQuantities setOfIngredientsWithQuantities) {
        setOfIngredientsWithQuantitiesRepository.save(setOfIngredientsWithQuantities);
    }

    @Override
    public void deleteSetOfIngredientsWithQuantitiesById(long id) {
        setOfIngredientsWithQuantitiesRepository.deleteById(id);
    }

    @Override
    public List<SetOfIngredientsWithQuantities> findAllSetOfIngredientsWithQuantities() {
        return setOfIngredientsWithQuantitiesRepository.findAll();
    }
}
