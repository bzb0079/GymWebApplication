import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SelectPackageServlet")
public class SelectPackageServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            java.sql.Connection conn = null;
            java.sql.ResultSet rs = null;
            java.sql.Statement st = null;
            StringBuffer out = new StringBuffer();
            Class.forName("com.mysql.jdbc.Driver");
            conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");
            st=conn.createStatement();

            int selectedTag = Integer.parseInt(request.getParameter("tags"));
            String keyword = request.getParameter("keyword");
            String query ="";

            switch (selectedTag){
                case 0:
                    query ="SELECT * FROM packages WHERE PackageTitle LIKE '%" + keyword + "%' OR PackageType LIKE '%"
                            + keyword + "%' OR PackagePrice LIKE '%" + keyword + "%' OR Dsc LIKE '%" + keyword + "%'";
                    break;
                case 1:
                    query ="SELECT * FROM packages WHERE PackageTitle LIKE '%" + keyword + "%'";
                    break;
                case 2:
                    query ="SELECT * FROM packages WHERE PackageType LIKE '%" + keyword + "%'";
                    break;
                case 3://publish number
                    query ="SELECT * FROM packages WHERE PackagePrice LIKE '%" + keyword + "%'";
                    break;
                case 4://year of publish
                    query ="SELECT * FROM packages WHERE AvailDate LIKE '%" + keyword + "%'";
                    break;
                default ://tittle
                    query = "SELECT * FROM packages WHERE Dsc LIKE '%" + keyword + "%'";
                    break;
            }
            try {
                rs = st.executeQuery(query);
            } catch (SQLException ex) {
                Logger.getLogger(SelectPackageServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                out.append("<table class='package_list'><thread><tr><td>Package ID</td><td>Package Title</td><td>PackageType</td><td>PackagePrice</td><td>AvailDate</td><td>Description</td><td>Action</td></thead><tbody>");
                while(rs.next()){
                    out.append("<tr>");
                    out.append("<td>");
                    out.append(rs.getString("idpackages"));
                    out.append("</td>");
                    out.append("<td>");
                    out.append(rs.getString("PackageTitle"));
                    out.append("</td>");
                    out.append("<td>");
                    out.append(rs.getString("PackageType"));
                    out.append("</td>");
                    out.append("<td>");
                    out.append(rs.getString("PackagePrice"));
                    out.append("</td>");
                    out.append("<td>");
                    out.append(rs.getString("AvailDate"));
                    out.append("</td>");
                    out.append("<td>");
                    out.append(rs.getString("Dsc"));
                    out.append("</td>");
                    out.append("<td>");
                    out.append("<a href='selectPackage.jsp?idpackages=");
                    out.append(rs.getString("idpackages"));
                    out.append("'>Select the Package</a>");
                    out.append("</tr>");
                }
            } catch (SQLException ex) {
                Logger.getLogger(SelectPackageServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("package_list", out);
            request.getRequestDispatcher("/searchResult.jsp").forward(request,response);


        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SelectPackageServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SelectPackageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

//        Connection conn;
//        ResultSet rs = null;
//        Statement st = null;
//        HttpSession session = request.getSession();
//        StringBuffer out = new StringBuffer();
//
//        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            conn = DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");
//            st=conn.createStatement();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        int selectedItem=0;
//        String query = null;
//        selectedItem = Integer.parseInt(request.getParameter("topics"));
//        if(selectedItem>0){
//            query ="select books.book_id, topics.topic_name, books.book_name, authors.author_name, books.is_available \n" +
//                    "from libraryDB.books as books \n" +
//                    "join libraryDB.topics as topics on topics.topic_id = books.topic_id\n" +
//                    "join libraryDB.authors as authors on authors.author_id = books.author_id\n" +
//                    "where books.topic_id=" +selectedItem+" and books.is_available = 1";
//        }
//        else{
//            query = "select books.book_id, topics.topic_name, books.book_name, authors.author_name, books.is_available \n" +
//                    "from libraryDB.books as books \n" +
//                    "join libraryDB.topics as topics on topics.topic_id = books.topic_id\n" +
//                    "join libraryDB.authors as authors on authors.author_id = books.author_id\n" +
//                    "where books.is_available = 1";
//        }
//        try {
//            rs = st.executeQuery(query);
//        } catch (SQLException ex) {
//            Logger.getLogger(SelectPackageServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        try {
//            out.append("<table class='book_list'><thread><tr><td>Book name</td><td>Topic</td><td>Author</td><td>Action</td></thead><tbody>");
//            while(rs.next()){
//                out.append("<tr>");
//                out.append("<td>");
//                out.append(rs.getString("book_name"));
//                out.append("</td>");
//                out.append("<td>");
//                out.append(rs.getString("topic_name"));
//                out.append("</td>");
//                out.append("<td>");
//                out.append(rs.getString("author_name"));
//                out.append("</td>");
//                out.append("<td>");
//                out.append("<a href='selectPackage.jsp?book_id=");
//                out.append(rs.getString("book_id"));
//                out.append("'>Reserve a copy</a>");
//                out.append("</tr>");
//            }
//            out.append("</tbody></table>");
//            request.setAttribute("book_list", out);
//            request.getRequestDispatcher("/index.jsp").forward(request,response);
//        } catch (SQLException ex) {
//            Logger.getLogger(SelectPackageServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }
}
