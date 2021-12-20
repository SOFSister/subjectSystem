package user;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : user
 * @ClassName : UserCourse.java
 * @createTime : 2021/12/20 9:15
 * @Email : 874280179@qq.com
 * @Description :
 */
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import course.Course;
import db.AdmDAO;
import db.CourseDAO;
import db.DBConnection;
import db.UserDAO;
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
@WebServlet({"/UserCourse","/html/UserCourse"})
public class UserCourse extends HttpServlet{
    public UserCourse(){super();}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action=request.getParameter("action");
        if(action.equals("getUserID")){
            getUserID(request,response);
        }
        else if(action.equals("register")){
            register(request,response);
        }
        else if(action.equals("login")){
            login(request,response);
        }
        else if(action.equals("getUser")){
            getUser(request,response);
        }
        else if(action.equals("updateUser")){
            updateUser(request,response);
        }
    }
    protected void getUserID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("application/json;charset=utf-8");
            request.setCharacterEncoding("UTF-8");
            HttpSession session=request.getSession();
            String userID= (String) session.getAttribute("userID");
            JsonObject jsonContainer =new JsonObject();
            if(userID!=null){
                jsonContainer.addProperty("success",true);
                jsonContainer.addProperty("userID",userID);
            }
            else{
                jsonContainer.addProperty("success",false);
            }
            PrintWriter writer = response.getWriter();
            writer.write(new Gson().toJson(jsonContainer));
            writer.flush();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    }
    protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("application/json;charset=utf-8");
            request.setCharacterEncoding("UTF-8");
            String userID= request.getParameter("id");
            String name=request.getParameter("name");
            String college=request.getParameter("college");
            String professional=request.getParameter("professional");
            String phone=request.getParameter("phone");
            String pwd=request.getParameter("pwd");
            User user=new User(userID,name,college,professional,phone,pwd);
            JsonObject jsonContainer =new JsonObject();
            if(UserDAO.selectAimUserId(userID)!=0){
                jsonContainer.addProperty("success",false);
            }
            else{
                if(UserDAO.insertUserInfo(user)!=0){
                    jsonContainer.addProperty("success",true);
                }
            }
            PrintWriter writer = response.getWriter();
            writer.write(new Gson().toJson(jsonContainer));
            writer.flush();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    }
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("application/json;charset=utf-8");
            request.setCharacterEncoding("UTF-8");
            HttpSession session=request.getSession();
            String userID= request.getParameter("id");
            String pwd=request.getParameter("pwd");
            JsonObject jsonContainer =new JsonObject();
            if(UserDAO.selectLogin(userID,pwd)!=0){
                jsonContainer.addProperty("success",true);
                session.setAttribute("userID",userID);
            }
            else{
                jsonContainer.addProperty("success",false);
            }
            PrintWriter writer = response.getWriter();
            writer.write(new Gson().toJson(jsonContainer));
            writer.flush();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    }
    protected void getUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("application/json;charset=utf-8");
            request.setCharacterEncoding("UTF-8");
            String userID= request.getParameter("id");
            User user=UserDAO.selectById(userID);
            JsonObject jsonContainer =new JsonObject();
            jsonContainer.addProperty("success",true);
            jsonContainer.addProperty("name",user.getName());
            jsonContainer.addProperty("college",user.getCollege());
            jsonContainer.addProperty("professional",user.getProfessional());
            jsonContainer.addProperty("phone",user.getPhone());
            jsonContainer.addProperty("pwd",user.getPwd());
            PrintWriter writer = response.getWriter();
            writer.write(new Gson().toJson(jsonContainer));
            writer.flush();
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    }
    protected void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("application/json;charset=utf-8");
            request.setCharacterEncoding("UTF-8");
            String userID= request.getParameter("id");
            String name=request.getParameter("name");
            String college=request.getParameter("college");
            String professional=request.getParameter("professional");
            String phone=request.getParameter("phone");
            String pwd=request.getParameter("pwd");
            User user=new User(userID,name,college,professional,phone,pwd);
            if(UserDAO.updateUser(user)>0){
                JsonObject jsonContainer =new JsonObject();
                jsonContainer.addProperty("success",true);
                PrintWriter writer = response.getWriter();
                writer.write(new Gson().toJson(jsonContainer));
                writer.flush();
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    }
}
