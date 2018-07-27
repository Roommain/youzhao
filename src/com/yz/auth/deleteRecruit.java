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
import java.sql.SQLClientInfoException;
import java.sql.SQLException;


@WebServlet("/deleteRec")
public class deleteRecruit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        String id = req.getParameter("id");

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
            try {
                String Auth = "select username from cqupt_recruit where id='" + id + "'";
                ResultSet AuthResume = Jdbcconn.getInstance().executeQuery(Auth);
                if (AuthResume.next()) {
                    String type=AuthResume.getString("username");
                    if(type.equals(username)){
                        //雇主页面
                        out.println("<script language = javascript>");
                        out.println("location.href='delete.jsp?id="+id+"'</script>");
                    }
                    else{
                        //学生页面
                        out.println("<script language = javascript>alert('没有删除权限');");
                        out.println("location.href='more.jsp'</script>");
                    }
                }
            }catch (SQLException e){
                e.printStackTrace();
            }

            //out.println("location.href='resumeMore.jsp'</script>");

        }

    }
}

