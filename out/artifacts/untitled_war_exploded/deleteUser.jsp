<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/20/2019
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1></h1>
<%
    java.sql.Connection conn;
    java.sql.ResultSet rs;
    java.sql.Statement st;

    Class.forName("com.mysql.jdbc.Driver");
    conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");
    st=conn.createStatement();

    //user type identification
    String username=session.getAttribute("uname").toString();
    String qr = "SELECT usertype FROM users WHERE username = '"+username+"'";
    rs = st.executeQuery(qr);
    rs.next();
    int usertype=rs.getInt(1);
    if(usertype==2)
    {
        response.sendRedirect("login.jsp?e");//redirect to error page
    }

    String delete_user="DELETE FROM users where user_id="+request.getParameter("user_id") +"";
    st.executeUpdate(delete_user);
    response.sendRedirect("adminPage.jsp?user_delete");
%>
</body>
</html>
