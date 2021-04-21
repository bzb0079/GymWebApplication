<%--
  Created by IntelliJ IDEA.
  User: Bibhav
  Date: 4/16/2019
  Time: 8:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
          <%@include file="header.jsp"%>
      <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  </head>
  <body>
  <!--        <a href="myaccount.jsp" >myaccount</a>-->

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
      <div class="w3-content w3-display-container" style ="width: 100%">

          <div class="w3-display-container mySlides">
              <img src="Img/mainSpace.jpg" style="width:60%"/>
              <div class="w3-display-bottomleft w3-large w3-container w3-padding-16 w3-black">
                  Main Space
              </div>
          </div>

          <div class="w3-display-container mySlides">
              <img src="Img/cardioRoom.jpg" style="width: 60%">
              <div class="w3-display-bottomright w3-large w3-container w3-padding-16 w3-black">
                  Cardio Room
              </div>
          </div>

          <div class="w3-display-container mySlides">
              <img src="Img/restRoom.jpg" style="width:60%">
              <div class="w3-display-topleft w3-large w3-container w3-padding-16 w3-black">
                  Rest Room
              </div>
          </div>

          <button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
          <button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>

      </div>

      <script>
          var slideIndex = 1;
          showDivs(slideIndex);

          function plusDivs(n) {
              showDivs(slideIndex += n);
          }

          function showDivs(n) {
              var i;
              var x = document.getElementsByClassName("mySlides");
              if (n > x.length) {slideIndex = 1}
              if (n < 1) {slideIndex = x.length}
              for (i = 0; i < x.length; i++) {
                  x[i].style.display = "none";
              }
              x[slideIndex-1].style.display = "block";
          }
      </script>

<%
          if(request.getAttribute("package_list") !=null){
              out.println(request.getAttribute("package_list"));
          }

      %>
  </div>



  </body>


  <%--  <body>--%>
<%--  <div class="search">--%>
<%--      <p>Search book</p>--%>
<%--      <form name ="selectbook" action="SelectPackageServlet" method="GET">--%>
<%--          <select name="topics">--%>
<%--              <option value ='0'>ALL</option>--%>
<%--              <%--%>
<%--                  java.sql.Connection conn;--%>
<%--                  java.sql.ResultSet rs;--%>
<%--                  java.sql.Statement st;--%>
<%--                  Class.forName("com.mysql.jdbc.Driver");--%>
<%--                  try{--%>
<%--                      conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");--%>
<%--                      st=conn.createStatement();--%>
<%--                      String query = "SELECT * FROM topics";--%>
<%--                      rs = st.executeQuery(query);--%>
<%--                      while(rs.next()){%>--%>
<%--              <option value="<%=rs.getString("topic_id")%>"><%=rs.getString("topic_name")%></option>--%>
<%--              <%}--%>
<%--              }catch(Exception e){--%>
<%--                  e.printStackTrace();--%>
<%--              }%>--%>
<%--          </select>--%>
<%--          <input type="submit" value="search"/>--%>
<%--      </form>--%>
<%--  </div>--%>
<%--  <%--%>
<%--      if(request.getAttribute("book_list") !=null){--%>
<%--          out.println(request.getAttribute("book_list"));--%>
<%--      }--%>
<%--  %>--%>

<%--  </body>--%>
</html>
