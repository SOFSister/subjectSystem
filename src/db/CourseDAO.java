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
 * @ClassName : CourseDAO.java
 * @createTime : 2021/12/16 19:45
 * @Email : 874280179@qq.com
 * @Description :
 */
public class CourseDAO {
    public static int insertCourse(Course course) {
        DBConnection db = new DBConnection();
        String sql = "insert into course(id,name,info,professional,term,total,kind,selected,p_id) values(" + course.getId() +
                ",'" + course.getName() + "','" + course.getInfo() + "','" + course.getProfessional() + "','" + course.getTerm() +
                "'," + course.getTotal() + ",'" + course.getKind() + "'," + course.getSelected() + "," + course.getpId() + ")";
        int i = db.update(sql);
        db.close();
        return i;
    }

    public static ArrayList<Course> selectAll() {
        DBConnection db = new DBConnection();
        String sql = "select * from course";
        ArrayList<Map<String, String>> rs = db.queryForList(sql);
        ArrayList<Course> arrayList = new ArrayList<>();
        for (Map<String, String> map : rs) {
            int id = Integer.parseInt(map.get("id"));
            String name = map.get("name");
            String info = map.get("info");
            String professional = map.get("professional");
            String term = map.get("term");
            int total = Integer.parseInt(map.get("total"));
            String kind = map.get("kind");
            int selected = Integer.parseInt(map.get("selected"));
            int pId = Integer.parseInt(map.get("p_id"));
            Course course = new Course(id, name, info, professional, term, total, kind, selected, pId);
            arrayList.add(course);
        }
        db.close();
        return arrayList;
    }
}
