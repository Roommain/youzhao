package com.workweb;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/reviseResume")
public class ReviseResume extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException,IOException{
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out=resp.getWriter();

        String realname=req.getParameter("realname");
        String phone=req.getParameter("phone");
        String email=req.getParameter("email");
        String skill=req.getParameter("skill");
        String school=req.getParameter("school");
        String education=req.getParameter("maxEducation");
        String major=req.getParameter("major");
        String endate=req.getParameter("enddate");
        String project=req.getParameter("project");
        String award=req.getParameter("award");
        String campusexperience=req.getParameter("compusExperise");
        String id = req.getParameter("id");

        Cookie[] cookie=req.getCookies();
        String username=null;
        for(int i=0;i<cookie.length;i++){
            if (cookie[i].getName().equals("username")){
                username=cookie[i].getValue();
            }
        }
        String UPDATE="update cqupt_resume set skill='"+skill+"',school='"+school+"',major='"+major+"',realname='"+realname+"',phone='"+phone+"',email='"+email+"',enddate=to_date('"+endate+"','yyyy-mm-dd'),award='"+award+"',project='"+project+"',CAMPUSEXPERIENCE='"+campusexperience+"',systemtime=sysdate,username='"+username+"',education='"+education+"' where id="+id+"";

        System.out.println(UPDATE);

        boolean rs=Jdbcconn.getInstance().executeUpdata(UPDATE);
        if (rs){
            out.println("<script language = javascript>alert('修改成功');");
            out.println("location.href='more_person.jsp'</script>");//等待替代网站
        }
        else{
            out.println("<script language = javascript>alert('修改失败');");
            out.println("location.href='more_person.jsp'</script>");
        }
    }

}

