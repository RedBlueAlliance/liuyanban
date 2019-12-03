<%@ page contentType="text/html;charset=UTF-8"%>
<html>
    <head>
        <title>留言板管理登录</title>
    </head>
    <body >
    <center>
        <h1>留言板设计</h1>
        <hr>
        <br>
        <%
            if (session.getAttribute("uname") != null) {
        %>
        <h2>登陆成功</h2>
        <h2>欢迎<font color="red" size="12">
            <%=session.getAttribute("uname")%>
            <%="["%>
            <%=session.getAttribute("leixing")%>
            <%="]"%>
            </font>光临留言板</h2>
        <h2>三秒后跳转到留言管理界面</h2>
        <%		
        response.setHeader("refresh", "3;URL=list_notes.jsp");
        %>
        <h3><a href="list_notes.jsp">进入留言管理页面</a></h3>
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