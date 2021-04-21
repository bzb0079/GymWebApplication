<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/20/2019
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>New User</h1>
<%
    java.sql.Connection conn;
    java.sql.ResultSet rs;
    java.sql.Statement st;


    Class.forName("com.mysql.jdbc.Driver");
    conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");
    st=conn.createStatement();

    //identify user type
    String username=session.getAttribute("uname").toString();
    String qr = "SELECT usertype FROM users WHERE username = '"+username+"'";
    rs = st.executeQuery(qr);
    rs.next();
    int userType=rs.getInt(1);
    if(userType== 2)
    {
        response.sendRedirect("login.jsp?e");//redirect to error page
    }

    String new_firstname = request.getParameter("firstname");
    String new_lastname = request.getParameter("lastname");
    String new_username = request.getParameter("username");
    String new_password = request.getParameter("password");
    String new_user_type = request.getParameter("usertype");
    String if_userexist="SELECT * FROM users where username = '"+new_username+"'";
    rs=st.executeQuery(if_userexist);
    if(rs.next())
    {
        response.sendRedirect("adminPage.jsp?user_add&fail");
    }else{

        String nuQuery = "INSERT  INTO users ( fname, lname, username, password, usertype) VALUES ('"+new_firstname+"', '"+new_lastname+"', '"+new_username+"', '"+new_password+"', '"+new_user_type+"')";
          out.print(nuQuery);

        st.executeUpdate(nuQuery);
        response.sendRedirect("adminPage.jsp?user_add&suc");
    }
%>
</body>
</html>
