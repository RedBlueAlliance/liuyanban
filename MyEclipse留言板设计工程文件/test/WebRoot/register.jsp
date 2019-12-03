<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>用户注册</title>
<script language="javascript">
        function checkdata()
        {
            var uname=document.registerform.uname.value;
            if(uname=="")
            {
                alert("用户名不能为空,必须输入!");
                document.registerform.uname.focus();
                return false;
            }
            var upass=document.registerform.upass.value;
            if(upass=="")
            {
                alert("密码不能为空,必须输入!");
                document.registerform.upass.focus();
                return false;
            }
            var upass1=document.registerform.upass1.value;
            if(upass1!=upass)
            {
                alert("两次输入的密码不一致!");
                document.registerform.upass1.focus();
                return false;
            }
            var uage=document.registerform.uage.value;
            if(uage==""||isNaN(uage))
            {
                alert("年龄必须输入,不能为空,并且只能是数字!");
                document.registerform.uage.focus();
                return false;
            }
            if(parseInt(uage) 16||parseInt(uage) 50)
            {
                alert("年龄只能在16至50岁之间!");
                document.registerform.uage.focus();
                return false;
            }
            var umail=document.registerform.umail.value;
            if(umail==""||umail.length!=6 ||isNumberic(umail)==false)
            {
                alert("邮政编码必须输入,不能为空,并且必须是6位数字!");
                document.registerform.umail.focus();
                return false;
            }
            var uemail=document.registerform.uemail.value;
            if(uemail=="")
            {
                alert("邮箱地址必须输入,不能为空!");
                document.registerform.uemail.focus();
                return false;
            }
            if(uemail.indexOf('@',0)==-1)
            {
                alert("邮箱地址格式有错误,应包含@字符!");
                document.registerform.uemail.focus();
                return false;
            }
            if(uemail.indexOf('.',0)==-1)
            {
                alert("邮箱地址格式有错误,应包含.字符!");
                document.registerform.uemail.focus();
                return false;
            }
            return true;
        }
        function isNumberic(str)
        {
            var len=str.length;
            for(var i=0;i<len;i++)
            if(str.charAt(i)<'0'||str.charAt(i)>'9')
                return false;
            return true;
        }
</script>    
</head>
<body onload="document.registerform.uname.focus()">
<center>
<h1>留言板设计</h1>
<hr>
    <h3 align="center"> 填写注册信息</h3>
    <form name="registerform" method="post" action="register_do.jsp">
        <table>
            <tr>
                <td>用户类型:</td>
                    <td><select name="leixing">
                            <option  value="putongyonghu" >普通用户</option>
                            <option value="guanliyuan" >管理员</option>
                        </select></td>
            </tr>
            <tr>
                <td> 用户名:</td> <td> <input type="text"name="uname"style="width:150px"> </td>
            </tr>
            <tr>
                <td> 密码:</td> <td> <input type="password" name="upass"style="width:150px"> </td>
            </tr>
            <tr>
                <td> 确认密码:</td> <td> <input type="password"name="upass1"style="width:150px"> </td>
            </tr>
            <tr>
                <td> 性别:</td> <td> <input type="radio"name="usex"value="男"checked> 男<input type="radio"name="usex"value="女"> 女</td>
            </tr>
            <tr>
                <td> 年龄:</td> <td> <input type="text"name="uage" style="width:150px"> </td>
            </tr>
            <tr>
                <td> 文化程度:</td>
                <td> <select name="ulevel" style="width:150px">
                    <option value="中专"> 中专</option>
                    <option value="大专"> 大专</option>
                    <option value="本科"> 本科</option>
                    <option value="研究生"> 研究生</option>
                </select>
                </td>
            </tr>
            <tr>
                <td> 家庭住址:</td> <td> <input type="text"name="uaddress"style="width:150px">
            </td>
            </tr>
            <tr>
                <td> 邮政编码:</td> <td> <input type="text"name="umail"style="width:150px"> </td>
            </tr>
            <tr>
                <td> 邮箱:</td> <td> <input type="text"name="uemail"style="width:150px"> </td>
            </tr>
            <tr>
                <td> 联系电话:</td> <td> <input type="text"name="uphone"style="width:150px"> </td>
            </tr>
            <tr>
                <td> &nbsp;</td>
                <td align="center"> <input type="submit" value="提交" onclick="return checkdata()">
                &nbsp;&nbsp;&nbsp;<input type="reset" value="重置" ></td>
            </tr>
        </table>
    </form>
    <h3><a href="login.jsp">回到登陆首页</a></h3>
    <hr>
</center>
</body>
</html>
