package pl.machnio.shoppingList.service.implementations;

import org.springframework.stereotype.Service;
import pl.machnio.shoppingList.entity.MealName;
import pl.machnio.shoppingList.repository.MealNameRepository;
import pl.machnio.shoppingList.service.interfaces.MealNameService;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class MealNameServiceImpl implements MealNameService {

    private final MealNameRepository mealNameRepository;

    public MealNameServiceImpl(MealNameRepository mealNameRepository) {
        this.mealNameRepository = mealNameRepository;
    }

    @Override
    public MealName findById(long id) {
        return mealNameRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such MealName"));
    }

    @Override
    public MealName saveMealName(MealName mealName) {
        return mealNameRepository.save(mealName);
    }

    @Override
    public void updateMealName(MealName mealName) {
        mealNameRepository.save(mealName);
    }

    @Override
    public void deleteMealName(long id) {
        mealNameRepository.deleteById(id);
    }

    @Override
    public List<MealName> findAllMealNames() {
        return mealNameRepository.findAll();
    }
}
