package com.workweb;
import java.sql.ResultSet;
import com.sun.xml.internal.ws.transport.http.HttpAdapter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.soap.SOAPPart;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/changerecruit")
public class Changerecruit extends HttpServlet {
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
        String id = req.getParameter("id");
        Cookie[] cookie=req.getCookies();

        //try {

            String username=null;
            for(int i=0;i<cookie.length;i++){
                if (cookie[i].getName().equals("username")){
                    username=cookie[i].getValue();
                }
            }
            String UPDATE="update cqupt_recruit set companyname='"+campanyname+"',treatment='"+treatment+"',describe='"+describe+"',requirement='"+requirement+"',interviewdate=to_date('"+interviewdate+"','yyyy-mm-dd')," +
                    "place='"+place+"',phone='"+phone+"',enddate=to_date('"+enddate+"','yyyy/mm/dd'),workplace='"+workplace+"',username='"+username+"',publisher='"+publisher+"',systemtime=sysdate where id="+id;
            System.out.println(UPDATE);

            System.out.print(id);
            boolean rs=Jdbcconn.getInstance().executeUpdata(UPDATE);
            if (rs){
                out.println("<script language = javascript>alert('修改成功');");
                out.println("location.href='more.jsp'</script>");//等待替代网站
            }
            else{
                out.println("<script language = javascript>alert('修改失败');");
                out.println("location.href='change.jsp'</script>");
            }
            //Jdbcconn.getInstance().close();
        //}catch (SQLException e){
        //    e.printStackTrace();
        //}

        //try {

        // }catch (SQLException e){
        // e.printStackTrace();
        // }

    }
}
