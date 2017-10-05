package forum.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;


@Entity
public class Messages implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long mesages_id;
    private String mesage_text;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "us_mess_id")
    private NewUser newUser;

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="topic_mess_id")
    private  Topic topic;

    public Messages() {
    }

//    public Messages(String mesage_text, NewUser newUser,Topic topic) {
//        this.mesage_text = mesage_text;
//        this.newUser = newUser;
//        this.topic=topic;
//    }

    public Messages(String mesage_text) {
        this.mesage_text = mesage_text;
    }

    public long getMesages_id() {
        return mesages_id;
    }

    public void setMesages_id(long mesages_id) {
        this.mesages_id = mesages_id;
    }

    public String getMesage_text() {
        return mesage_text;
    }

    public void setMesage_text(String mesage_text) {
        this.mesage_text = mesage_text;
    }

    public NewUser getNewUser() {
        return newUser;
    }

    public void setNewUser(NewUser newUser) {
        this.newUser = newUser;
    }

    @Override
    public String toString() {
        return "Messages{" +
                "mesages_id=" + mesages_id +
                ", mesage_text='" + mesage_text + '\'' +
                ", newUser=" + newUser +
                '}';
    }
}
