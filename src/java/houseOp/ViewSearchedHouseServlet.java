/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Servlet gia plhrofories sxetika me katoikia pou koitaei(endiaferetai) o xrhsths
package houseOp;

import java.io.IOException;
import java.sql.Connection;
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


public class ViewSearchedHouseServlet extends HttpServlet{
    
    Connection connection;
    Statement stmt;
    
    @Override
    
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException
    {
        
            try {
                HttpSession session = request.getSession(false);

                int flag = 0;
                
                String url = "";
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
                ResultSet set = null;
                
                int id = 0;
                int price;
                String place;
                int area_size;
                int house_or_appartment;
                int shared;
                int year;
                int heat;
                String description;
                double lng;
                double lat;
                String info;
                
                String username;
                String name;
                String surname;
                String pass;
                String email;
                Long phone;
                
                
                
                for(int i=1; i<=10; i++){
                    if(request.getParameter("button"+i)!=null){
                        id = Integer.parseInt(request.getParameter("id"+i));
                    }
                }
                
                
                if(session.getAttribute("sale").equals("true")){
                    set = stmt.executeQuery("select * from house_sale where idhouse_sale = " + id);
                }
                if(session.getAttribute("sale").equals("false")){
                    set = stmt.executeQuery("select * from house_rent where idhouse_rent = " + id);
                }  
                    set.next();
                    //id = set.getInt("idhouse_sale");
                    price = set.getInt("price");
                    place = set.getString("place");
                    area_size = set.getInt("area_size");
                    house_or_appartment = set.getInt("house_or_appartment");
                    shared = set.getInt("shared");
                    year = set.getInt("year");
                    heat = set.getInt("none_central_or_self");
                    description = set.getString("description");
                    lng = set.getDouble("lng");
                    lat = set.getDouble("lat");
                    info = set.getString("info");
                    
                    username = set.getString("confirmed_user_username");
                    //to onoma tou idiokthth ths katoikias pou koitaei
                    set = stmt.executeQuery("select * from confirmed_user where username = \"" +username+ "\"");
                    set.next();
                    pass = set.getString("password");
                    name = set.getString("name");
                    surname = set.getString("surname");
                    email = set.getString("email_address");
                    phone = set.getLong("phone");
                    
                    User user = new User(username,pass,name,surname,email,phone);
                    session.setAttribute("seller_user",user);
                    
                    House ho =
                            new House(id, price, place, area_size, house_or_appartment, shared, year, heat, description,lng,lat,info);
                    session.setAttribute("house",ho);
                    
                    
                
            connection.close();
            stmt.close();
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher("/others_house_details.jsp");
            dispatcher.forward(request, response);    
            } catch (SQLException ex) {
                Logger.getLogger(ViewSearchedHouseServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
}
