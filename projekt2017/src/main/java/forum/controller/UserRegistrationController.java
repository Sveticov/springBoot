package forum.controller;

import forum.model.NewUser;
import forum.model.UserModel;
import forum.service.ServiceUser;
import forum.web_resources.WebResourcesUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class UserRegistrationController {

    @Autowired
    ServiceUser serviceUser;

    List<NewUser> newUserList = new ArrayList<>();

    @PostMapping("/formUserRegistration")
    public WebResourcesUser registrationFormUser(@RequestBody NewUser user) {
        WebResourcesUser webResourcesUser = new WebResourcesUser("Done", user);

        for (NewUser userLocal : serviceUser.findAllUser()) {
            if (userLocal.getName().equals(user.getName())) {
                webResourcesUser.setStatus("Error");
                webResourcesUser.setData("Please choose a different name for your user");
                return webResourcesUser;
            }
        }

        if (user.getName().isEmpty() || user.getPassword().isEmpty()) {
            webResourcesUser.setStatus("Error");
            webResourcesUser.setData("Name or Password is Empty");
            return webResourcesUser;
        }
        serviceUser.addUser(user);

        return webResourcesUser;
    }


    @PostMapping("/loginUser")
    public WebResourcesUser loginUser(@RequestBody NewUser user) {

        WebResourcesUser webResourcesUser = new WebResourcesUser("Done", user);
        UserModel userModel = new UserModel();
        newUserList = serviceUser.findAllUser();
        for (NewUser userLocal : newUserList) {
            if (user.getName().equals(userLocal.getName()) && user.getPassword().equals(userLocal.getPassword())) {


                userLocal.setMessages(null);

                webResourcesUser.setStatus("success");
                webResourcesUser.setData(userLocal);
                serviceUser.setUserLocal(userLocal);//send controller welcome
                return webResourcesUser;
            }
        }
        webResourcesUser.setStatus("error");
        webResourcesUser.setData("Name or Password is not equals");
        serviceUser.setUserLocal(null);
        return webResourcesUser;
    }


    @GetMapping("/get/user/actual")
    public WebResourcesUser getUserActual() {
        WebResourcesUser webResourcesUser = new WebResourcesUser("success", "test");

    //    if (serviceUser.getUserLocal().equals(null) != false) {
            webResourcesUser.setStatus("success");
            webResourcesUser.setData(serviceUser.getUserLocal());

    //    }

        return webResourcesUser;
    }


}
