package forum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/registration_user")
    public String registrationUser(Model model) {
        return "user registration";
    }




}

