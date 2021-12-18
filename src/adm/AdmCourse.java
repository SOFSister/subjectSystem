package adm;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : adm
 * @ClassName : AdmCourse.java
 * @createTime : 2021/12/18 23:12
 * @Email : 874280179@qq.com
 * @Description :
 */
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import course.Course;
import db.AdmDAO;
import db.CourseDAO;
import db.DBConnection;
import org.apache.commons.codec.digest.DigestUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import java.util.Date;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/adm/AdmCourse")
public class AdmCourse extends HttpServlet{
    public AdmCourse() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action=request.getParameter("action");
        if(action.equals("insertCourse")){
            insertCourse(request,response);
        }
    }
    protected void insertCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=utf-8");
        request.setCharacterEncoding("UTF-8");
        int id= Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String info=request.getParameter("info");
        String professional=request.getParameter("professional");
        String term=request.getParameter("term");
        int total=Integer.parseInt(request.getParameter("total"));
        String kind=request.getParameter("kind");
        int selected=Integer.parseInt(request.getParameter("selected"));
        int pId=Integer.parseInt(request.getParameter("p_id"));
        Course course=new Course(id,name,info,professional,term,total,kind,selected,pId);
        JsonObject jsonContainer =new JsonObject();
        if(CourseDAO.insertCourse(course) ==0){
            jsonContainer.addProperty("success",false);
        }
        else{
            jsonContainer.addProperty("success",true);
        }
        PrintWriter writer = response.getWriter();
        writer.write(new Gson().toJson(jsonContainer));
        writer.flush();
    }
}
