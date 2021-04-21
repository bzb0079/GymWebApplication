<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/16/2019
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="header.jsp"%>
</head>
<body>
<%
    //invalidate session
    if(session.getAttribute("uname") != null) {
        java.sql.Connection conn;
        java.sql.ResultSet rs;
        java.sql.Statement st,st1;
        Class.forName("com.mysql.jdbc.Driver");
        conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");
        st = conn.createStatement();
        st1 = conn.createStatement();
        int user_id = 0;
        int package_id = 0;
        String user = session.getAttribute("uname").toString();
        String query = "SELECT user_id FROM users WHERE username = '"+ user+"'";
        rs = st.executeQuery(query);
        if(rs.next()){
            user_id = Integer.parseInt(rs.getString("user_id"));
        }
        package_id = Integer.parseInt(request.getParameter("idpackages"));
        query = "SELECT user_id, package_id from reservation "+

                "where reservation.user_id ="+"'"+user_id +"'" + "AND package_id=" + "'"+package_id+"'";
        rs=st.executeQuery(query);
        if(rs.next()){
            //do nothing
            out.print("You have already subscribed to this package!");
        }
        else {
            query = "INSERT INTO reservation (user_id, package_id) values ('" + user_id + "','" + package_id + "')";
            st1.executeUpdate(query);
            query = "SELECT packages.idpackages, packages.PackageTitle, packages.PackageType, packages.PackagePrice from reservation " +
                    "join packages on packages.idpackages = reservation.package_id " +
                    "where reservation.user_id =" + user_id;
//        query = "SELECT packages.PackageTitle from reservations "+
//                "join packages on packages.package_id = reservations.package_id"+
//                "where reservations.user_id ="+user_id;
            rs = st.executeQuery(query);

//        request.setAttribute("reservation_list", out);
//        request.getRequestDispatcher("/showPkgSelected.jsp").forward(request,response);
%>
<div align ='center'>

    <h1>Reservations</h1>
    <table>
        <thead>
        <tr>
            <td>Package ID</td>
            <td>Package Title</td>
            <td>Package Type</td>
            <td>Price</td>
        </tr>
        </thead>

        <%while(rs.next()){%>
        <tr>
            <td><%=rs.getString("idpackages")%></td>
            <td><%=rs.getString("PackageTitle")%></td>
            <td><%=rs.getString("PackageType")%></td>
            <td><%=rs.getString("PackagePrice")%></td>

<%--            <td><%=rs.getString("author_name")%></td>--%>
        </tr>
        <%}%>
    </table>

</div>
<%}%>
<%}
else{
    // passing variable "b" with URL
    // lets say "b" is for "user must login"
    response.sendRedirect("login.jsp");
}
%>
</body>
</html>
