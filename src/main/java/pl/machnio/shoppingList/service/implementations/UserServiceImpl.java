package pl.machnio.shoppingList.service.implementations;

import org.hibernate.Hibernate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.machnio.shoppingList.entity.User;
import pl.machnio.shoppingList.repository.PlanRepository;
import pl.machnio.shoppingList.repository.UserRepository;
import pl.machnio.shoppingList.service.interfaces.UserService;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final PlanRepository planRepository;
    private final PasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, PlanRepository planRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.planRepository = planRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public User findById(long id) {
        return userRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("There is no such User"));
    }

    @Override
    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Override
    public void updateUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void deleteUserById(long id) {
        userRepository.deleteById(id);
    }

    @Override
    public List<User> findAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    @Override
    @Transactional
    public User getCurrentUserWithPlans() {
        User user = userRepository.findByEmail(getPrincipal());
        Hibernate.initialize(user.getPlans());
        return user;
    }

    @Override
    @Transactional
    public User getCurrentUserWithRecipes() {
        User user = userRepository.findByEmail(getPrincipal());
        Hibernate.initialize(user.getRecipes());
        return user;
    }

    @Override
    public User getCurrentUser() {
        return userRepository.findByEmail(getPrincipal());
    }

    @Override
    public boolean currentUserHasPlan(long planId) {
        return getCurrentUser().getPlans().contains(planRepository.findById(planId).get());
    }

}
