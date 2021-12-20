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
 * @ClassName : CourseDAO.java
 * @createTime : 2021/12/16 19:45
 * @Email : 874280179@qq.com
 * @Description :
 */
public class CourseDAO {
    public static int insertCourse(Course course) throws SQLException {
        int i=0;
        DBConnection db=null;
        try {
            db = new DBConnection();
            String sql = "insert into course(id,name,info,professional,term,total,kind,p_id) values(" + course.getId() +
                    ",'" + course.getName() + "','" + course.getInfo() + "','" + course.getProfessional() + "','" + course.getTerm() +
                    "'," + course.getTotal() + ",'" + course.getKind() + "',"  + course.getpId() + ")";
            i = db.update(sql);
            db.close();
        }
        catch (Exception ex){
            db.rollBack();
        }
        return i;
    }

    public static ArrayList<Course> selectAll() throws SQLException {
        DBConnection db=null;
        ArrayList<Course> arrayList=null;
        try {
            db = new DBConnection();
            String sql = "select * from course";
            ArrayList<Map<String, String>> rs = db.queryForList(sql);
            arrayList = new ArrayList<>();
            for (Map<String, String> map : rs) {
                int id = Integer.parseInt(map.get("id"));
                String name = map.get("name");
                String info = map.get("info");
                String professional = map.get("professional");
                String term = map.get("term");
                int total = Integer.parseInt(map.get("total"));
                String kind = map.get("kind");
                int pId = Integer.parseInt(map.get("p_id"));
                int indexId = Integer.parseInt(map.get("index_id"));
                Course course = new Course(id, name, info, professional, term, total, kind, pId);
                course.setIndexId(indexId);
                arrayList.add(course);
            }
            db.close();
        }
        catch (Exception ex){
            db.rollBack();
        }

        return arrayList;
    }

    public static ArrayList<Course> selectAimID(int aimId){
        DBConnection db=new DBConnection();
        String sql="select * from course where id="+aimId;
        ArrayList<Map<String,String>>rs=db.queryForList(sql);
        ArrayList<Course> arrayList = new ArrayList<>();
        for (Map<String, String> map : rs) {
            int id = Integer.parseInt(map.get("id"));
            String name = map.get("name");
            String info = map.get("info");
            String professional = map.get("professional");
            String term = map.get("term");
            int total = Integer.parseInt(map.get("total"));
            String kind = map.get("kind");
            int pId = Integer.parseInt(map.get("p_id"));
            int indexId = Integer.parseInt(map.get("index_id"));
            Course course = new Course(id, name, info, professional, term, total, kind, pId);
            course.setIndexId(indexId);
            arrayList.add(course);
        }
        db.close();
        return arrayList;
    }
    public static int selectLastIDByIndexId(int indexID){
        DBConnection db=new DBConnection();
        String sql="select id from course where index_id="+indexID;
        ArrayList<Map<String,String>>rs=db.queryForList(sql);
        db.close();
        return Integer.parseInt(rs.get(0).get("id"));
    }

    public static boolean editCourse(int indexID,int lastID,int newID,Course course) throws SQLException {
        DBConnection db=null;
        try {
            db = new DBConnection();
            //将已选表内的id修改
            String sql = "update selected_course set id="+newID+" where id="+lastID;
            db.update(sql);
            //将课程表内修改
            sql="update course set id="+newID+",name='"+course.getName()+"',info='"+course.getInfo()
                    +"',professional='"+course.getProfessional()+"',term='"+course.getTerm()
                    +"',total="+course.getTotal()+",kind='"+course.getKind()+"',p_id="+course.getpId()+" where index_id="+indexID;
            db.update(sql);
            db.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
            db.rollBack();
            return false;
        }
        return true;
    }

    public static boolean deleteCourse(int id) throws SQLException {
        DBConnection db=null;
        try {
            db = new DBConnection();
            //删除已选表内的id
            String sql = "delete from selected_course where id="+id;
            db.update(sql);
            //将课程表内修改
            sql="delete from course where id="+id;
            db.update(sql);
            db.close();
        }
        catch (Exception ex){
            ex.printStackTrace();
            db.rollBack();
            return false;
        }
        return true;
    }
}
