package adm;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : adm
 * @ClassName : AdmLogin.java
 * @createTime : 2021/12/15 19:38
 * @Email : 874280179@qq.com
 * @Description :
 */
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import db.AdmDAO;
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
@WebServlet("/adm/html/AdmLogin")
public class AdmLogin extends HttpServlet{
    public AdmLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("application/json;charset=utf-8");
        request.setCharacterEncoding("UTF-8");
        int id;
        try {
            id= Integer.parseInt(request.getParameter("id"));
        }
        catch (Exception ex){
            id=-1;
        }
        String pwd=request.getParameter("pwd");
        JsonObject jsonContainer =new JsonObject();

        if(AdmDAO.selectAdmInfo(id,pwd)==0){
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