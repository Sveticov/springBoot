package forum.service;

import forum.model.Messages;
import forum.model.Topic;
import forum.repository.MessagesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceMessages {
    @Autowired
    MessagesRepository messagesRepository;

    public List<Messages> findAllByTopic(Topic topic){
        return messagesRepository.findAllByTopic(topic);
    }

//    public void deleteMessageBuId(long messages_id){
//       messagesRepository.removeByMesages_id(messages_id);
//    }

    public List<Messages> findAllMessages(){
        return messagesRepository.findAll();
    }

    public void delete(long id){
        messagesRepository.delete(id);
    }

    public Messages save(Messages messages){
      return   messagesRepository.save(messages);

    }
}
