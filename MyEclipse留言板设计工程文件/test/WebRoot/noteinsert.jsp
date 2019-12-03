<%@ page contentType="text/html;charset=UTF-8"%>
<html>
    <head>
        <title>留言管理</title>
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
           <h3>添加留言</h3>
        <br>
        <%
            if (session.getAttribute("uname") != null) {
        %>
        <form action="noteinsert_do.jsp" method="post">
            <table>
                <tr>
                </tr>
                <tr>
                    <td>标题：</td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>作者：</td>
                    <td><input type="text" name="author"></td>
                </tr>
                <tr>
                    <td>内容：</td>
                    <td><textarea name="content" cols="30" rows="6"></textarea></td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                    <input type="submit" value="添加">
                    <input type="reset" value="重置">
                    </td>
                </tr>
            </table>
        </form>
        <h3><a href="list_notes.jsp">回到留言板列表</a></h3>
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