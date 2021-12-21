package db;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : db
 * @ClassName : HaveCourseDAO.java
 * @createTime : 2021/12/21 11:35
 * @Email : 874280179@qq.com
 * @Description :
 */
public class HaveCourseDAO {
    public static int selectAim(int id,String userID){
        DBConnection db=new DBConnection();
        String sql="select * from have_course where id="+id+" and user_id='"+userID+"'";
        ArrayList<Map<String,String>> rs=db.queryForList(sql);
        db.close();
        return rs.size();
    }
}
