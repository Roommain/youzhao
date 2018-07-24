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
    String sql="delete CQUPT_RECRUIT where ID="+request.getParameter("id");
    boolean dele=connection.executeUpdata(sql);
    if(dele)
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

