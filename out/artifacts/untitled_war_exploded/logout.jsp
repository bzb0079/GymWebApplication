<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/16/2019
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    //invalidate session
    if(session.getAttribute("uname") != null) {
        //if session was created
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
    else
    {
        // passing variable "b" with URL
        // lets say "b" is for "user must login"
        response.sendRedirect("index.jsp?b");
    }
%>
