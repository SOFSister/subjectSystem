package db;

import course.Course;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : db
 * @ClassName : SelectedCourseDAO.java
 * @createTime : 2021/12/19 15:24
 * @Email : 874280179@qq.com
 * @Description :
 */
public class SelectedCourseDAO {
    public static ArrayList<Integer> selectAimUserId(String aimUserId){
        DBConnection db=new DBConnection();
        String sql="select id from selected_course where user_id='"+aimUserId+"'";
        ArrayList<Map<String, String>> rs = db.queryForList(sql);
        ArrayList<Integer> arrayList=new ArrayList<>();
        for (Map<String, String> map : rs) {
            int id= Integer.parseInt(map.get("id"));
            arrayList.add(id);
        }
        db.close();
        return arrayList;
    }
    public static int selectAimId(int aimId){
        DBConnection db=new DBConnection();
        String sql="select * from selected_course where id="+aimId+"";
        ArrayList<Map<String, String>> rs = db.queryForList(sql);
        db.close();
        return rs.size();
    }
}
