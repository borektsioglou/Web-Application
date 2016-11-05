/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package userOp;


import java.io.*;
import static java.lang.System.out;
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
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

import userOp.User;


public class LoginUserServlet extends HttpServlet {
    
       private  Connection connection;
       private  Statement stmt;
    
    
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    @Override
    protected void doPost(HttpServletRequest request, 
                          HttpServletResponse response) 
                          throws ServletException, IOException
    {
        
            // get parameters from the request
            HttpSession session = request.getSession(false);
            int counter = 0;    //plithos apotelesmatwn enos query
            boolean pending = true;
            //pairnw tis parametrous apo to xrhsth
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String message = new String();      //message analogo gia alert i epityxia
            String url = null;  //to url sto opoio tha metaferthei o xrhsths
            message = username;
            User user = new User();

        try {  
            try {
	    Context initContext = new InitialContext();
	    Context context = (Context) initContext.lookup("java:/comp/env");
	    DataSource ds = (DataSource) context.lookup("jdbc/Schemas");
            connection = ds.getConnection();
            stmt = connection.createStatement();
	    



            } catch (SQLException | NamingException e) {
                System.out.println(e.getMessage());
            }
            ResultSet set;
            if (connection == null)
            {
                throw new SQLException("Error establishing connection!");
            }
            set = stmt.executeQuery("SELECT * FROM Pending_User WHERE username = '" + username + "'");
            while(set.next()){
                counter++;
            }
            
            if(counter == 1){
                set.previous();
                if (set.getString("password").equals(password)) {   //edwse swsta stoixeia kai einai stous pending
                    url = "/index.jsp";
                    pending = true;
                    message = "pending";
                } else {
                    message = "Wrong password";
                    url = "/login.jsp";
                    pending = true;
                }
            }else{
                pending = false;
                stmt = connection.createStatement();
                //den einai stous pending ara elegxw tous confirmed
                set = stmt.executeQuery("SELECT * FROM Confirmed_User WHERE username = '" + username + "'");

                counter = 0;
                while(set.next()){
                    counter++;
                }
                if(counter == 0){   //dn yparxei tetoio username
                    message = "Wrong username";
                    url = "/login.jsp";
                }
                
                else{
                    set.previous();
                    if (set.getString("username").equals(username)) {
                        if (set.getString("password").equals(password)) {   
                            //yparxei me swsta stoixeia stous confirmed
                            url = "/main_page.jsp";
                            pending = false;
                            session.setAttribute("username", username);
                            message = "ok";
                            user = new User(set.getString("username"), set.getString("password"),
                                    set.getString("name"), set.getString("surname"),
                                    set.getString("email_address"), set.getLong("phone"));
                        } else {    //yparxei alla edwse lathos kwdiko
                            message = "Wrong password";
                            url = "/login.jsp";
                            pending = false;
                        }
                    }
                }

            }
            //an einai stous confirmed kai einai visitor dn mporei na exei kai allo rolo
            if (counter > 0 && !pending) {
                if(set.getInt("visitor") == 1){
                    session.setAttribute("admin", 0);
		    session.setAttribute("lessor", 0);
		    session.setAttribute("seller", 0);
		    session.setAttribute("tenant", 0);
		    session.setAttribute("buyer", 0);
                }
                //krataw tous rolous pou exei
                session.setAttribute("admin", Integer.toString(set.getInt("admin")));
                session.setAttribute("lessor", Integer.toString(set.getInt("lessor")));
                session.setAttribute("seller", Integer.toString(set.getInt("seller")));
                session.setAttribute("tenant", Integer.toString(set.getInt("tenant")));
                session.setAttribute("buyer", Integer.toString(set.getInt("buyer")));
                session.setAttribute("visitor", Integer.toString(set.getInt("visitor")));
                
                session.setAttribute("user", user);
            }

            
            request.setAttribute("message", message);
            
            connection.close();
            stmt.close();
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher(url); 
            dispatcher.forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(LoginUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
