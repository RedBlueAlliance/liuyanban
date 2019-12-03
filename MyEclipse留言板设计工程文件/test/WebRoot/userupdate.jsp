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
        <h2>欢迎<font color="red" size="12">
            <%=session.getAttribute("uname")%>
            <%="["%>
            <%=session.getAttribute("leixing")%>
            <%="]"%>
            </font>光临留言板</h2>
            <hr>
        <h3>编辑用户信息</h3>
        <br>
        <%
            if (session.getAttribute("uname") != null) {
        %>	
        <%!
            String DBDRIVER = "com.mysql.jdbc.Driver";
            String DBURL = "jdbc:mysql://localhost:3306/test";
            String DBUSER = "root";
            String DBPASSWORD = "0906160203";
            Connection con = null;
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
            int i = 0;
            String sql = "SELECT uname,upass,usex,uage,ulevel,uaddress,umail,uemail,uphone FROM putongyonghu WHERE uname=?";
            try {
                Class.forName(DBDRIVER);
                con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, uname);
                rs = pstmt.executeQuery();
        %>
        <%
            if (rs.next()) {
                i++;
                String upass = rs.getString(2);
                String usex = rs.getString(3);
                String uage = rs.getString(4);
                String ulevel = rs.getString(5);
                String uaddress = rs.getString(6);
                String umail = rs.getString(7);
                String uemail = rs.getString(8);
                String uphone= rs.getString(9);
        %>
        <form action="userupdate_do.jsp" method="post">
            <table>
                <tr>
                    <td>用户名:</td>
                    <td><input type="text" name="uname" value="<%=uname%>"style="width:150px"></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input type="text" name="upass" value="<%=upass%>"style="width:150px"></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td><input type="text" name="usex" value="<%=usex%>"style="width:150px"></td>
                </tr>
                <tr>
                    <td>年龄:</td>
                    <td><input type="text" name="uage" value="<%=uage%>"style="width:150px"></td>
                </tr>
                <tr>
                    <td>文化水平:</td>
                    <td><input type="text" name="ulevel" value="<%=ulevel%>"style="width:150px"></td>
                </tr>
                <tr>
                    <td>家庭地址:</td>
                    <td><input type="text" name="uaddress" value="<%=uaddress%>"style="width:150px"></td>
                </tr>
                <tr>
                    <td>邮政编码:</td>
                    <td><input type="text" name="umail" value="<%=umail%>"style="width:150px"></td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td><input type="text" name="uemail" value="<%=uemail%>"style="width:150px"></td>
                </tr>
                <tr>
                    <td>联系电话:</td>
                    <td><input type="text" name="uphone" value="<%=uphone%>"style="width:150px"></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <input type="submit" value="更新">
                        <input type="reset" value="重置">
                    </td>
                </tr>
            </table>
        </form>
        <%
        } else {
        %>
                      没有发现，要更新的用户信息！！<br>
                      请确认要更新的用户是否存在！！<br>
        <%
            }
        %>
        <%
                rs.close();
                pstmt.close();
                con.close();
            } catch (Exception e) {
            }
        %>
        <h3><a href="queryuser.jsp">返回用户信息列表</a></h3>
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
    <hr>
</body>
</html>