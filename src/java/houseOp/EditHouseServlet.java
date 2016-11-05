/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package houseOp;

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

/**
 *
 * @author johnnys
 */
public class EditHouseServlet extends HttpServlet{

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
        
    
           
                
               
                HttpSession session=request.getSession(false);
                
                
                String message = "";
                int flag = 0;   //1:sfalma

                int id = Integer.parseInt(request.getParameter("id"));
                String place = request.getParameter("place");
                int  price = Integer.parseInt(request.getParameter("price"));
                int  area_size = Integer.parseInt(request.getParameter("area_size"));
                int  year = Integer.parseInt(request.getParameter("year"));
                int  shared = Integer.parseInt(request.getParameter("shared"));
                int house_or_appartment;
                int heat = 0;
                double lng = Double.parseDouble(request.getParameter("lng"));
                double lat = Double.parseDouble(request.getParameter("lat"));
                String description;
                if(request.getParameter("type").equals("house")){
                    house_or_appartment = 0;
                }else if(request.getParameter("type").equals("appartment")){
                    house_or_appartment = 1;
                }else{
                    message = "Error_house";
                    flag = 1;
                }
                    

                try {
                    house_or_appartment = 1;
                    if(request.getParameter("heat").equals("none")){
                        heat = 0;
                    }else if(request.getParameter("heat").equals("central")){
                        heat = 1;
                    }else if(request.getParameter("heat").equals("autonomous")){
                        heat = 2;
                    }else{
                        message = "Error_heat";
                        flag = 1;
                    }
                    description = request.getParameter("description");
                    
                    String info = "Price: " + price + " euros, Area size: " + area_size + " in " + place;
                    try {
                        Context initContext = new InitialContext();
                        Context context = (Context) initContext.lookup("java:/comp/env");
                        DataSource ds = (DataSource) context.lookup("jdbc/Schemas");
                        connection = ds.getConnection();
                        
                    } catch (SQLException | NamingException e) {
                        System.out.println(e.getMessage());
                    }
                    
                    if(flag == 0){
                        String query;
                        if(session.getAttribute("sale").equals("true")){
                            query = "update house_sale set price=? ,"
                                    + "place=?, area_size=?,house_or_appartment = ?,"
                                    + "shared = ?, year = ?, none_central_or_self = ?,description = ?, "
                                    + "lng = ?, lat = ?, info = ? where idhouse_sale = ?";
                        }else{
                            query = "update house_rent set price=? ,"
                                    + "place=?, area_size=?,house_or_appartment = ?,"
                                    + "shared = ?, year = ?, none_central_or_self = ?,description = ?, "
                                    + "lng = ?, lat = ?, info = ? where idhouse_rent = ?";
                        }

                        ResultSet set = null;
                        stmt = connection.prepareStatement(query);


                        stmt.setInt(1, price);
                        stmt.setString(2, place);
                        stmt.setInt(3, area_size);
                        stmt.setInt(4, house_or_appartment);
                        stmt.setInt(5, shared);
                        stmt.setInt(6, year);
                        stmt.setInt(7, heat);
                        stmt.setString(8, description);
                        stmt.setDouble(9,lng);
                        stmt.setDouble(10,lat);
                        stmt.setString(11,info);
                        stmt.setInt(12,id);

                        stmt.executeUpdate();

                        Statement st;
                        st = connection.createStatement();

                        if(session.getAttribute("sale").equals("true")){
                            set = st.executeQuery("select * from house_sale");
                        }else{
                            set = st.executeQuery("select * from house_rent");
                        }
                        set.next();

                        House house = 
                     new House(id, price, place, area_size, house_or_appartment, shared, year, heat, description,lng,lat,info);
                        session.setAttribute("house",house);
                        stmt.close();
                        connection.close();
                    }else{
                        request.setAttribute("message",message);
                    }
                    
                    
                    
                    RequestDispatcher dispatcher =
                            getServletContext().getRequestDispatcher("/house_details.jsp");
                    dispatcher.forward(request, response);
                } catch (SQLException ex) {
                        Logger.getLogger(EditHouseServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

    }
    
}
