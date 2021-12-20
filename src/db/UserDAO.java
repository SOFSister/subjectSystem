package db;

import course.Course;
import user.User;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : db
 * @ClassName : UserDAO.java
 * @createTime : 2021/12/20 10:30
 * @Email : 874280179@qq.com
 * @Description :
 */
public class UserDAO {
    public static int insertUserInfo(User user){
        DBConnection db=new DBConnection();
        String sql="insert into user_info(user_id,name,college,professional,phone,pwd) values('"+user.getUserId()
                +"','"+user.getName()+"','"+user.getCollege()+"','"+user.getProfessional()+"','"+user.getPhone()+"','"+user.getPwd()+"')";
        int i=db.update(sql);
        db.close();
        return i;
    }
    public static int selectAimUserId(String id){
        DBConnection db=new DBConnection();
        String sql="select * from user_info where user_id='"+id+"'";
        ArrayList<Map<String,String>>rs=db.queryForList(sql);
        db.close();
        return rs.size();
    }
    public static int selectLogin(String id,String pwd){
        DBConnection db=new DBConnection();
        String sql="select * from user_info where user_id='"+id+"' and pwd='"+pwd+"'";
        ArrayList<Map<String,String>>rs=db.queryForList(sql);
        db.close();
        return rs.size();
    }
    public static User selectById(String id){
        User user=null;
        try {
            DBConnection db=new DBConnection();
            String sql="select * from user_info where user_id='"+id+"'";
            ArrayList<Map<String,String>>rs=db.queryForList(sql);
            String userId=rs.get(0).get("user_id");
            String name=rs.get(0).get("name");
            String college=rs.get(0).get("college");
            String professional=rs.get(0).get("professional");
            String phone=rs.get(0).get("phone");
            String pwd=rs.get(0).get("pwd");
            db.close();
            user=new User(userId,name,college,professional,phone,pwd);
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return user;
    }
    public static int updateUser(User user){
        DBConnection db=new DBConnection();
        String sql="update user_info set name='"+user.getName()+"',college='"+user.getCollege()+"',professional='"+user.getProfessional()
                +"',phone='"+user.getPhone()+"',pwd='"+user.getPwd()+"' where user_id='"+user.getUserId()+"'";
        int i=db.update(sql);
        db.close();
        return i;
    }
}
