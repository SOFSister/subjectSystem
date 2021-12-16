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
 * @ClassName : AdmDAO.java
 * @createTime : 2021/12/15 22:21
 * @Email : 874280179@qq.com
 * @Description :
 */
public class AdmDAO {
    public static int selectAdmInfo(int id,String pwd){
        DBConnection db=new DBConnection();
        String sql="select * from adm_info where id="+id+" and pwd='"+pwd+"'";
        ArrayList<Map<String,String>>rs=db.queryForList(sql);
        db.close();
        return rs.size();
    }
}
