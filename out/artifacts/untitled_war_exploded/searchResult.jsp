<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/22/2019
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="header.jsp"%>

</head>
<body>
<div class="searchContainer" style="text-align: center">
    </br>
    <form name="searchPackage" action="SelectPackageServlet" method="POST" style="text-align: center">
        <select name="tags" class="tags">
            <option value = '0'>Search All </option>
            <option value ='1'>Package Title</option>
            <option value ='2'>Type</option>
            <option value ='3'>Price</option>
            <option value ='4'>Available Date</option>
        </select>
        <input class="search" type="text" name="keyword"/>
        <input type="submit" class="btn btn-success" value="search"/>


    </form>
<%
    if(request.getAttribute("package_list") !=null){
        out.println(request.getAttribute("package_list"));
    }

%>
</div>
</body>
</html>
