/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package EmailOp;

import houseOp.House;
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
import userOp.User;

public class SendEmailServlet extends HttpServlet{
    Connection connection;
    PreparedStatement stmt;
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
        HttpSession session=request.getSession(false);
        String question = null;
        String message = "";
        int flag = 0;   //an tha stalthei mail i' oxi
        int idemail = 0;
        
        if(request.getParameter("question").equals("")){
            message = "empty";
            flag = 1;  //adeio to kouti me to mail ara den yparxei mail
        }else{
            question = request.getParameter("question");
        }
        
        try {
            if(flag == 0){  //yparxei mail pou prepei na stalei
                try {
                    Context initContext = new InitialContext();
                    Context context = (Context) initContext.lookup("java:/comp/env");
                    DataSource ds = (DataSource) context.lookup("jdbc/Schemas");
                    connection = ds.getConnection();
                    //stmt = connection.createStatement();
                } catch (SQLException | NamingException e) {
                    System.out.println(e.getMessage());
                }
                if (connection == null)
                {
                    throw new SQLException("ERROR establishing connection!");
                }
                int counter = 1;
                ResultSet set = null;
                Statement st = null;
                st = connection.createStatement();
                if(session.getAttribute("sale").equals("true")){
                    set = st.executeQuery("select * from email_sale");
                    while(set.next()){
                        counter++;
                    }
                    if(counter == 1){   //einai to prwto
                        idemail = counter;
                    }else{
                        set.last();
                        idemail = set.getInt("idEmail_sale")+1;     //alliws einai to teleftaio mail p exei erthei
                    }
                }
                if(session.getAttribute("sale").equals("false")){
                    set = st.executeQuery("select * from email_rent");
                    while(set.next()){
                    counter++;
                    }
                    if(counter == 1){
                        idemail = counter;
                    }else{
                        set.last();
                        idemail = set.getInt("idEmail_rent") + 1;
                    }
                }
                
                
                
                User user = (User) session.getAttribute("user");
                House house = (House)session.getAttribute("house");
                
                String email = user.getEmailaddress();
                int id_house = house.getId();
                
                String query;
                if(session.getAttribute("sale").equals("true")){
                    query = "insert into email_sale values(?,?,?,?)";
                }else{
                    query = "insert into email_rent values(?,?,?,?)";
                }
                message = "ok";
                stmt = connection.prepareStatement(query);
                
                stmt.setInt(1, idemail);
                stmt.setString(2, email);
                stmt.setString(3, question);
                stmt.setInt(4, id_house);
                stmt.executeUpdate();
                
                stmt.close();
                connection.close();
            }
                request.setAttribute("message",message);
                RequestDispatcher dispatcher =
                                getServletContext().getRequestDispatcher("/others_house_details.jsp");
                        dispatcher.forward(request, response);
                
        } catch (SQLException ex) {
            Logger.getLogger(SendEmailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
