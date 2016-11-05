/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package algoOp;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
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


public class ManageAlgorithmsServlet extends HttpServlet {
   private static Connection connection;
   private static Statement stmt;
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
        HttpSession session = request.getSession(false);
        String topsis = request.getParameter("topsis");
        String saw = request.getParameter("saw");


                //Standar kwdikas gia epikoinwnia me server
            try{
                try {
                Context initContext = new InitialContext();
                Context context = (Context) initContext.lookup("java:/comp/env");
                DataSource ds = (DataSource) context.lookup("jdbc/Schemas");
                connection = ds.getConnection();
                stmt = connection.createStatement();
                } catch (SQLException | NamingException e) {
                    System.out.println(e.getMessage());
                }
                if (connection == null)
                {
                    throw new SQLException("ERROR establishing connection!");
                }

                String query = "update algorithm set topsis = ?,saw = ? where id = 1";
                try (PreparedStatement pst = connection.prepareStatement(query)) {
                    pst.setString(1, topsis);
                    pst.setString(2, saw);
                    pst.executeUpdate();
                }
                
                
                connection.close();
                stmt.close();
                RequestDispatcher dispatcher =
                        getServletContext().getRequestDispatcher("/main_page.jsp");
                dispatcher.forward(request, response);

             }catch (SQLException ex) {
                        Logger.getLogger(ManageAlgorithmsServlet.class.getName()).log(Level.SEVERE, null, ex);
             }
    }


    
    
}
