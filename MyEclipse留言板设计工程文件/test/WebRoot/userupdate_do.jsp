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
            request.setCharacterEncoding("UTF-8");
        %>
        <%
            if (session.getAttribute("uname") != null) {
        %>
        <%!
            String DBDRIVER = "com.mysql.jdbc.Driver";
            String DBURL = "jdbc:mysql://localhost:3306/test?characterEncoding=utf-8";
            String DBUSER = "root";
            String DBPASSWORD = "0906160203";
            Connection con = null;
            PreparedStatement pstmt = null;
        %>
        <%
                boolean flag = false;
                String uname=null;
                String upass = request.getParameter("upass");
                String usex = request.getParameter("usex");
                int uage = Integer.parseInt(request.getParameter("uage"));
                String ulevel = request.getParameter("ulevel");
                String uaddress = request.getParameter("uaddress");
                String umail = request.getParameter("umail");
                String uemail = request.getParameter("uemail");
                String uphone= request.getParameter("uphone");
            try {
               uname = request.getParameter("uname");
            } catch (Exception e) {
            }
        %>
        <%
            String sql = "UPDATE putongyonghu set uname=?,upass=?,usex=?,uage=?,ulevel=?,uaddress=?,umail=?,uemail=?,uphone=? WHERE uname=?";
            try {
                Class.forName(DBDRIVER);
                con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, uname);
                pstmt.setString(2, upass);
                pstmt.setString(3, usex);
                pstmt.setInt(4, uage);
                pstmt.setString(5,ulevel);
                pstmt.setString(6, uaddress);
                pstmt.setString(7, umail);
                pstmt.setString(8, uemail);
                pstmt.setString(9, uphone);
                pstmt.setString(10, uname);
                pstmt.executeUpdate();
                pstmt.close();
                con.close();
                flag = true;
            } catch (Exception e) {
            }
        %>
        <%
            response.setHeader("refresh", "3;URL=queryuser.jsp");
            if (flag) {
        %>
                       用户信息修改成功，三秒后跳转到留言列表页！！！<br>
                       如果没有跳转，请按<a href="queryuser.jsp">这里</a>！！！
        <%
        } else {
        %>
                      用户信息修改失败，三秒后跳转到留言列表页！！！<br>
                      如果没有跳转，请按<a href="queryuser.jsp">这里</a>！！！
        <%
            }
        %>
        <%
        } else {
            response.setHeader("refresh", "3;URL=login.jsp");
        %>
                       您还未登陆，请先登陆！！！<br>
                       三秒后自动跳转到登陆窗口！！！<br>
                       如果没有跳转，请按<a href="login.jsp">这里</a>！！！<br>
        <%
            }
        %>
    </center>
</body>
</html>