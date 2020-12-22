package pl.machnio.shoppingList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.machnio.shoppingList.entity.User;
import pl.machnio.shoppingList.service.interfaces.UserService;

import javax.validation.Valid;

@Controller
@RequestMapping("/logged-user")
public class LoggedUserController {

    private final UserService userService;

    public LoggedUserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/dashboard")
    public String showDashboard() {
        return "logged-user/dashboard";
    }

    @GetMapping("/edit-password")
    public String editPassword(Model model) {
        User currentUser = userService.getCurrentUser();
        currentUser.setPassword("");
        model.addAttribute("user", currentUser);
        return "logged-user/editPassword";
    }

    @PostMapping("/edit-password")
    public String editingPassword(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "logged-user/editPassword";
        }
        userService.updateUser(user);
        return "redirect:dashboard";
    }

}
