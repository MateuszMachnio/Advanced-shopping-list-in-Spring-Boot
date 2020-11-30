package pl.machnio.shoppingList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logged-user")
public class LoggedUserController {

    @GetMapping("/dashboard")
    public String showDashboard() {
        return "logged-user/dashboard";
    }

}
