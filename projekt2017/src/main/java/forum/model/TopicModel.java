package forum.model;

public class TopicModel extends Topic{
    private long topic_id;
    private String topic_name;
    private String description;

    public TopicModel(Long topic_id, String topic_name1, String description1) {

        this.topic_id = topic_id;
        this.topic_name = topic_name1;
        this.description = description1;
    }

    @Override
    public long getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(long topic_id) {
        this.topic_id = topic_id;
    }

    @Override
    public String getTopic_name() {
        return topic_name;
    }

    @Override
    public void setTopic_name(String topic_name) {
        this.topic_name = topic_name;
    }

    @Override
    public String getDescription() {
        return description;
    }

    @Override
    public void setDescription(String description) {
        this.description = description;
    }
}
