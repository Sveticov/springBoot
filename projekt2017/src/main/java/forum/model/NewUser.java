package forum.model;

import javax.persistence.*;
import java.util.Set;

@Entity
public class NewUser {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long user_id;
    private String name;
    private String password;
    @OneToMany(mappedBy = "newUser", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Messages> messages;

    public NewUser(String name, String password) {
        this.name = name;
        this.password = password;

    }
    public NewUser() {

    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Messages> getMessages() {
        return messages;
    }

    public void setMessages(Set<Messages> messages) {
        this.messages = messages;
    }



}
