<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/20/2019
  Time: 11:02 PM
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
    int user_type=rs.getInt(1);
    if(user_type== 2)
    {
        response.sendRedirect("login.jsp?e");//redirect to error page
    }


    String new_pkg_type = request.getParameter("Package_Type");
    String new_title = request.getParameter("Package_Title");
    String new_price = request.getParameter("Package_Price");
    String new_date = request.getParameter("Pkg_Avail_Date");
    String new_description = request.getParameter("description");


    String if_pkgExists="SELECT * FROM packages where PackageTitle='"+new_title+"'";
    rs=st.executeQuery(if_pkgExists);
    if(rs.next())
    {
        response.sendRedirect("adminPage.jsp?package_add&fail");
    }else{

        String newpkgq = "INSERT  INTO packages ( PackageTitle, PackageType, PackagePrice, AvailDate, Dsc) VALUES ('"+new_title+"', '"+new_pkg_type+"', '"+new_price+"', '"+new_date+"', '"+new_description+"')";

        st.executeUpdate(newpkgq);
        response.sendRedirect("adminPage.jsp?package_add&suc");
    }
%>
</body>
</html>
