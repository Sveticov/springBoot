package forum.service;

import forum.model.NewUser;
import forum.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceUser {
    @Autowired
    UserRepository repository;

    NewUser userLocal;

    public NewUser getUserLocal() {
        return userLocal;
    }

    public void setUserLocal(NewUser userLocal) {
        this.userLocal = userLocal;
    }

    public NewUser findOneUser(long id){
        return repository.findOne(id);
    }

    public void addUser(NewUser user){
        repository.save(user);
    }


    public List<NewUser> findAllUser(){
        return (List<NewUser>) repository.findAll();
    }
}
