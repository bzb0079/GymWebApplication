import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "AuthenticateUserServlet")
public class AuthenticateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        java.sql.Connection conn;
        java.sql.ResultSet rs = null;
        java.sql.Statement st = null;
        HttpSession session = request.getSession();
        int userID = 0;
        int userType = 0;
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/libraryDB","root","password");
            st=conn.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        String username = request.getParameter("uname");
        String password = request.getParameter("pwd");

        if(username.equals("")){
            request.setAttribute("login_msg", "Enter Username");
            rd.forward(request, response);
        }
//        cant find user name in DB

        String query = "SELECT * FROM users WHERE username = '"+username+ "' and password = '"+password+"'";
        try {
            rs = st.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(AuthenticateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            if(rs.next()){
                userID = Integer.parseInt(rs.getString("user_id"));

                userType=rs.getInt("usertype");
                session.setAttribute("uname",username);
                session.setAttribute("uid", userID);
                session.setAttribute("userType",userType);
                if(userType == 1){
                    response.sendRedirect("adminPage.jsp");

                }
                else{
                    response.sendRedirect("index.jsp");
                }
            }
            else{
                request.setAttribute("login_msg", "Please check your username and password");
                rd.forward(request, response);

            }
        } catch (SQLException ex) {
            Logger.getLogger(AuthenticateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
//            not match password

    }


//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
}
