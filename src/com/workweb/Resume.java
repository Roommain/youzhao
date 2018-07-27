package com.workweb;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/resume")
public class Resume extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws
            ServerException,IOException{
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        PrintWriter out=resp.getWriter();
        String realName=req.getParameter("realName");
        String phone=req.getParameter("phone");
        String email=req.getParameter("email");
        String skill=req.getParameter("skill");
        String school=req.getParameter("school");
        String maxEducation=req.getParameter("maxEducation");
        System.out.print(maxEducation);
        String major=req.getParameter("major");
        String enddate=req.getParameter("endDate");
        String project=req.getParameter("project");
        String award=req.getParameter("award");
        String compusExperise=req.getParameter("compusExperise");
        String id = req.getParameter("id");
        System.out.print("ggasjkdahdjh"+id);
        Cookie[] cookie=req.getCookies();
        String username=null;
        for(int i=0;i<cookie.length;i++){
            if (cookie[i].getName().equals("username")){
                username=cookie[i].getValue();
            }
        }
        if(username==null){
            out.println("<script language=javascript>alert('请先登录')");
            out.println("location.href='login.jsp'</script>");
        }
        //查询用户数据
        String Authentication="select username,usertype from cqupt_user where username='"+username+"'";

        try {
            ResultSet Authen=Jdbcconn.getInstance().executeQuery(Authentication);
            if(Authen.next()) {
                String type=Authen.getString("usertype");
                System.out.println(type);
                if(!(type.equals("学生"))){
                    out.println("<script language = javascript>alert('你的身份不是学生，不能录入信息');");
                    out.println("location.href='index.jsp'</script>");//等待替代网站
                }else {
                    String sql = "insert into cqupt_resume values(recruit_id.nextval,'" + realName + "','" + phone + "','" + email + "','" + major + "'," +
                            "'" + school + "','" + skill + "',to_date('" + enddate + "','yyyy-mm-dd'),'" + award + "','" + project + "','" + compusExperise + "',sysdate,'" + username + "','" + maxEducation + "',"+id+")";
                    //需要先获取招聘信息id
                    Boolean rs = Jdbcconn.getInstance().executeUpdata(sql);

                    if (rs) {
                        out.println("<script language = javascript>alert('个人信息提交成功');");
                        out.println("location.href='more_person.jsp'</script>");//等待替代网站
                    } else {
                        out.println("<script language = javascript>alert('个人信息提交失败，请重新填写');");
                        out.println("location.href='Resume.jsp'</script>");
                    }
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
