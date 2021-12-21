package db;

import course.HaveCourse;

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
    public static ArrayList<HaveCourse> selectAll(String userID){
        DBConnection db=new DBConnection();
        String sql="select * from have_course where user_id='"+userID+"'";
        ArrayList<HaveCourse> arrayList=new ArrayList<>();
        ArrayList<Map<String,String>> rs=db.queryForList(sql);
        for (Map<String,String>map:rs) {
            int id=Integer.parseInt(map.get("id"));
            String name=map.get("name");
            String professional=map.get("professional");
            String term=map.get("term");
            String kind=map.get("kind");
            HaveCourse haveCourse=new HaveCourse(id,name,professional,term,kind);
            arrayList.add(haveCourse);
        }
        db.close();
        return arrayList;
    }
}
