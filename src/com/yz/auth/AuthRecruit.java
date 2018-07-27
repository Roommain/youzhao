package com.yz.auth;
import com.workweb.Jdbcconn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/authrecruit")
public class AuthRecruit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();


        Cookie[] cookie = req.getCookies();
        String username = null;
        for (int i = 0; i < cookie.length; i++) {
            if (cookie[i].getName().equals("username")) {
                username = cookie[i].getValue();
            }
        }
        if (username == null) {
            out.println("<script language = javascript>alert('请先登录');");
            out.println("location.href='login.jsp'</script>");
        } else {
            try {
                String Auth = "select usertype from cqupt_user where username='" + username + "'";
                ResultSet AuthRecruit = Jdbcconn.getInstance().executeQuery(Auth);
                if (AuthRecruit.next()) {
                    String type = AuthRecruit.getString("usertype");
                    if(type.equals("雇主")){
                        //雇主页面
                        out.println("<script language = javascript>");
                        out.println("location.href='add.jsp'</script>");
                    }else {
                        out.println("<script language = javascript>alert('没有权限发布招聘信息')");
                        out.println("location.href='index.jsp'</script>");
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}