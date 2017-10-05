package forum.controller;

import forum.model.Messages;
import forum.model.Topic;
import forum.repository.MessagesRepository;
import forum.service.ServiceMessages;
import forum.service.ServiceTopic;
import forum.web_resources.WebResourcesTopic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@Transactional
public class TopicOneController {
    @Autowired
    ServiceTopic serviceTopic;
    @Autowired
    ServiceMessages serviceMessages;
//    @Autowired
//    MessagesRepository messagesRepository;
    @PersistenceContext
    EntityManager entityManager;

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

    List<Messages> list = new ArrayList<>();

    @GetMapping("/delete_topic/{topic_id}")
    @Transactional
    public String deleteTopic(@PathVariable("topic_id") long topic_id) throws Exception {
        String query = "DELETE  FROM Messages m WHERE m.mesages_id=:mesages_id";
        Topic topic = serviceTopic.findOneTopic(topic_id);

        list = serviceMessages.findAllByTopic(topic);


        for (Messages messages : list) {
            Long id = messages.getMesages_id();

            entityManager.createQuery(query)
                    .setParameter("mesages_id", id).executeUpdate();

            System.err.println(id);
        }


        serviceTopic.deleteTopic(topic_id);


        return "edit topics";
    }



}
