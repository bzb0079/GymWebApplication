<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/22/2019
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    java.sql.Connection conn;
    java.sql.ResultSet rs;
    java.sql.Statement st;

    Class.forName("com.mysql.jdbc.Driver");
    conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");
    st=conn.createStatement();

    String username=session.getAttribute("uname").toString();
    String qr = "SELECT usertype FROM users WHERE username = '"+username+"'";
    rs = st.executeQuery(qr);
    rs.next();
    int usertype=rs.getInt(1);
    if(usertype==2)
    {
        response.sendRedirect("login.jsp?e");//redirect to error page
    }
    String todelPkg = request.getParameter("packageID");
    String deluserQ="DELETE FROM packages where idpackages="+todelPkg +"";
    st.executeUpdate(deluserQ);
    response.sendRedirect("adminPage.jsp?package_delete&suc");
%>
</body>
</html>
