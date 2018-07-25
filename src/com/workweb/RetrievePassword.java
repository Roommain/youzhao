package com.workweb;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RetrievePassword")
public class RetrievePassword extends HttpServlet {
    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServerException,IOException{
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out =resp.getWriter();
        String name=req.getParameter("employeeName");
        String phone=req.getParameter("phone");
        String question=req.getParameter("question");
        String answer=req.getParameter("answer");
        String type=req.getParameter("type");
        String password=req.getParameter("password");
        String rePassword=req.getParameter("rePassword");

        if(password.equals(rePassword)){
            String query="select username,usertype,phone,question,answer from cqupt_user where username='"+name+"'and usertype='"+ type+"'" +
                    "and phone='"+phone+"'and " +
                    "question='"+question+"'and answer='"+answer+"'";
            ResultSet rs=Jdbcconn.getInstance().executeQuery(query);
            try {
                if(rs.next()){
                    String update="update cqupt_user set password='"+password+"' where username='"+name+"'";
                    Boolean rs_update=Jdbcconn.getInstance().executeUpdata(update);

                    if(rs_update){
                        out.println("<script language=javascript>alert('密码修改成功')");
                        out.println("location.href='login.jsp'</script>");
                    }else{
                        out.println("<script language=javascript>alert('密码修改失败')>");
                        out.println("location.href='RetrievePassword.jsp'</script>");
                    }
                }else{
                    out.println("<script language=javascript>alert('请检查信息是否正确')");
                    out.println("location.href='RetrievePassword.jsp'</script>");
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }else{
            out.println("<script language=javascript>alert('密码修改不相同')");
            out.println("location.href='RetrievePassword.jsp'</script>");
        }
    }
}
