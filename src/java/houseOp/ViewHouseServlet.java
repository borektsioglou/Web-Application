/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Servlet gia na vlepei ta stoixeia twn katoikiwn tou o xrhsths pou poulaei i' enoikiazei
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


public class ViewHouseServlet extends HttpServlet{
    
    Connection connection;
    Statement stmt;
    //private String onoma;
    
    @Override
    
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException
    {
        
            try {
                HttpSession session = request.getSession(false);
                int counter = 0;
                int counterb = 0;
                int flag = 0;
                
                //String url = "";
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
                ResultSet setb = null;
                
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
                
                User user = (User) session.getAttribute("user");
                String onoma = user.getUsername();
                set = stmt.executeQuery("select * from house_sale where Confirmed_User_username = \"" + onoma + "\"");
                while(set.next()){
                    counter++;
                }
                
                setb = stmt.executeQuery("select * from house_rent where Confirmed_User_username = \"" + onoma + "\"");
                while(setb.next()){
                    counterb++;
                }
                
                for(int i=1; i<=counter; i++){
                    if(request.getParameter("button"+i)!=null){
                        id = Integer.parseInt(request.getParameter("id"+i));
                        flag = 1;
                    }
                }
                if(flag==0){    //dn patithike koumpi apo ta for sale ara koitaw sta for rent
                    for (int i = counter+1; i <= counter+counterb; i++){
                        if(request.getParameter("button"+i)!=null){
                            id = Integer.parseInt(request.getParameter("id"+i));
                            flag = 2;  
                        }
                    }
                }
                
                if(flag == 1){
                    set = stmt.executeQuery("select * from house_sale where idhouse_sale = " + id);
                    session.setAttribute("sale","true");
                }
                if(flag == 2){
                    set = stmt.executeQuery("select * from house_rent where idhouse_rent = " + id);
                    session.setAttribute("sale","false");
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
                    
                    House ho =
                            new House(id, price, place, area_size, house_or_appartment, shared, year, heat, description,lng,lat,info);
                    session.setAttribute("house",ho);
                    
                
            connection.close();
            stmt.close();
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher("/house_details.jsp");
            dispatcher.forward(request, response);    
            } catch (SQLException ex) {
                Logger.getLogger(ViewHouseServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    
}
