package forum.model;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private @Getter
    @Setter
    long admin_id;
    private @Getter
    @Setter
    String admin_name;
    private @Getter
    @Setter
    String admin_password;
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "admin_topic", joinColumns = @JoinColumn(name = "admin_id", referencedColumnName = "admin_id"),
            inverseJoinColumns = @JoinColumn(name = "topic_id", referencedColumnName = "topic_id"))
    private @Getter
    @Setter
    Set<Topic> topics;

    public Admin(String admin_name, String admin_password) {
        this.admin_name = admin_name;
        this.admin_password = admin_password;
//        this.topics = topics;
    }

    public Admin() {
    }


}
