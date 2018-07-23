package com.workweb;

import oracle.jdbc.driver.OracleDriver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class Jdbcconn {

    private static Jdbcconn instance = new Jdbcconn();

    public static Jdbcconn getInstance() {
        return instance;
    }

    private Connection conn = null;  //定义连接的对象
    private Statement st = null;	//设置Statement类的对象
    private ResultSet rs=null;
    private String url = "jdbc:oracle:thin:@127.0.0.1:1521/orcl"; // URL地址
    public  Jdbcconn(){
        try {
            DriverManager.registerDriver(new OracleDriver());
            conn = DriverManager.getConnection(url, "system", "123456"); // 加载数据库
            System.out.println("加载成功");
        } catch (Exception ex) {
            System.out.println("数据库加载失败");
        }
    }
    public ResultSet executeQuery(String sql) {
        try {
            st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            rs = st.executeQuery(sql);     					//执行对数据库的查询操作
            //st.close();
            //conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Query Exception");				//在控制台中输入异常信息
        }
        return rs;                  //将查询的结果通过return关键字返回
    }
    public boolean executeUpdata(String sql) {
        try {
            st = conn.createStatement();	//创建声明对象连接
            st.executeUpdate(sql);          //执行添加、修改、删除操作
            //st.close();
            //conn.close();
            return true;                     //如果执行成功则返回true
        } catch (Exception e) {
            e.printStackTrace();
            return false;                           //如果执行成功则返回false
        }
    }
    protected void close()
    {
        try{
            st.close();
            conn.close();
            System.out.print("关闭连接");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}

