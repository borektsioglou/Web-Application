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

public class DeleteEmailServlet extends HttpServlet {
    
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
        try {
            int flag =0;    //an svhsthkan mail kathgorias i' memonomena
            int id = 0; //id mail
            int house_id;   //id spitiou
            int counter = 0;    //plithos apotemesmatwn eperwthmatos
            
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
            ResultSet set = null;
            
            House house = (House) session.getAttribute("house");
            house_id = house.getId();
            String query = null;
            
            if(request.getParameter("button0")!=null){  
            //an paththike to button0 svhnontai ola ta mail ths kathgorias sale i' rent
                
                if(session.getAttribute("sale").equals("true")){
                    query = "delete from email_sale where house_sale_idhouse_sale = ?";
                }else{
                    query = "delete from email_rent where house_rent_idhouse_rent = ?";
                }
                stmt = connection.prepareStatement(query);
                stmt.setInt(1, house_id);
                stmt.executeUpdate();
                flag = 1;   //svhsthkan ta mail kathgorias email_sale i' email_rent
            }
            
            Statement st = null;
            st = connection.createStatement();
            if(flag == 0){
                if(session.getAttribute("sale").equals("true")){
                    set = st.executeQuery("select * from email_sale");
                }else{
                    set = st.executeQuery("select * from email_rent");
                }

                while(set.next()){
                    counter++;
                }

                for(int i=1; i<=counter; i++){
                    if(request.getParameter("button"+i)!=null){
                        //vriskw to id tou mail pou thelei na svhsei o xrhsths tou programmatos
                        id = Integer.parseInt(request.getParameter("email"+i));
                        flag = 2;
                    }
                }
                if(session.getAttribute("sale").equals("true")){
                    query = "delete from email_sale where house_sale_idhouse_sale = ? and idEmail_sale = ?";
                }else{
                    query = "delete from email_rent where house_rent_idhouse_rent = ? and idEmail_rent = ?";
                }
                
                stmt = connection.prepareStatement(query);
                
                stmt.setInt(1, house_id);
                stmt.setInt(2, id);
                stmt.executeUpdate();
            }
            
            stmt.close();
            connection.close();
            
            RequestDispatcher dispatcher =
                            getServletContext().getRequestDispatcher("/house_details.jsp");
                    dispatcher.forward(request, response);
                
            
        } catch (SQLException ex) {
                    Logger.getLogger(DeleteEmailServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
        
    }
    
}
