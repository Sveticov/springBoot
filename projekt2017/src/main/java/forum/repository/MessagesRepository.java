package forum.repository;

import forum.model.Messages;
import forum.model.Topic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.Repository;

import java.util.List;


public interface MessagesRepository extends JpaRepository<Messages,Long> {
//
    List<Messages> findAllByTopic(Topic topic);

  void delete(long id);





   Messages save(Messages messages);

}
