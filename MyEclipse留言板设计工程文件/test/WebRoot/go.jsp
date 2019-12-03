<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>留言板管理登录</title>
</head>
<body>
<center>
	<h1>留言板设计</h1>
	<hr>
	<br>
	<%
		// 进行乱码处理
		request.setCharacterEncoding("UTF-8") ;
	%>
	<%   //退出对留言板的操作
		if(session.getAttribute("uname")!=null)
		{
			session.setAttribute("uname","null") ;
			session.invalidate();
			out.print("您已经成功退出，若要进行其他操作，<a href='login.jsp'>请重新登录</a>");
			out.print("<hr>");
		}
		else
		{
			out.print("您已经成功退出，若要进行其他操作，<a href='login.jsp'>请重新登录</a>");	
			out.print("<hr>");
		}
	%>
	
</center>
</body>
</html>