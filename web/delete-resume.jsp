<%@ page contentType="text/html; charset=GB2312"%>
<jsp:useBean id="connection" scope="page" class="com.workweb.Jdbcconn" />
<html>
    <head>
        <title>
            ����ɾ��
        </title>
    </head>
    <body bgcolor="#ffffff">
        <%
            String sql="delete cqupt_resume where ID="+request.getParameter("id");
            boolean dele=connection.executeUpdata(sql);
            if(dele)
            {
        %>
        <script language="javascript">

            alert("ɾ���ɹ�������");
        </script>
        <%
            response.sendRedirect("more_person.jsp");
        }else
        {
        %>
        <script language="javascript">
            alert("ɾ��ʧ�ܣ�����");
            history.back();
        </script>
        <%
            }
        %>
    </body>
</html>

