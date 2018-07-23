package com.workweb;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.net.SocketPermission;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import oracle.jdbc.driver.OracleDriver;

@WebServlet("/register")
public class register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String id = req.getParameter("employeeName");
        String phone = req.getParameter("phone");
        String question = req.getParameter("question");
        String answer = req.getParameter("answer");
        String type = req.getParameter("type");
        String password = req.getParameter("password");
        String repassword = req.getParameter("rePassword");
        if (id.equals("")) {
            out.println("<script language = javascript>alert('用户名为空');");
            out.println("location.href='register.jsp'</script>");
        }
        if (phone.equals("")) {
            out.println("<script language = javascript>alert('手机号为空');");
            out.println("location.href='register.jsp'</script>");
        }
        if (answer.equals("")) {
            out.println("<script language = javascript>alert('密保问题答案为空');");
            out.println("location.href='register.jsp'</script>");
        }
        if (password.equals("")) {
            out.println("<script language = javascript>alert('密码为空');");
            out.println("location.href='register.jsp'</script>");
        }
        if (repassword.equals("")) {
            out.println("<script language = javascript>alert('确认密码为空');");
            out.println("location.href='register.jsp'</script>");
        }
        if (password.equals(repassword)) {
            System.out.println("大概成功了吧");
            try {
                DriverManager.registerDriver(new OracleDriver());
                String url = "jdbc:oracle:thin:@127.0.0.1:1521/orcl";
                Connection conn = DriverManager.getConnection(url, "system", "123456");
                Statement st = conn.createStatement();
                String update = "insert into system.cqupt_user values('" + id + "','" + password + "','" + type + "','" + phone + "','" + question + "','" + answer + "')";
                int rs= st.executeUpdate(update);
                System.out.println(rs);
                st.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (!password.equals(repassword)) {
            out.println("<script language = javascript>alert('密码前后不一致');");
            out.println("location.href='register.jsp'</script>");
        }
        try {
            DriverManager.registerDriver(new OracleDriver());
            String url = "jdbc:oracle:thin:@127.0.0.1:1521/orcl";
            Connection conn = DriverManager.getConnection(url, "system", "123456");
            Statement st = conn.createStatement();
            String Query = "select username from system.cqupt_user where username='" + id + "'";
            ResultSet rs = st.executeQuery(Query);
            if (rs.next()) {
                String name = rs.getString("username");
                if (name.equals(id)) {
                    out.println("<script language = javascript>alert('注册成功');");
                    out.println("location.href='login.jsp'</script>");
                } else {
                    System.out.println("名字没对上");
                    out.println("<script language = javascript>alert('注册失败');");
                    out.println("location.href='register.jsp'</script>");
                }
            } else {
                System.out.println("没查到东西");
                out.println("<script language = javascript>alert('注册失败');");
                out.println("location.href='register.jsp'</script>");
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}