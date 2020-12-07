package pl.machnio.shoppingList.service;

import pl.machnio.shoppingList.entity.User;

import java.util.List;

public interface UserService {

    User findById(long id);

    User findByEmail(String email);

    void saveUser(User user);

    void updateUser(User user);

    void deleteUserById(long id);

    List<User> findAllUsers();

    String getPrincipal();

    User getCurrentUserWithPlans();

    User getCurrentUserWithRecipes();

    User getCurrentUser();

}
