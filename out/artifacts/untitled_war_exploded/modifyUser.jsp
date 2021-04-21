<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/20/2019
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>Hello World!</h1>
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
    int user_id=Integer.parseInt(request.getParameter("user_id"));

    String new_firstname = request.getParameter("firstname");
    String new_lastname = request.getParameter("lastname");
    String new_username = request.getParameter("username");
    String new_user_type = request.getParameter("usertype");
    String if_userexist="SELECT * FROM users where username='"+new_username+"'";
    rs=st.executeQuery(if_userexist);
    if(rs.next())
    {
        response.sendRedirect("adminPage.jsp?user_modify&fail");
    }else{
        String modifyuQ = "UPDATE users SET fname='"+new_firstname+"',lname='"+new_lastname+"',username='"+new_username+"',usertype='"+new_user_type+"' WHERE user_id='"+user_id+"'";
        st.executeUpdate(modifyuQ);
        response.sendRedirect("adminPage.jsp?user_modify&suc");
    }
%>
</body>
</html>
