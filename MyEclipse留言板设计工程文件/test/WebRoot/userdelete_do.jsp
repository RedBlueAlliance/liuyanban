<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <title>留言管理</title>
    </head>
    <body>
    <center>
        <h1>留言板设计</h1>
        <hr>
        <br>
        <%
            if (session.getAttribute("uname") != null) {
        %>	
        <%!
            String DBDRIVER = "com.mysql.jdbc.Driver";
            String DBURL = "jdbc:mysql://localhost:3306/test?characterEncoding=utf-8";
            String DBUSER = "root";
            String DBPASSWORD = "0906160203";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
        %>
        <%
            String uname=null;
            try {
                uname = request.getParameter("uname");
            } catch (Exception e) {
            }
        %>
        <%
            String sql = "DELETE FROM putongyonghu WHERE uname=?";
            boolean flag = false;
            try {
                Class.forName(DBDRIVER);
                conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, uname);
                pstmt.executeUpdate();
                pstmt.close();
                conn.close();
                flag = true;
            } catch (Exception e) {
            }
        %>
        <%
            response.setHeader("refresh", "3;URL=queryuser.jsp");
            if (flag) {
        %>
                       用户删除成功，三秒后跳转到留言列表页！！！<br>
                       如果没有跳转，请按<a href="queryuser.jsp">这里</a>！！！
        <%
        } else {
        %>
       
                      用户删除失败，三秒后跳转到留言列表页！！！<br>
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