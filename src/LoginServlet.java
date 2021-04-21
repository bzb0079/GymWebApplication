import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import static java.lang.System.out;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        java.sql.Connection conn;
        HttpSession session=request.getSession();
        java.sql.ResultSet rs = null;
        java.sql.Statement st = null;
        java.sql.Statement st1 = null;
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");

        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");
            st=conn.createStatement();

        } catch (ClassNotFoundException ex) {
            ex.getStackTrace();
        } catch (SQLException ex) {
            ex.getStackTrace();
        }

        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm_pwd = request.getParameter("confirmpassword");

        String query;
        try {
            String if_userexist = "SELECT * FROM users where username='" + username + "'";
            try {
                rs = st.executeQuery(if_userexist);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (rs.next()) {
                    request.setAttribute("login_msg", "Username already taken! Please try another username");
                    rd.forward(request, response);
                } else {

                    query = "INSERT INTO users (fname, lname, username, password, usertype) values ('" + firstname + "','" + lastname + "','" + username + "','" + password + "','2')";
                    st.executeUpdate(query);
                    st.close();
                    session.setAttribute("uname", username);
                    response.sendRedirect("index.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } finally {

        }

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            doPost(request,response);
//    }
}}
