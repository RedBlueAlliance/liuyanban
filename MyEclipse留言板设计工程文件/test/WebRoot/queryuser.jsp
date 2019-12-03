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
        <h3 align="center">用户信息</h3>
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
            Connection con1 = null;
            PreparedStatement pstmt = null;
            PreparedStatement pstmt1 = null;
            ResultSet rs = null;
            ResultSet rs1 = null;
        %>
        <%
            int i = 0;
            String sql = null;
            String sql1 = null;
            String keyword = request.getParameter("keyword");
            if (keyword == null) {
                sql = "SELECT uname,upass,usex,uage,ulevel,uaddress,umail,uemail,uphone FROM putongyonghu";
                sql1 = "SELECT uname,upass,usex,uage,ulevel,uaddress,umail,uemail,uphone FROM guanliyuan";
            } else {
                sql = "SELECT uname,upass,usex,uage,ulevel,uaddress,umail,uemail,uphone FROM putongyonghu WHERE uname like ? ";
                sql1 = "SELECT uname,upass,usex,uage,ulevel,uaddress,umail,uemail,uphone FROM guanliyuan WHERE uname like ? ";
            }
            try {
                Class.forName(DBDRIVER);
                con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                con1 = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = con.prepareStatement(sql);
                pstmt1 = con1.prepareStatement(sql1);
                if (keyword != null) {
                    pstmt.setString(1, "%" + keyword + "%");
                    pstmt1.setString(1, "%" + keyword + "%");
                }
                rs = pstmt.executeQuery();
                rs1 = pstmt1.executeQuery();
        %>
        
        <form action="queryuser.jsp" method="POST">请输入查询的用户名：<input type="text" name="keyword">
            <input type="submit" value="查询">
        </form>
    <h4>普通用户信息表</h4>   
<table width="90%" border="3" >
    <tr>
        <td>用户名</td>
        <td>密码</td>
        <td>性别</td>
        <td>年龄</td>
        <td>文化水平</td>
        <td>家庭地址</td>
        <td>邮政编码</td>
        <td>邮箱</td>
        <td>联系电话</td>
        <td colspan="2">操作</td>
    </tr>
    <%
        while (rs.next()) {
            i++;
            String uname = rs.getString(1);
            String upass = rs.getString(2);
            String usex = rs.getString(3);
            String uage = rs.getString(4);
            String ulevel = rs.getString(5);
            String uaddress = rs.getString(6);
            String umail = rs.getString(7);
            String uemail = rs.getString(8);
            String uphone = rs.getString(9);
            if (keyword != null) {
                uname = uname.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
            }
    %>
    <tr>
        <td><%=uname%><br></td>
        <td><%=upass%><br></td>
        <td><%=usex%><br></td>
        <td><%=uage%><br></td>
        <td><%=ulevel%><br></td>
        <td><%=uaddress%><br></td>
        <td><%=umail%><br></td>
        <td><%=uemail%><br></td>
        <td><%=uphone%><br></td>
        <td><a href="userdelete_do.jsp?uname=<%=uname%>">删除</a></td>
        <td><a href="userupdate.jsp?uname=<%=uname%>">编辑</td>
    </tr>
    <%
        }
        if (i == 0) {
    %>
    <tr>
        <td colspan="11">没有任何普通用户信息！！！</td>
    </tr>
    <%
        }
    %>
</table>
<h4>管理员信息表</h4>    
<table width="90%" border="3">
    <tr>
        <td>用户名</td>
        <td>密码</td>
        <td>性别</td>
        <td>年龄</td>
        <td>文化水平</td>
        <td>家庭地址</td>
        <td>邮政编码</td>
        <td>邮箱</td>
        <td>联系电话</td>
        <td colspan="2">操作</td>
    </tr>
    <%
        while (rs1.next()) {
            i++;
            String uname = rs1.getString(1);
            String upass = rs1.getString(2);
            String usex = rs1.getString(3);
            String uage = rs1.getString(4);
            String ulevel = rs1.getString(5);
            String uaddress = rs1.getString(6);
            String umail = rs1.getString(7);
            String uemail = rs1.getString(8);
            String uphone = rs1.getString(9);
            if (keyword != null) {
                uname = uname.replaceAll(keyword, "<font color=\"red\">" + keyword + "</font>");
            }
    %>
    <tr>
        <td><%=uname%><br></td>
        <td><%=upass%><br></td>
        <td><%=usex%><br></td>
        <td><%=uage%><br></td>
        <td><%=ulevel%><br></td>
        <td><%=uaddress%><br></td>
        <td><%=umail%><br></td>
        <td><%=uemail%><br></td>
        <td><%=uphone%><br></td>
        <td><a href="#" onclick="Msg('超级管理员才可以进行删除操作')";>删除</a></td>
        <td><a href="#" onclick="Msg('超级管理员才可以进行编辑操作')";>编辑</td>
    </tr>

    <%
        }
        if (i == 0) {
    %>
    <tr>
        <td colspan="11">没有任何管理员信息！！！</td>
    </tr>
    <%
        }
    %>
</table>
<%
        rs.close();
        pstmt.close();
        con.close();
        rs1.close();
        pstmt1.close();
        con1.close();
    } catch (Exception e) {
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
<h3><a href="list_notes.jsp">返回留言板列表</a></h3>
<hr>
</center>
</body>
</html>