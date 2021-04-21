<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/20/2019
  Time: 6:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <%@include file="header.jsp"%>
</head>
<body>
<h1>Manage</h1>
<%
    java.sql.Connection conn;
    java.sql.ResultSet rs;
    java.sql.Statement st;

    Class.forName("com.mysql.jdbc.Driver");
    conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");
    st=conn.createStatement();

    //delete when merge our project
    HttpSession ss=request.getSession(false);

    //user type identification
    String username=session.getAttribute("uname").toString();
    String qr = "SELECT usertype FROM users WHERE username = '"+username+"'";
    rs = st.executeQuery(qr);
    rs.next();
    String user_type=rs.getString(1);
    if(user_type=="2")
    {
        response.sendRedirect("login.jsp?e");//redirect to error page
    }
%>
<form method="post" action="adminPage.jsp">

    <input type="submit" class="btn btn-primary"  name="user" value="User">

    <input type="submit" class="btn btn-primary" name="package" value="Package">


</form>

<table>
    <%
        if(request.getParameter("user")!=null)
        {
            out.print("<form method='post' action='adminPage.jsp'>User"
                    + "<input type='submit' class='btn btn-warning' name='user_add' value='add' >"
                    + "<input type='submit' class='btn btn-danger' name='user_delete' value='delete' >"
                    + "<input type='submit' class='btn btn-warning' name='user_modify' value='modify' >"
                    + "</form>");
        }
        if(request.getParameter("user_add")!=null)
        {
            out.print("<form method='post' action='newUser.jsp'>User"
                    + "<table border='1' align='center'>"
                    + "<tr>"
                    + "<td>firstname</td>"
                    + "<td><input type='text' name='firstname' ></td>"
                    +"</tr>"
                    +"<tr>"
                    + "<td>lastname</td>"
                    + "<td><input type='text' name='lastname' ></td>"
                    + "</tr>"
                    +"<tr>"
                    + "<td>username</td>"
                    + "<td><input type='text' name='username' ></td>"
                    +"</tr>"
                    +"<tr>"
                    + "<td>password</td>"
                    + "<td><input type='password' name='password' ></td>"
                    +"</tr>"
                    +"<tr>"
                    + "<td>user type</td>"
                    + "<td><select name='usertype'><option value='2'>user</option><option value='1'>administer</option></select></td>"
                    + "</tr>"
                    + "</table>"
                    +"<input type='submit' value='add' >"
                    + "</form>");
            if(request.getParameter("suc")!=null)
            {
                out.print("successfully added");
            }
            if(request.getParameter("fail")!=null)
            {
                out.print("user exist");
            }
        }
        String userlist="SELECT fname, lname, username, usertype ,user_id FROM users ";
        if(request.getParameter("user_delete")!=null)
        {
            out.print("<form method='post'>User"
                    + "<table border='1' align='center'>"
                    + "<tr>"
                    + "<td>firstname</td><td>lastname</td></td><td>username</td><td>user type</td><td>action</td>"
                    + "</tr>");
            rs = st.executeQuery(userlist);
            while(rs.next())
            {
                out.print(""
                        + "<tr>"
                        + "<td>"+rs.getString(1)+"</td>"
                        + "<td>"+rs.getString(2)+"</td>"
                        + "<td>"+rs.getString(3)+"</td>"
                        + "<td>"+rs.getString(4)+"</td>"
                        + "<td><a href='deleteUser.jsp?user_id="+rs.getString(5)+"'>delete</a></td>"
                        + "</tr>");
            }
            out.print(""
                    + "</table>"
                    + "</form>");

        }
        if(request.getParameter("user_modify")!=null)
        {
            out.print("<form method='post' action='modifyUser.jsp'>User"
                    + "<table border='1' align='center'>"
                    + "<tr>"
                    + "<td>firstname</td><td>lastname</td></td><td>username</td><td>user type</td><td>action</td>"
                    + "</tr>");
            rs = st.executeQuery(userlist);
            while(rs.next())
            {
                int user_id=-1;
                if(request.getParameter("user_id")!=null)
                {
                    user_id=Integer.parseInt(request.getParameter("user_id"));
                }
                if(user_id==Integer.parseInt(rs.getString(5)))
                {
                    out.print(""
                            + "<tr>"
                            + "<td><input type='text' Value='"+rs.getString(1)+"' name='firstname' ></td>"
                            + "<td><input type='text' Value='"+rs.getString(2)+"' name='lastname' ></td>"
                            + "<td><input type='text' Value='"+rs.getString(3)+"' name='username' ></td>"
                            + "<input type='hidden' name='user_id' value='"+user_id+"'>"
                            + "<td><select name='usertype'><option value='2'>user</option><option value='1'>administer</option></select></td>"
                            + "<td><input type='submit' value='confirm' ></td>"
                            + "</tr>");
                }else{
                    out.print(""
                            + "<tr>"
                            + "<td>"+rs.getString(1)+"</td>"
                            + "<td>"+rs.getString(2)+"</td>"
                            + "<td>"+rs.getString(3)+"</td>"
                            + "<td>"+rs.getString(4)+"</td>"
                            + "<td><a href='adminPage.jsp?user_modify&user_id="+rs.getString(5)+"'>modify</a></td>"
                            + "</tr>");
                }
            }
            out.print(""
                    + "</table>"
                    + "</form>");
            if(request.getParameter("suc")!=null)
            {
                out.print("successfully modified");
            }
            if(request.getParameter("fail")!=null)
            {
                out.print("user exist");
            }
        }

        if(request.getParameter("package")!=null){
            out.print("<form method='post' action='adminPage.jsp'>Package"
                    + "<input type='submit' class='btn btn-warning' name='package_add' value='add' >"
                    + "<input type='submit' class='btn btn-danger' name='package_delete' value='delete' >"
                    + "<input type='submit' class='btn btn-warning' name='package_modify' value='modify' >"
                    + "</form>");
        }
        if(request.getParameter("package_add")!=null){

            out.print("<form method='post' action='addPackage.jsp'>Package"
                    + "<table border='1' align='center'>"
                    + "<tr>"
                    + "<td>Package Title</td>"
                    + "<td><input type='text' name='Package_Title' ></td>"
                    +"</tr>"
                    +"<tr>"
                    +"<td>Package Type</td>"
                    + "<td><input type='text' name='Package_Type'></td>"
                    +"</tr>"
                    +"<tr>"
                    + "<td>Package Price</td>"
                    + "<td><input type='text' name='Package_Price' ></td>"
                    +"</tr>"
                    +"<tr>"
                    + "<td>Package Available Date</td>"
                    + "<td><input type='date' name='Pkg_Avail_Date' /></td>"
                    +"</tr>"
                    +"<tr>"
                    + "<td>description</td>"
                    + "<td><input type='text' name='description' ></td>"
                    + "</tr>"
                    +"<tr><td></td>"
                    + "<td><input type='submit' value='add' >"
                    + "</tr>"
                    + "</table>"
                    + "</form>");
            if(request.getParameter("suc")!=null)
            {
                out.print("successfully added");
            }
            if(request.getParameter("fail")!=null)
            {
                out.print("publish_number exist");
            }

        }
        String packagelist="SELECT idpackages, PackageTitle, PackageType, PackagePrice, AvailDate, Dsc FROM packages ";
        if(request.getParameter("package_delete")!=null)
        {
            out.print("<form method='post' action='deletePackage.jsp'>Package"
                    + "<table border='1' align='center'>"
                    + "<tr>"
                    + "<td>Package Title</td><td>Type</td></td><td>Price</td><td>Avail Date</td><td>Description</td>"
                    + "</tr>");
            rs = st.executeQuery(packagelist);
            while(rs.next())
            {
                out.print(""
                        + "<tr>"
                        + "<td>"+rs.getString(2)+"</td>"
                        + "<td>"+rs.getString(3)+"</td>"
                        + "<td>"+rs.getString(4)+"</td>"
                        + "<td>"+rs.getString(5)+"</td>"
                        + "<td>"+rs.getString(6)+"</td>"
                        + "<td><a href='deletePackage.jsp?packageID="+rs.getString(1)+"'>delete</a></td>"
                        + "</tr>");
            }
            out.print(""
                    + "</table>"
                    + "</form>");
            if(request.getParameter("suc")!=null)
            {
                out.print("successfully Deleted");
            }
            if(request.getParameter("fail")!=null)
            {
                out.print("Failed to Delete");
            }

        }

        if(request.getParameter("package_modify")!=null)
        {
            out.print("<form method='post' action='modifyPackage.jsp'>Package"
                    + "<table border='1' align='center'>"
                    + "<tr>"
                    + "<td>Package Title</td><td>Type</td></td><td>Price</td><td>Avail Date</td><td>Description</td>"
                    + "</tr>");
            rs = st.executeQuery(packagelist);
            while(rs.next())
            {
                int package_id=-1;
                if(request.getParameter("package_id")!=null)
                {
                    package_id=Integer.parseInt(request.getParameter("package_id"));
                }
                try {
                    if(package_id == Integer.parseInt(rs.getString(1))) {

                        out.print(""
                                + "<tr>"
                                + "<td><input type='text' Value='" + rs.getString(2) + "' name='PackageTitle' ></td>"
                                + "<td><input type='text' Value='" + rs.getString(3) + "' name='PackageType' ></td>"
                                + "<td><input type='text' Value='" + rs.getString(4) + "' name='PackagePrice' ></td>"
                                + "<td><input type='text' Value='" + rs.getString(5) + "' name='AvailDate' ></td>"
                                + "<td><input type='text' Value='" + rs.getString(6) + "' name='Dsc' ></td>"
                                + "<input type='hidden' name='package_id' value='"+package_id+"'>"
                                + "<td><input type='submit' value='confirm' ></td>"
                                + "</tr>");
                    }
                    else{
                        out.print(""
                                + "<tr>"
                                + "<td><input type='text' Value='" + rs.getString(2) + "' name='PackageTitle' ></td>"
                                + "<td><input type='text' Value='" + rs.getString(3) + "' name='PackageType' ></td>"
                                + "<td><input type='text' Value='" + rs.getString(4) + "' name='PackagePrice' ></td>"
                                + "<td><input type='text' Value='" + rs.getString(5) + "' name='AvailDate' ></td>"
                                + "<td><input type='text' Value='" + rs.getString(6) + "' name='Dsc' ></td>"
                                + "<td><a href='adminPage.jsp?package_modify&package_id="+rs.getString(1)+"'>modify</a></td>"
                                + "</tr>");

                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }
            out.print(""
                    + "</table>"
                    + "</form>");
            if(request.getParameter("suc")!=null)
            {
                out.print("successfully modified");
            }
            if(request.getParameter("fail")!=null)
            {
                out.print("user exist");
            }
        }
    %>
</table>
<%
%>
</body>
</html>
