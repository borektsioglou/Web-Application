/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package houseOp;


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
/**
 *
 * @author yannis bitsikokos
 */
public class AddSaleServlet extends HttpServlet {
    
    Connection connection;
    Statement stmt;
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

                try {
                    HttpSession session = request.getSession(false);
                    int idhouse_sale = 0;
                    int price;
                    int area_size;
                    int shared;
                    int year;
                    double lng = 0;
                    double lat = 0;
                    int flag=0;
                    String message = "start";
                    String url = "";
                    
                    if(!request.getParameter("price").equals(""))
                        price = Integer.parseInt(request.getParameter("price"));
                    else
                        price = 0;
                    
                    String place = request.getParameter("place");
                    if(!request.getParameter("area_size").equals(""))
                        area_size = Integer.parseInt(request.getParameter("area_size"));
                    else
                        area_size = 0;
                    int house_or_apartment = -1;
                    //Int house_or_appartment = Integer.parseInt(request.getParameter("house_or_appartment"));
                    if (request.getParameter("house_or_appartment").equals("house")){
                        house_or_apartment = 0;
                    }
                    if (request.getParameter("house_or_appartment").equals("appartment")){
                        house_or_apartment = 1;
                    }
                    if(!request.getParameter("shared").equals(""))
                        shared = Integer.parseInt(request.getParameter("shared"));
                    else
                        shared = 0;
                    if(!request.getParameter("year").equals(""))
                        year = Integer.parseInt(request.getParameter("year"));
                    else
                        year = 0;
                    int none_central_or_self = -1;
                    if (request.getParameter("none_central_or_self").equals("none")){
                        none_central_or_self = 0;
                    }
                    if (request.getParameter("none_central_or_self").equals("central")){
                        none_central_or_self = 1;
                    }
                    if (request.getParameter("none_central_or_self").equals("autonomous")){
                        none_central_or_self = 2;
                    }
                    String description = "";

                    if(!request.getParameter("description").equals("")){
                        description = request.getParameter("description");
                    }
                    if(!request.getParameter("lng").equals("default")){
                        lng = Double.parseDouble(request.getParameter("lng"));
                    }else{
                        message = "Empty_map";
                        flag = 1;
                        url = "/add_for_sale.jsp";
                    }
                    if(!request.getParameter("lat").equals("default")){
                        lat = Double.parseDouble(request.getParameter("lat"));
                    }else{
                        message = "Empty_map";
                        flag = 1;
                        url = "/add_for_sale.jsp";
                    }
                    
                    String username =(String) session.getAttribute("username");
                    

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
                    set = stmt.executeQuery("select * from house_sale");
                    int counter = 1;
                    while(set.next()){
                        counter++;
                    }
                    idhouse_sale = counter;
                    if (idhouse_sale == 0 || price == 0  || place.length() == 0  || house_or_apartment == -1
                            || area_size == 0  || shared == 0 || year == 0 || none_central_or_self == -1)
                    {
                        flag = 1;
                        message = "Empty";
                        url = "/add_for_sale.jsp";
                    }
                    if (flag==0){
                        
                        String info = "Price: " + price + " euros, Area size: " +area_size +
                                " squared meters in " + place;
                        //MAIN KWDIKAS GIA QUERIES
                        String sql = null;
                        //Add the data into the database
                        sql = "insert into house_sale values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
                        try (PreparedStatement pst = connection.prepareStatement(sql)) {
                            pst.setInt(1, idhouse_sale);
                            pst.setInt(2, price);
                            pst.setString(3, place);
                            pst.setInt(4, area_size);
                            pst.setInt(5, house_or_apartment);
                            pst.setInt(6, shared);
                            pst.setInt(7, year);
                            pst.setInt(8, none_central_or_self);
                            pst.setString(9, description);
                            pst.setString(10, username);
                            pst.setDouble(11,lng);
                            pst.setDouble(12,lat);
                            pst.setString(13, info);
                            
                            pst.executeUpdate();
                            message = "registered";
                            url = "/main_page.jsp";
                        }
                    }
                    
                    
                    request.setAttribute("messages", message);
                    connection.close();
                    stmt.close();
                    RequestDispatcher dispatcher =
                            getServletContext().getRequestDispatcher(url);
                    dispatcher.forward(request, response);
                    
                } catch (SQLException ex) {
                    Logger.getLogger(AddSaleServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

    }
}