<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
String leixing=request.getParameter("leixing");
String uname=request.getParameter("uname");
String upass=request.getParameter("upass");
String DBDRIVER = "com.mysql.jdbc.Driver";
String DBURL = "jdbc:mysql://localhost:3306/test?characterEncoding=utf-8";
String DBUSER = "root";
String DBPASSWORD = "0906160203";
Connection con=null;
PreparedStatement pstmt = null;
boolean flag=false;
if (leixing.equals("putongyonghu")) {
try
{
Class.forName(DBDRIVER);
con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
pstmt = con.prepareStatement();
ResultSet result= pstmt.executeQuery("select uname from putongyonghu where uname= '"+uname+"'and upass='"+upass+"'");
if(result.next())
{
session.setAttribute("uname",result.getString("uname"));
session.setAttribute("leixing",result.getString("普通用户"));
flag=true;
}else{
request.setAttribute("err", "用户名不存在或密码不正确！！！");
}
}
catch(ClassNotFoundException e)
{
e.printStackTrace();
}
catch(SQLException e)
{
e.printStackTrace();
}
catch(Exception e)
{
e.printStackTrace();
}
finally
{
if(con!=null)
{
try
{
con.close();
}
catch(Exception e)
{
e.printStackTrace();
}
}
}}else{
try
{
Class.forName(DBDRIVER);
con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
pstmt =con.prepareStatement();
ResultSet result= pstmt.executeQuery("select uname from guanliyuan where uname= '"+uname+"'and upass='"+upass+"'");
if(result.next())
{

session.setAttribute("uname",result.getString("uname"));
session.setAttribute("leixing",result.getString("管理员"));
flag=true;
}else{
request.setAttribute("err", "用户名不存在或密码不正确！！！");
}
}
catch(ClassNotFoundException e)
{
e.printStackTrace();
}
catch(SQLException e)
{
e.printStackTrace();
}
catch(Exception e)
{
e.printStackTrace();
}
finally
{
if(con!=null)
{
try
{
con.close();
}
catch(Exception e)
{
e.printStackTrace();
}
}
}
}
if(flag)
{
response.sendRedirect("login_success.jsp");
}
else
{
response.sendRedirect("errorpage.jsp");
}
%>