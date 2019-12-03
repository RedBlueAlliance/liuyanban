<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
            String DBDRIVER = "com.mysql.jdbc.Driver";
            String DBURL = "jdbc:mysql://localhost:3306/test?characterEncoding=utf-8";
            String DBUSER = "root";
            String DBPASSWORD = "0906160203";
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            boolean flag = false;
            String uname = request.getParameter("uname");
            String upass = request.getParameter("upass");
            String leixing = request.getParameter("leixing");
            if (leixing.equals("putongyonghu")) {

            String sql = "SELECT uname FROM putongyonghu WHERE uname=? and upass=?";
            try {
                Class.forName(DBDRIVER);
                con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, uname);
                pstmt.setString(2, upass);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    flag = true;
                    // 将用户名保存在session之中
                    session.setAttribute("uname", rs.getString(1));  //判断用户是否存在
                    session.setAttribute("leixing", "普通用户");  //判断用户类型
                } else {
                    // 保存错误信息
                    request.setAttribute("err", "用户名不存在或密码不正确！！！");
                }
                rs.close();
                pstmt.close();
                con.close();
            } catch (Exception e) {
            }
           } else {
           String sql = "SELECT uname FROM guanliyuan WHERE uname=? and upass=?";
            try {
                Class.forName(DBDRIVER);
                con = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, uname);
                pstmt.setString(2, upass);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    // 用户合法
                    flag = true;
                    // 将用户名保存在session之中
                    session.setAttribute("uname", rs.getString(1));  //判断用户是否存在
                    session.setAttribute("leixing", "管理员");  //判断用户类型
                } else {
                    // 保存错误信息
                    request.setAttribute("err", "用户名不存在或密码不正确！！！");
                }
                rs.close();
                pstmt.close();
                con.close();
            } catch (Exception e) {
            }

            }

            if(flag)
{
response.sendRedirect("login_success.jsp");
}
else
{
response.sendRedirect("login.jsp");
}
%>
