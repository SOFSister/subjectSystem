package db;

import course.Course;

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
    public static int insertCourse(Course course){
        DBConnection db=new DBConnection();
        String sql="insert into course(id,name,info,professional,term,all,type,selected,p_id) values(?,?,?,?,?,?,?,?,?)";
        int i=db.update(sql);
        db.close();
        return i;
    }
}
