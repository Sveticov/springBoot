package forum.controller;

import forum.model.Messages;


import forum.model.Topic;
import forum.repository.AdminRepository;
import forum.repository.MessagesRepository;
import forum.repository.TopicRepository;
import forum.repository.UserRepository;

import forum.service.ServiceMessages;
import forum.service.ServiceTopic;
import forum.service.ServiceUser;
import forum.web_resources.WebResourceMessages;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;


import javax.transaction.Transactional;
import java.util.ArrayList;

import java.util.List;

@Controller
public class WelcomeController {


    @Autowired
    ServiceTopic serviceTopic;
    @Autowired
    ServiceUser serviceUser;
   @Autowired
    ServiceMessages serviceMessages;

//    @Autowired
//    AdminRepository adminRepository;


    long user_id;
    String user_name;

    @RequestMapping("/welcome")
    @Transactional
    public String welcome() {//Model model


        return "welcome";
    }

    @GetMapping("/admin_registration")
    public String adminRegistration(){
        return "admin_registration";
    }




    @RequestMapping("/forum/{topic_id}/{user_id}/{user_name}")                                   // forum
    public String forum(@PathVariable("topic_id") long topic_id, @PathVariable("user_id") long user_id,
                        @PathVariable("user_name") String user_name, Model model) {
        Topic topic;
        topic = serviceTopic.findOne(topic_id);

        model.addAttribute("user_id", user_id);
        model.addAttribute("user_name", user_name);
        model.addAttribute("forum", topic.getTopic_name());
        model.addAttribute("forum_description", topic.getDescription());
        List<Messages> messagesList = serviceMessages.findAllMessages();
        List<Messages> localMessages = new ArrayList<>();
        for (Messages messages : messagesList)
            if (messages.getTopic().getTopic_id() == topic_id) {
                localMessages.add(messages);
            }
        model.addAttribute("messages", localMessages);

        return "forum";
    }





    @GetMapping("/all_users")
    public String userFindAll(Model model) {
        model.addAttribute("users", serviceUser.findAllUser());

        model.addAttribute("topics_activ","test topic");
        return "user";
    }


    @RequestMapping(value = "/{topic_id}/{user_id}/message_send", method = RequestMethod.POST)
    public String messageSend(@PathVariable("topic_id") long topic_id, @PathVariable("user_id") long user_id,
                              @RequestBody Messages messages) {
        messages.setNewUser(serviceUser.findOneUser(user_id));
        messages.setTopic(serviceTopic.findOne(topic_id));
        serviceMessages.save(messages);


        return "Done";
    }


}
