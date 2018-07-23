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

@WebServlet("/login")
public class Login extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String uname = req.getParameter("account");
        String pwd = req.getParameter("password");
        if(uname.equals("")) {
            out.println("<script language = javascript>alert('用户名为空');");
            out.println("location.href='login.jsp'</script>");
        }
        if(pwd.equals("")) {
            out.println("<script language = javascript>alert('密码为空');");
            out.println("location.href='login.jsp'</script>");
        }
        try {
            DriverManager.registerDriver(new OracleDriver());
            String url = "jdbc:oracle:thin:@127.0.0.1:1521/orcl";
            Connection conn = DriverManager.getConnection(url, "system", "123456");
            //System.out.println(conn);
            Statement st = conn.createStatement();
            //System.out.println(st);
            String sql = "SELECT * FROM system.cqupt_user where username='"+uname+"'";

            ResultSet rs = st.executeQuery(sql);
            //System.out.println(rs);
            if(rs.next()) {
                String password = rs.getString("password");
                if (pwd.equals(password)) {
                    out.println("<script language = javascript>alert('登录成功');");
                    out.println("location.href='index.jsp'</script>");//等待替换网站


                    Cookie username = new Cookie("username", uname);
                    resp.addCookie(username);

//                    Cookie cookie = new Cookie("username", uname);
                    Cookie cookie1=new Cookie("cookie1","1");
                    username.setMaxAge(-1);
                    cookie1.setMaxAge(-1);
//                    resp.addCookie(cookie);
                    resp.addCookie(cookie1);
                } else {
                    out.println("<script language = javascript>alert('登录失败，密码错误');");
                    out.println("location.href='login.jsp'</script>");
                }
            }
            else {
                out.println("<script language = javascript>alert('用户名不存在');");
                out.println("location.href='login.jsp'</script>");
            }
            rs.close();
            st.close();
            conn.close();
        } catch (SQLException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }

    }
}

