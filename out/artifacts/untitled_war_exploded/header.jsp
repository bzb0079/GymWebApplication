<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/16/2019
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
     <title>JSP Page</title>
 <%-- <link rel="stylesheet" href="CSS/style.css" type="text/css"/>--%>

        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="CSS/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="CSS/styleGYM.css" rel="stylesheet" type="text/css">


</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
        <a class="navbar-brand" href="index.jsp">Iron GYM</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="showPkgSelected.jsp">Your Package <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="FAQs.xml">FAQS <span class="sr-only">(current)</span></a>
                </li>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="#">Link</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item dropdown">--%>
<%--                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
<%--                        Dropdown--%>
<%--                    </a>--%>
<%--                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
<%--                        <a class="dropdown-item" href="#">Action</a>--%>
<%--                        <a class="dropdown-item" href="#">Another action</a>--%>
<%--                        <div class="dropdown-divider"></div>--%>
<%--                        <a class="dropdown-item" href="#">Something else here</a>--%>
<%--                    </div>--%>
<%--                </li>--%>
            </ul>
            <form class="form-inline my-2 my-lg-0">
<%--                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
                <%
                    if(session.getAttribute("uname")!=null){%>
                <div class="login_form">

                    <a class="nav-link" style="color: blue" href="logout.jsp">Log Out <span class="sr-only">(current)</span></a>
                </div>
                    <label style="color: white">
                <p>
                    </br>
                    Hello,
                    <%
                        out.println(session.getAttribute("uname"));
                    %>
                </p>
                    </label>

                <%}
                else{%>

                    <a class="nav-link" href="login.jsp" style="color: blue">Log In <span class="sr-only">(current)</span></a>
                    <a class="nav-link" href="login.jsp" style="color: blue">Sign Up <span class="sr-only">(current)</span></a>



                <%}%>
<%--                <div class="login_form">--%>
<%--                <a class="nav-link" href="login.jsp">Log In <span class="sr-only">(current)</span></a>--%>
<%--                <a class="nav-link" href="login.jsp">Sign Up <span class="sr-only">(current)</span></a>--%>
<%--                </div>--%>


            </form>
        </div>
    </nav>
<%--    <div class = "row">--%>
<%--    <div class="col-md-12" style="background-color: #0c5460">--%>
<%--        <div class="container">--%>
<%--            <h1 class="display-4">Welcome to Home GYM </h1>--%>
<%--            <a class="home" href="index.jsp">Home</a>--%>
<%--            <div class="login_form">--%>
<%--                <a href="login.jsp">Sign up</a> &nbsp;--%>
<%--                <a href="login.jsp">Login</a>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    </div>--%>



</div>
</body>
</html>
