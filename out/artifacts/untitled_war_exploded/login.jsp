<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/16/2019
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%@include file="header.jsp"%></title>

</head>
<body>
<div class = "login">
<div class="login_register">

    <h1>Login</h1>

    <form name="loginform" action="AuthenticateUserServlet" method="POST">
        Username : <input type="text" name="uname"/><br/> <br/>
        Password : <input type="password" name="pwd"/><br/> <br/>

        <input type="submit" class="btn btn-primary" value="Login"/>
    </form>
        <%
        if(request.getAttribute("login_msg") !=null){
            out.println(request.getAttribute("login_msg"));
        }
        %>

    <h1>Register</h1>

    <form name="registerform" action="LoginServlet" method="POST">
        First Name : <input type="text" name="firstname"/><br/><br/>
        Last Name : <input type="text" name="lastname"/><br/><br/>
        Username : <input type="text" name="username"/><br/><br/>
        Password : <input type="password" name="password"/><br/><br/>
        Confirm Password : <input type="password" name="confirmpassword"/><br/><br/>
        <input type="submit" class="btn btn-primary" value="Sign up"/>
    </form>
        <%
        if(request.getAttribute("register_msg") !=null){
            out.println(request.getAttribute("register_msg"));
        }
        %>
</div>
</div>
</body>
</html>
