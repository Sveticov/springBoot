package forum.service;

import forum.model.Topic;
import forum.repository.TopicRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ServiceTopic {
    @Autowired
    TopicRepository topicRepository;

    public Topic findOne(long id){
        return topicRepository.findOne(id);
    }

    public List<Topic> findAllTopic() {
        return (List<Topic>) topicRepository.findAll();
    }

    public void addTopic(Topic topic){
        topicRepository.save(topic);
    }

    public void updateTopic(Topic topic){
        topicRepository.save(topic);
    }


    public Topic findOneTopic(long topic_id){
        return topicRepository.findOne(topic_id);
    }

    public void deleteTopic(long topic_id){
        topicRepository.delete(topic_id);
    }
}
