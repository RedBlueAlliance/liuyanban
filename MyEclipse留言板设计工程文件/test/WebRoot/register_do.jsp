<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
String leixing=request.getParameter("leixing");
String uname=request.getParameter("uname");
String upass=request.getParameter("upass");
String usex=request.getParameter("usex");
String uage=request.getParameter("uage");
String ulevel=request.getParameter("ulevel");
String uaddress=request.getParameter("uaddress");
String umail=request.getParameter("umail");
String uemail=request.getParameter("uemail");
String uphone=request.getParameter("uphone");
String DBDRIVER = "com.mysql.jdbc.Driver";
String DBURL = "jdbc:mysql://localhost:3306/test?characterEncoding=utf-8";
String DBUSER = "root";
String DBPASSWORD = "0906160203";
Connection con=null;
boolean flag=false;

if (leixing.equals("putongyonghu")) {
try
{
Class.forName(DBDRIVER);
con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
PreparedStatement stmt = con.prepareStatement("insert into putongyonghu values(?,?,?,?,?,?,?,?,?)");
stmt.setString(1,uname);
stmt.setString(2,upass);
stmt.setString(3,usex);
stmt.setInt(4,Integer.parseInt(uage));
stmt.setString(5,ulevel);
stmt.setString(6,uaddress);
stmt.setString(7,umail);
stmt.setString(8,uemail);
stmt.setString(9,uphone);
int row=stmt.executeUpdate();
if(row==1)
{

session.setAttribute("uname",uname);
session.setAttribute("upass",upass);
session.setAttribute("usex",usex);
session.setAttribute("uage",uage);
session.setAttribute("ulevel",ulevel);
session.setAttribute("uaddress",uaddress);
session.setAttribute("umail",umail);
session.setAttribute("uemail",uemail);
session.setAttribute("uphone",uphone);
flag=true;
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
try
{
con.close();
}
catch(Exception e)
{
e.printStackTrace();
}
}}else{
try
{
Class.forName(DBDRIVER);
con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
PreparedStatement stmt = con.prepareStatement("insert into guanliyuan values(?,?,?,?,?,?,?,?,?)");
stmt.setString(1,uname);
stmt.setString(2,upass);
stmt.setString(3,usex);
stmt.setInt(4,Integer.parseInt(uage));
stmt.setString(5,ulevel);
stmt.setString(6,uaddress);
stmt.setString(7,umail);
stmt.setString(8,uemail);
stmt.setString(9,uphone);
int row=stmt.executeUpdate();
if(row==1)
{

session.setAttribute("uname",uname);
session.setAttribute("upass",upass);
session.setAttribute("usex",usex);
session.setAttribute("uage",uage);
session.setAttribute("ulevel",ulevel);
session.setAttribute("uaddress",uaddress);
session.setAttribute("umail",umail);
session.setAttribute("uemail",uemail);
session.setAttribute("uphone",uphone);
flag=true;
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
if(flag)
{
response.sendRedirect("showinfo.jsp");
}
else
{
response.sendRedirect("errorpage.jsp");
}
%>