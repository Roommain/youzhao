package com.workweb;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oracle.jdbc.driver.OracleDriver;

@WebServlet("/addrecruit")
public class Addrecruit extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String campanyname=req.getParameter("campanyname");
        String treatment=req.getParameter("treatment");
        String describe=req.getParameter("describe");
        String requirement=req.getParameter("requirement");
        String interviewdate=req.getParameter("interviewdate");
        String place=req.getParameter("place");
        String phone=req.getParameter("phone");
        String enddate=req.getParameter("enddate");
        String workplace=req.getParameter("workplace");
        String publisher=req.getParameter("publisher");
        Cookie[] cookie=req.getCookies();
        String username=null;
        for(int i=0;i<cookie.length;i++){
            if (cookie[i].getName().equals("username")){
                username=cookie[i].getValue();
            }
        }
        if(username==null){
            out.println("<script language = javascript>alert('请先登录');");
            out.println("location.href='login.jsp'</script>");
        }
        else{
            try{
                DriverManager.registerDriver(new OracleDriver());
                String url = "jdbc:oracle:thin:@127.0.0.1:1521/orcl";
                Connection conn = DriverManager.getConnection(url, "system", "123456");
                Statement st = conn.createStatement();
                String update="insert into cqupt_recruit values(recruit_id.nextval，'"+campanyname+"','"+treatment+"','"+describe+"','"+requirement+
                        "',to_date('"+interviewdate+"','yyyy-mm-dd'),'"+place+"','"+phone+ "',to_date('"+enddate+"','yyyy-mm-dd'),'"+workplace+"','"+username+"','"+publisher+"',sysdate)";
                int rs= st.executeUpdate(update);
                if(rs>0){
                    out.println("<script language = javascript>alert('招聘信息发布成功');");
                    out.println("location.href='more.jsp'</script>");
                }
                else{
                    out.println("<script language = javascript>alert('招聘信息发布失败,请重新填写');");
                    out.println("location.href='add.jsp'</script>");
                }
                st.close();
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
}

