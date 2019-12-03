<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>留言板设计系统</title>
    <script language="javascript">
        function checkdata()
        {
            var uname=document.loginform.uname.value;
            if(uname=="")
            {
                alert("用户名不能为空，必须输入");
                document.loginform.uname.focus();
                return false;
            }
            var upass=document.loginform.upass.value;
            if(upass==""){
                alert("密码不能为空，必须输入！");
                document.loginform.upass.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body onload="document.loginform.uname.focus()">
<center>
<h1>留言板设计</h1>
<hr>
    <h3> 用户登录</h3>
    <form name="loginform"method="post"action="login_conf.jsp">
        <table width="100" height="150">
            <tr>
                <td align="right" > 用户类型:&nbsp;&nbsp;</td>
                <td> <select name="leixing">
                            <option value="putongyonghu" >普通用户</option>
                            <option value="guanliyuan" >管理员</option>
                        </select></td>
            </tr>
            <tr>
                <td align="right" >用&nbsp;户&nbsp;名:&nbsp;&nbsp;</td>
                <td> <input type="text"name="uname"style="width:150px" ></td>
            </tr>
            <tr>
                <td align="right"> 密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;</td>
                <td> <input type="password"name="upass"style="width:150px"> </td>
            </tr>
            <tr>
                <td &nbsp;</td>
                <td> <input type="submit"name="login"value="登录"onclick="return checkdata()">
                    <input type="reset" name="reset" value="重置">
                    <a href="register.jsp" >注册</a>
                </td>
            </tr>
        </table>
    </form>
    <hr>
</center>
</body>
</html>
