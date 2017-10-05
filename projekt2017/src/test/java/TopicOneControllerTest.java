import forum.model.Messages;
import forum.model.Topic;
import forum.repository.MessagesRepository;
import forum.service.ServiceMessages;
import forum.service.ServiceTopic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;

@Controller
@Transactional
public class TopicOneControllerTest {
    @Autowired
    ServiceTopic serviceTopic;
    @Autowired
    ServiceMessages serviceMessages;
    @Autowired
    MessagesRepository messagesRepository;

    @GetMapping("/edit_topics")
    public String editTopics() {
        return "edit topics";
    }

    @GetMapping("/edit_topic_one/{topic_id}")
    public String editTopicOne(@PathVariable("topic_id") long topic_id, Model model) {
        Topic topic;
        topic = serviceTopic.findOneTopic(topic_id);

        model.addAttribute("id_topic_edit", topic.getTopic_id());
        model.addAttribute("name_topic_edit", topic.getTopic_name());
        model.addAttribute("description_topic_edit", topic.getDescription());
//

        return "edit one topic";
    }

    @GetMapping("/delete_topic/{topic_id}")
    @Transactional(readOnly = false)
    public String deleteTopic(@PathVariable("topic_id") long topic_id) throws Exception {
        Topic topic = serviceTopic.findOneTopic(topic_id);
        List<Messages> list = new ArrayList<>();
        list = serviceMessages.findAllByTopic(topic);


//        for (Messages messages : list) {
//            int id =(int) messages.getMesages_id();
//            messages.setNewUser(null);
//            messages.setTopic(null);
//            serviceMessages.delete(id);
//            System.err.println(id);
//        }
        Messages messages=new Messages();

        messages=list.get(0);
        messages.setTopic(null);
        messages.setNewUser(null);
        System.err.println(messages.getMesages_id());


//        list.clear();
        System.err.println(serviceMessages.findAllByTopic(topic).size());
        if (serviceMessages.findAllByTopic(topic).size() == 0) {
            serviceTopic.deleteTopic(topic_id);
        }
        if(messagesRepository.exists(messages.getMesages_id())){
            System.err.println(messagesRepository.exists(messages.getMesages_id()));
            messagesRepository.delete(messages);
            System.err.println(messagesRepository.exists(messages.getMesages_id()));

        }



        return "edit one topic";
    }
}
