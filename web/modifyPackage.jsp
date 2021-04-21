<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/22/2019
  Time: 6:53 PM
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
    int package_id=Integer.parseInt(request.getParameter("package_id"));

    String new_PackageTitle = request.getParameter("PackageTitle");
    String new_PackageType = request.getParameter("PackageType");
    String new_PackagePrice = request.getParameter("PackagePrice");
    String new_AvailDate = request.getParameter("AvailDate");
    String new_Dsc = request.getParameter("Dsc");



        String modifyuQ = "UPDATE packages SET PackageTitle='"+new_PackageTitle+"',PackageType='"+new_PackageType+"',PackagePrice='"+new_PackagePrice+"',AvailDate='"+new_AvailDate+"', Dsc='"+new_Dsc+"' WHERE idpackages='"+package_id+"'";
        st.executeUpdate(modifyuQ);
        response.sendRedirect("adminPage.jsp?package_modify&suc");

%>
</body>
</html>
