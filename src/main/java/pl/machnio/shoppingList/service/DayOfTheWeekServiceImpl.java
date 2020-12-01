package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.DayOfTheWeek;
import pl.machnio.shoppingList.repository.DayOfTheWeekRepository;

import javax.persistence.EntityNotFoundException;
import java.util.List;

public class DayOfTheWeekServiceImpl implements DayOfTheWeekService {

    private final DayOfTheWeekRepository dayOfTheWeekRepository;

    public DayOfTheWeekServiceImpl(DayOfTheWeekRepository dayOfTheWeekRepository) {
        this.dayOfTheWeekRepository = dayOfTheWeekRepository;
    }

    @Override
    public DayOfTheWeek findById(long id) {
        return dayOfTheWeekRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such DayOfTheWeek"));
    }

    @Override
    public DayOfTheWeek saveDayOfTheWeek(DayOfTheWeek dayOfTheWeek) {
        return dayOfTheWeekRepository.save(dayOfTheWeek);
    }

    @Override
    public void updateDayOfTheWeek(DayOfTheWeek dayOfTheWeek) {
        dayOfTheWeekRepository.save(dayOfTheWeek);
    }

    @Override
    public void deleteDayOfTheWeek(long id) {
        dayOfTheWeekRepository.deleteById(id);
    }

    @Override
    public List<DayOfTheWeek> findAllDaysOfTheWeek() {
        return dayOfTheWeekRepository.findAll();
    }
}
