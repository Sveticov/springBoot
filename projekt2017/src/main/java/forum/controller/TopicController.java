package forum.controller;

import com.sun.org.apache.bcel.internal.generic.NEW;
import forum.model.*;
import forum.repository.MessagesRepository;
import forum.repository.TopicRepository;
import forum.repository.UserRepository;
import forum.service.ServiceMessages;
import forum.service.ServiceTopic;
import forum.service.ServiceUser;
import forum.web_resources.WebResourceMessages;
import forum.web_resources.WebResourcesTopic;
import forum.web_resources.WebResourcesUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@RestController
public class TopicController {

    @Autowired
    ServiceTopic serviceTopic;

    @Autowired
    ServiceMessages serviceMessages;
//    @Autowired
//    TopicRepository topicRepository;
//    @Autowired
//    UserRepository userRepository;
    @Autowired
    ServiceUser serviceUser;


    List<TopicModel> topicList = new ArrayList<>();
    List<Topic> topicListTT = new ArrayList<>();


    @GetMapping("/listTopic")
    public WebResourcesTopic listUser() {
        WebResourcesTopic webResourcesTopic = new WebResourcesTopic("done", "test");

        topicList.clear();


        for (Topic topic : serviceTopic.findAllTopic()) {
            TopicModel topicModel = new TopicModel(topic.getTopic_id(), topic.getTopic_name(), topic.getDescription());
            topicList.add(topicModel);
            System.out.println(topic);
        }


        webResourcesTopic.setStatus("success");
        webResourcesTopic.setData(topicList);


        return webResourcesTopic;
    }

    @PostMapping("/new_topic")
    public WebResourcesTopic addTopic(@RequestBody Topic topic) {
        WebResourcesTopic webResourcesTopic = new WebResourcesTopic("success", topic);
        serviceTopic.addTopic(topic);
        return webResourcesTopic;
    }

    //Update topic////////////////////////////////////////////
List<Messages> listMessages=new ArrayList<>();
    @PostMapping("/update/{topic_id}")
    public WebResourcesTopic updateTopic(@PathVariable("topic_id")long topic_id,@RequestBody Topic topic) {
        WebResourcesTopic webResourcesTopic = new WebResourcesTopic();

        Topic topic_local=serviceTopic.findOneTopic(topic_id);
        topic_local.setTopic_name(topic.getTopic_name());
        topic_local.setDescription(topic.getDescription());

        serviceTopic.updateTopic(topic_local);

        webResourcesTopic.setStatus("success");
        webResourcesTopic.setData(topic_local.getTopic_name());
        return webResourcesTopic;
    }



    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Messages
    @GetMapping("/forum/{topic_id}")
    @Transactional
    public WebResourceMessages viewListForumFromId(@PathVariable("topic_id") long topic_id) {
        WebResourceMessages webResourceMessages = new WebResourceMessages();

        Topic topic = serviceTopic.findOne(topic_id);
        List<Messages> messagesList = serviceMessages.findAllByTopic(topic);
        List<MessageUserModel> messageUserModels = new ArrayList<>();


        for (Messages message : messagesList) {
            MessageUserModel messageUserModel = new MessageUserModel();
            messageUserModel.setNameUser(message.getNewUser().getName());
            messageUserModel.setTextMessage(message.getMesage_text());

            messageUserModels.add(messageUserModel);


        }
        Collections.reverse(messageUserModels);
        webResourceMessages.setResult("success");
        webResourceMessages.setData(messageUserModels);

        serviceUser.setUserLocal(null); //add for test

        return webResourceMessages;
    }

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    List<MessageUserModel> list = new ArrayList<>();
    List<Messages> messagesList = new ArrayList<>();

    @MessageMapping("/{topic_id}/{user_id}/newMessage")
    @SendTo("/topic/list2")
    @Transactional
    public List<MessageUserModel> myList(@DestinationVariable("topic_id") long topic_id,
                                         @DestinationVariable("user_id") long user_id, String text) {
        list.clear();
        messagesList.clear();


        NewUser user_id_local = serviceUser.findOneUser(user_id);
        Topic topic_id_local = serviceTopic.findOne(topic_id);

        Messages messages = new Messages();
        messages.setNewUser(user_id_local);
        messages.setTopic(topic_id_local);
        messages.setMesage_text(text);

        serviceMessages.save(messages);

        //_____________________________________________________________


        messagesList = serviceMessages.findAllByTopic(topic_id_local);

        for (Messages messages1 : messagesList) {
            MessageUserModel messageUserModel = new MessageUserModel();
            messageUserModel.setNameUser(messages1.getNewUser().getName());
            messageUserModel.setTextMessage(messages1.getMesage_text());
            list.add(messageUserModel);
        }


        Collections.reverse(list);

        return list;
    }


}
