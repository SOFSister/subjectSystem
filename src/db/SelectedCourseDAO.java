package db;

import course.Course;

import java.sql.SQLException;
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
    public static int selectAim(int aimId,String userId){
        DBConnection db=new DBConnection();
        String sql="select * from selected_course where id="+aimId+" and user_id='"+userId+"'";
        ArrayList<Map<String, String>> rs = db.queryForList(sql);
        db.close();
        return rs.size();
    }
    public static boolean addSelectedCourse(String userId,int id,boolean flag) throws SQLException {
        DBConnection db=null;
        String sql="";
        try{
            db=new DBConnection();
            if(flag){
                sql="select version from course where id="+id+" and flag= '是'";
            }
            else{
                sql="select version from course where id="+id;
            }
            ArrayList<Map<String,String>>rs=db.queryForList(sql);
            if(rs.size()==0){
                throw new Exception("用户与管理员并发");
            }
            int version=Integer.parseInt(rs.get(0).get("version"));
            sql="select (select total margin from course c where c.id="+id+" and c.version="+version+")-(select count(distinct user_id) margin from course c,selected_course sc where c.id="+id+" and c.version="+version+" and sc.id=c.id) margin;";
            rs=db.queryForList(sql);
            int margin=0;
            if(rs.size()==0){
                throw new Exception("并发");
            }
            else {
                System.out.println("margin:"+rs.get(0).get("margin"));
                margin=Integer.parseInt(rs.get(0).get("margin"));
                if(margin<=0){
                    throw new Exception("用户与用户并发");
                }
            }
            //加课
            sql="insert into selected_course(user_id,id) values('"+userId+"',"+id+")";
            db.update(sql);
            sql="update course set version=version+1 where id="+id+" and version="+version;
            int i=db.update(sql);
            if(i==0){
                throw new Exception("用户与用户并发");
            }
            db.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
            db.rollBack();
            db.close();
            return false;
        }
        return true;
    }
    public static boolean deleteCourse(String userID,int id){
        DBConnection db=new DBConnection();
        String sql="delete from selected_course where user_id='"+userID+"' and id="+id;
        int i=db.update(sql);
        db.close();
        if(i>0)
            return true;
        return false;
    }
}
