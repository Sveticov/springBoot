package forum.controller;

import forum.model.Admin;
import forum.model.NewUser;
import forum.service.ServiceAdmin;
import forum.web_resources.WebResourceAdmin;
import forum.web_resources.WebResourcesUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminController {

@Autowired
    ServiceAdmin serviceAdmin;
   @PostMapping("/loginAdmin")
    public WebResourceAdmin webResourceAdmin(@RequestBody Admin admin){


        WebResourceAdmin webResourceAdmin=new WebResourceAdmin();

        webResourceAdmin.setStatus("success");
        webResourceAdmin.setData(admin);

        return webResourceAdmin;
    }


    @PostMapping("/formAdminRegistration")
    public WebResourceAdmin registrationFormAdmin(@RequestBody Admin admin) {
        WebResourceAdmin webResourceAdmin = new WebResourceAdmin();


        for (Admin adminLocal : serviceAdmin.findAllAdmin()) {
            if (adminLocal.getAdmin_name().equals(admin.getAdmin_name())) {
                webResourceAdmin.setStatus("Error");
                webResourceAdmin.setData("Please choose a different name for your user");
                return webResourceAdmin;
            }
        }

        if (admin.getAdmin_name().isEmpty() || admin.getAdmin_password().isEmpty()) {
            webResourceAdmin.setStatus("Error");
            webResourceAdmin.setData("Name or Password is Empty");
            return webResourceAdmin;
        }
        serviceAdmin.addNewAdmin(admin);

        webResourceAdmin.setStatus("success");
        webResourceAdmin.setData(admin);

        return webResourceAdmin;
    }

}
