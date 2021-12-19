package db;

/**
 * Created with IntelliJ IDEA.
 *
 * @author : Soft_Sister
 * @version : 1.0
 * @Project : subjectSystem
 * @Package : db
 * @ClassName : DBConnection.java
 * @createTime : 2021/12/15 19:22
 * @Email : 874280179@qq.com
 * @Description :
 */
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class DBConnection {
    private Connection con=null;
    private Statement stmt=null;
    private ResultSet rs=null;
    //创建连接
    public Connection getConnection() throws NamingException, SQLException {
        Context ctx=new InitialContext();
        DataSource ds=(DataSource) ctx.lookup("java:/comp/env/jdbc/mysql");
        Connection conn= ds.getConnection();
        return conn;
    }

    public DBConnection(){
        try {
            con=getConnection();
            con.setAutoCommit(false);
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
    }
    public void rollBack() throws SQLException {
        con.rollback();
    }

    //执行查询
    public  ArrayList<Map<String,String>> queryForList(String sql){
        ArrayList<Map<String,String>> results=null;
        try {
            stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            //System.out.print(sql);
            rs=stmt.executeQuery(sql);
            if(rs!=null){
                results=new ArrayList<Map<String,String>>();
                while(rs.next()){
                    Map<String,String> result=new HashMap<String,String>();
                    ResultSetMetaData rsmd=rs.getMetaData();
                    int columnCount=rsmd.getColumnCount();
                    for(int i=1;i<=columnCount;i++){
                        String fieldName=rsmd.getColumnName(i);
                        String fieldValue=rs.getString(i);
                        result.put(fieldName, fieldValue);
                    }
                    results.add(result);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return results;
    }


    //执行更新类的SQL语句
    public int update(String sql){
        int i=0;
        try {
            stmt=con.createStatement();
            i=stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }


    //关闭相关对象
    public void close(){
        try {
            con.commit();
            if(rs!=null) rs.close();
            if(stmt!=null) stmt.close();
            if(con!=null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

