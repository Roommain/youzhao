<%@ page contentType="text/html; charset=GB2312"%>
<jsp:useBean id="connection" scope="page" class="com.workweb.Jdbcconn" />
<html>
<head>
    <title>
        É¾³ý
    </title>
</head>
<body bgcolor="#ffffff">

<%
    String sql1="delete CQUPT_resume where recruitid="+request.getParameter("id");
    boolean dele1=connection.executeUpdata(sql1);
    String sql2="delete CQUPT_RECRUIT where ID="+request.getParameter("id");
    boolean dele2=connection.executeUpdata(sql2);
    if(dele1&dele2)
    {
%>
<script language="javascript">

    alert("É¾³ý³É¹¦£¡£¡£¡");
</script>
<%
    response.sendRedirect("more.jsp");
}else
{
%>
<script language="javascript">
    alert("É¾³ýÊ§°Ü£¡£¡£¡");
    history.back();
</script>
<%
    }
%>
</body>
</html>

