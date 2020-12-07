package pl.machnio.shoppingList.controller;

import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.machnio.shoppingList.entity.User;
import pl.machnio.shoppingList.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Locale;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final MessageSource messageSource;
    private final AuthenticationTrustResolver authenticationTrustResolver;

    public UserController(UserService userService, MessageSource messageSource, AuthenticationTrustResolver authenticationTrustResolver) {
        this.userService = userService;
        this.messageSource = messageSource;
        this.authenticationTrustResolver = authenticationTrustResolver;
    }

    @GetMapping("/registration")
    public String newUser(Model model) {
        model.addAttribute("user", new User());
//        model.addAttribute("loggedinuser", getPrincipal());
        return "user/registration";
    }


    @PostMapping("/registration")
    public String saveUser(@Valid User user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "user/registration";
        }

        if(userService.findByEmail(user.getEmail()) != null){
            FieldError error = new FieldError("user","email", messageSource.getMessage("non.unique.email", new String[]{user.getEmail()}, Locale.getDefault()));
            result.addError(error);
            return "user/registration";
        }

        userService.saveUser(user);

        model.addAttribute("loggedinuser", user.getFirstName());
        return "user/registrationSuccess";
    }

    @GetMapping("/login")
    public String loginPage() {
        if (isCurrentAuthenticationAnonymous()) {
            return "user/login";
        } else {
            return "redirect:/logged-user/dashboard";
        }
    }


    @RequestMapping(value = "/access-denied", method = RequestMethod.GET)
    public String accessDeniedPage(Model model) {
        model.addAttribute("loggedinuser", userService.getPrincipal());
        return "user/accessDenied";
    }




    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            //new SecurityContextLogoutHandler().logout(request, response, auth);
//            persistentTokenBasedRememberMeServices.logout(request, response, auth);
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/user/login?logout";
    }

    private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }

}
