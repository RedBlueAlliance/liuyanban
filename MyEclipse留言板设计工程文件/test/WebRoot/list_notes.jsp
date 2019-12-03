<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<%!
    String str;
    public String subStr(String str) {
        if (str == null || "".equals(str)) {
            return "";
        }
        if (str.length() > 10)
        {
            return str;
        } else {
            return str;
        }
    }
%>

<html>
    <head>
        <title>留言板管理</title>
        <script type="text/javascript">
            //弹窗提示
            function Msg(canshu) {
                alert(canshu);
            }
        </script>

    </head>
    <body>
    <center>
        <h1>留言板设计</h1>
        <hr>
        <h2>欢迎<font color="red" size="12">
            <%=session.getAttribute("uname")%>
            <%="["%>
            <%=session.getAttribute("leixing")%>
            <%="]"%>
            </font>光临留言板</h2>
            <hr>
        <h3>全部留言信息</h3>
            
        <br>
        <%
            request.setCharacterEncoding("UTF-8");
            if (session.getAttribute("uname") != null) {
        %>
        <%!
            String DBDRIVER = "com.mysql.jdbc.Driver";
            String DBURL = "jdbc:mysql://localhost:3306/test?characterEncoding=utf-8";
            String DBUSER = "root";
            String DBPASSWORD = "0906160203";
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
        %>
        <%
            int i = 0;
            String sql = null;
            String keyword = request.getParameter("keyword");
            if (keyword == null) {
                sql = "SELECT id,title,author,content,uname FROM note";
            } else {
                sql = "SELECT id,title,author,content,uname FROM note WHERE title like ? or author like ? or content like ?or uname like ?";
            }
            try {
                Class.forName(DBDRIVER);
                con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = con.prepareStatement(sql);
                if (keyword != null) {
                    pstmt.setString(1, "%" + keyword + "%");
                    pstmt.setString(2, "%" + keyword + "%");
                    pstmt.setString(3, "%" + keyword + "%");
                    pstmt.setString(4, "%" + keyword + "%");
                }
                rs = pstmt.executeQuery();
        %>
        
        <form action="list_notes.jsp" method="POST">请输入查询内容：<input type="text" name="keyword">
            <input type="submit" value="查询">
        </form>
        
            <%
        if (session.getAttribute("leixing").equals("普通用户")) {
    %>
    </h4><a href="insert.jsp">添加新留言</a>
    <a href="mylist_notes.jsp">查看我的留言</a>
    <a href="showinfo.jsp">查看我的用户信息</a>
    <a href="go.jsp">退出留言系统</a><br><br></h4>

<table width="90%" border="3" >
    <tr>
        <td>留言ID</td>
        <td>标题</td>
        <td>作者</td>
        <td>内容</td>
        <td>用户名</td>
        <td>删除</td>
        <td>编辑</td>
    </tr>
    <%
        while (rs.next()) {
            i++;
            int id = rs.getInt(1);
            String title = rs.getString(2);
            String author = rs.getString(3);
            String content = rs.getString(4);
            String uname = rs.getString(5);
            if (keyword != null) {
                title = title.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                author = author.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                content = content.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                uname = uname.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
            }
    %>
    <tr>
        <td><%=id%><br></td>
        <td><%=title%><br></td>
        <td><%=author%><br></td>
        <td style="height:20px;">　 <%=subStr(content)%></td>
        <td><%=uname%><br></td>
        <td><a href="#" onclick="Msg('管理员才可以进行删除操作')";>删除</a></td>
        <td><a href="#" onclick="Msg('管理员才可以进行编辑操作')";>编辑</td>
    </tr>

    <%
        }
        if (i == 0) {
    %>
    <tr>
        <td colspan="7">没有任何内容！！！</td>
    </tr>
    <%
        }
    %>
</table>
<%
} else {
%>
</h4><a href="noteinsert.jsp">添加新留言</a>
        <a href="mylist_notes.jsp">查看我的留言</a>
        <a href="queryuser.jsp">查看所有用户信息</a>
        <a href="go.jsp">退出留言系统</a><br><br></h4>
    
<table width="90%" border="3">
    <tr>
        <td>留言ID</td>
        <td>标题</td>
        <td>作者</td>
        <td>内容</td>
        <td>用户名</td>
        <td>删除</td>
        <td>编辑</td>
    </tr>
    <%
        while (rs.next()) {
            i++;
                            // 进行循环打印，打印出所有的内容，以表格形式
            // 从数据库中取出内容
            int id = rs.getInt(1);
            String title = rs.getString(2);
            String author = rs.getString(3);
            String content = rs.getString(4);
            String uname = rs.getString(5);

            if (keyword != null) {
                // 需要将数据返红
                title = title.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                author = author.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                content = content.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
                uname = uname.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
            }
    %>
    <tr>
        <td><%=id%><br></td>
        <td><%=title%></a><br></td>
        <td><%=author%><br></td>
        <td style="height:20px;">　 <%=subStr(content)%></td>
        <td><%=uname%><br></td>
        <td><a href="notedelete_do.jsp?id=<%=id%>">删除</a></td>
        <td><a href="noteupdate.jsp?id=<%=id%>">编辑</td>
    </tr>

    <%
        }
        // 判断i的值是否改变，如果改变，则表示有内容，反之，无内容
        if (i == 0) {
                            // 进行提示
    %>
    <tr>
        <td colspan="7">没有任何内容！！！</td>
    </tr>
    <%
        }
    %>
</table>

<%
        //判断用户的类型结束标志
    }
%>
<%
        rs.close();
        pstmt.close();
        con.close();
    } catch (Exception e) {
    }
%>
<%
} else {
    // 用户未登陆，提示用户登陆，并跳转
    response.setHeader("refresh", "2;URL=login.jsp");
%>
您还未登陆，请先登陆！！！<br>
两秒后自动跳转到登陆窗口！！！<br>
如果没有跳转，请按<a href="login.jsp">这里</a>！！！<br>
<hr>
<%
    }
%>
<hr>
</center>
</body>
</html>