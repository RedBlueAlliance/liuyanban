<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title> 用户信息</title>
</head>
<body>
<center>
<h1>留言板设计</h1>
<hr>
    <h3 align="center"> 用户信息</h3>
    <table>
        <tr>
            <td align="right"> 用户类型:</td> <td> <%=session.getAttribute("leixinng")%> </td>
        </tr>
        <tr>
            <td align="right"> 用户名:</td> <td> <%=session.getAttribute("uname")%> </td>
        </tr>
        <tr>
            <td align="right"> 性别:</td> <td> <%=session.getAttribute("usex")%> </td>
        </tr>
        <tr>
            <td align="right"> 年龄:</td> <td> <%=session.getAttribute("uage")%> </td>
        </tr>
        <tr>
            <td align="right"> 文化程度:</td> <td> <%=session.getAttribute("ulevel")%> </td>
        </tr>
        <tr>
            <td align="right"> 家庭住址:</td> <td> <%=session.getAttribute("uaddress")%> </td>
        </tr>
        <tr>
            <td align="right"> 邮政编码:</td> <td> <%=session.getAttribute("umail")%> </td>
        </tr>
        <tr>
            <td align="right"> 邮箱:</td> <td> <%=session.getAttribute("uemail")%> </td>
        </tr>
        <tr>
            <td align="right"> 联系电话:</td> <td> <%=session.getAttribute("uphone")%> </td>
        </tr>
    </table>
    <h3><a href="javascript:history.back()">返回前一页</a> <a href="login.jsp">返回登陆首页</a>
    <hr>
</center>
</body>
</html>