package forum.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Topic {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private @Getter
    @Setter
    long topic_id;
    private @Getter
    @Setter
    String topic_name;
    private @Getter
    @Setter
    String description;
@ManyToMany(mappedBy = "topics")
    private  @Getter
@Setter
Set<Admin> admins;

    @OneToMany(mappedBy = "topic",orphanRemoval = true,cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private @Getter @Setter Set<Messages> messages;

    public Topic(String topic_name, String description) {
        this.description = description;
        this.topic_name = topic_name;
//        this.admins=admins;
    }

    public Topic() {
    }

    @Override
    public String toString() {
        return "Topic{" +
                "topic_id=" + topic_id +
                ", topic_name='" + topic_name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
