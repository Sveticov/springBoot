package forum.web_resources;

public class WebResourcesTopic {
    private String status;
    private Object data;

    public WebResourcesTopic(String status, Object data) {
        this.status = status;
        this.data = data;
    }

    public WebResourcesTopic() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
