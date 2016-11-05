/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Servlet diaxeirishs xrhstwn analoga me to koumpi pou pataei o admin
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

import javax.servlet.http.HttpServlet;


public class ManageUserServlet extends HttpServlet {
    Connection connection;
    Statement stmt;
    
    @Override
    
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
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
            ResultSet setb = null;
            String username = "";
            String password = "";
            String name = "";
            String surname= "";
            String email_address= "";
            //String message="";
            long phone;
            int lessor = 0;
            int seller = 0;
            int tenant = 0;
            int buyer = 0;
            int visitor = 0;
            
            int count=0,countb=0;
            int flag = 0;
            set = stmt.executeQuery("SELECT * FROM Pending_User");
            
            while (set.next()) {
                count++;
            }
            
            setb = stmt.executeQuery("SELECT * FROM Confirmed_User where admin != 1");
            while (setb.next()){
                countb++;
            }
            //int count = Integer.parseInt(set);
            for (int i = 1; i <= count; i++){
                if(request.getParameter("button."+i)!=null){
                    username = request.getParameter("username."+i);
                    flag = 1;
                }
                if(request.getParameter("remove."+i)!=null){
                    username = request.getParameter("username."+i);
                    flag = 2;
                    
                }
            }
            if(flag==0){
                for (int i = count+1; i <= count+countb; i++){
                    if(request.getParameter("remove."+i)!=null){
                        username = request.getParameter("username."+i);
                        flag = 3;  
                    }
                }
            }
            String sql = null;
            if (flag==1){
                set = stmt.executeQuery("SELECT * FROM Pending_User WHERE username = \"" + username + "\"");
                set.next();
                password = set.getString("password");
                name = set.getString("name");
                surname = set.getString("surname");
                email_address = set.getString("email_address");
                phone = set.getLong("phone");
                lessor = set.getInt("lessor");
                seller = set.getInt("seller");
                tenant = set.getInt("tenant");
                buyer = set.getInt("buyer");
                visitor = set.getInt("visitor");

                
                                     //Add the data into the database
                sql = "insert into Confirmed_User values (?,?,?,?,?,?,?,?,?,?,?,?)";
                try (PreparedStatement pst = connection.prepareStatement(sql)) {
                    pst.setString(1, username);
                    pst.setString(2, password);
                    pst.setString(3, name);
                    pst.setString(4, surname);
                    pst.setString(5, email_address);
                    pst.setLong(6, phone);
                    pst.setInt(7, 0);
                    pst.setInt(8, lessor);
                    pst.setInt(9, seller);
                    pst.setInt(10, tenant);
                    pst.setInt(11, buyer);
                    pst.setInt(12, visitor);
                    pst.executeUpdate();
                    //message = "registered";
                    //url = "/manage_users.jsp";

                   pst.close(); 

                }
                sql ="delete from Pending_User where username = \"" + username + "\"";
                try (PreparedStatement pst = connection.prepareStatement(sql)) {
                    pst.executeUpdate();
                }
            }
            if(flag==2){
                sql ="delete from Pending_User where username = \"" + username + "\"";
                try (PreparedStatement pst = connection.prepareStatement(sql)) {
                    pst.executeUpdate();
                }
            }
            if(flag==3){
                sql ="delete from Confirmed_User where username = \"" + username + "\"";
                try (PreparedStatement pst = connection.prepareStatement(sql)) {
                    pst.executeUpdate();
                }
            }
            

            //request.setAttribute("message", message);
            connection.close();
            stmt.close();
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher("/manage_users.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ManageUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
