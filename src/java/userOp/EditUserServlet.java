/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//O xrhsths mporei na allaksei ta stoixeia tou 
package userOp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;


public class EditUserServlet extends HttpServlet{
    private Connection connection;
    private PreparedStatement stmt;

    /**
     * Edits the specified user's details (changes the database)
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response)
	    throws ServletException, IOException {
        
    
            try {
                HttpSession session=request.getSession(false);
                User user = new User();
                
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String name = request.getParameter("name");
                String surname = request.getParameter("surname");
                String email = request.getParameter("email");
                Long phone = Long.parseLong(request.getParameter("phone"));
                
                
                try {
                    Context initContext = new InitialContext();
                    Context context = (Context) initContext.lookup("java:/comp/env");
                    DataSource ds = (DataSource) context.lookup("jdbc/Schemas");
                    connection = ds.getConnection();

                } catch (SQLException | NamingException e) {
                    System.out.println(e.getMessage());
                }
                ResultSet set;
                
                String query = "update confirmed_user set password=? ,"
                        + "name=?, surname=?,email_address = ?,"
                        + "phone = ? where username = ?";
                
                stmt = connection.prepareStatement(query);
                
                stmt.setString(1,password);
                stmt.setString(2, name);
                stmt.setString(3, surname);
                stmt.setString(4, email);
                stmt.setLong(5, phone);
                stmt.setString(6, username);
                
                stmt.executeUpdate();
                
                user = new User(username, password,
                        name, surname,
                        email, phone);
                
                stmt.close();
                connection.close();

                //setarw sto "user" to antikeimeno xrhsth me allagmena stoixeia
                session.setAttribute("user",user);
                RequestDispatcher dispatcher =
                        getServletContext().getRequestDispatcher("/main_page.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(EditUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
}
