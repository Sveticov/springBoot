package forum.model;

public class UserModel {
    private long id;
    private String name;
    private String password;

    public UserModel() {
    }
    public UserModel(long id, String name) {
        this.id = id;
        this.name = name;
    }
    public UserModel(String name, String password) {

        this.name = name;
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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


}
