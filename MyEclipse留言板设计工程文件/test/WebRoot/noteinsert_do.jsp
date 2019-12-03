<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <title>留言板管理</title>
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
            Statement stmt = null;
        %>
        <%
            boolean flag = false;
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String content = request.getParameter("content");
            String uname = (String)session.getAttribute("uname");
        %>
        <%
            String sql = "INSERT INTO note(title,author,content,uname)"
                    + " VALUES ('" + title + "','"
                    + author + "','"
                    + content + "','"
                    + uname +"')";
            try {
                Class.forName(DBDRIVER);
                con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                stmt = (Statement) con.createStatement();
                stmt.executeUpdate(sql);
                stmt.close();
                con.close();
                flag = true;

            } catch (Exception e) {
                System.out.println("数据库连接失败：" + e.getMessage());
            }
        %>
        <%
            response.setHeader("refresh", "3;URL=list_notes.jsp");
            if (flag) {
        %>
        留言添加成功，三秒后跳转到留言列表页！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
        <hr>
        <%
        } else {
        %>
        留言添加失败，三秒后跳转到留言列表页！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
        <hr>
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
        <hr>
        <%
            }
        %>
    </center>
</body>
</html>