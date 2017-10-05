package forum.repository;


import forum.model.NewUser;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserRepository extends CrudRepository<NewUser, Long> {

}
