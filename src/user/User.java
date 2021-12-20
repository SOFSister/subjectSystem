package user;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : user
 * @ClassName : User.java
 * @createTime : 2021/12/20 10:32
 * @Email : 874280179@qq.com
 * @Description :
 */
public class User {
    private String userId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    private String name;
    private String college;
    private String professional;
    private String phone;
    private String pwd;
    public User(String userId,String name,String college,String professional,String phone,String pwd){
        this.userId=userId;
        this.name=name;
        this.college=college;
        this.professional=professional;
        this.phone=phone;
        this.pwd=pwd;
    }
}
