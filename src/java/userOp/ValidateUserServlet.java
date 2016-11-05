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
/**
 *
 * @author yannis bitsikokos
 */
public class ValidateUserServlet extends HttpServlet {
    
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
    
    public boolean isValidEmailAddress(String email) {
           String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
           java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
           java.util.regex.Matcher m = p.matcher(email);
           return m.matches();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException
    {
            HttpSession session = request.getSession(false);
            String message = "start";
            String url = "";
            int flag=0;     //password==password_confirmation && unique username
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String password_confirmation = request.getParameter("password_confirmation");
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String email_address = request.getParameter("email_address");
            if (isValidEmailAddress(email_address)==false){
                message = "wrong_email";
                url = "/signup_form.jsp";
                flag=1;
            }
            long phone;
            if(request.getParameter("phone").equals(""))
                phone = 0;
            else
                phone = Long.parseLong(request.getParameter("phone"));
            
            int lessor = 0;
            int seller = 0;
            int tenant = 0;
            int buyer = 0;
            int visitor = 0;
            

            

            
            if(request.getParameter("Lessor").equals("y")){
                lessor = 1;
            }else if(!request.getParameter("Lessor").equals("")){
                    message = "WrongLetter";
                    url = "/signup_form.jsp";
                    flag=1;
            }
            
            if(request.getParameter("Seller").equals("y")){
                seller = 1;
            }else if(!request.getParameter("Seller").equals("")){
                    message = "WrongLetter";
                    url = "/signup_form.jsp";
                    flag=1;
            }
            
            if(request.getParameter("Tenant").equals("y")){
                tenant = 1;
            }else if(!request.getParameter("Tenant").equals("")){
                    message = "WrongLetter";
                    url = "/signup_form.jsp";
                    flag=1;
            }
            
            if(request.getParameter("Buyer").equals("y")){
                buyer = 1;
            }else if(!request.getParameter("Buyer").equals("")){
                    message = "WrongLetter";
                    url = "/signup_form.jsp";
                    flag=1;
            }
            
            if(request.getParameter("Visitor").equals("y")){
                visitor = 1;
            }else if(!request.getParameter("Visitor").equals("")){
                    message = "WrongLetter";
                    url = "/signup_form.jsp";
                    flag=1;
            }
            if(visitor == 1){
                lessor =0;
                seller = 0;
                tenant = 0;
                buyer = 0;
            }
        try {
            //Standar kwdikas gia epikoinwnia me server

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
            int counter=0;


            if(flag == 0){
                if (lessor!=1 && seller!=1 &&  tenant!=1 && buyer!=1 && visitor!=1 ){
                        message = "EmptyRole";
                        url = "/signup_form.jsp";
                        flag=1;
                }
            }
            
            if(flag == 0){
                if ((username.length() == 0 ||
                            password.length() == 0  ||
                            name.length() == 0  ||
                            surname.length() == 0  ||
                            email_address.length() == 0 ||
                            phone == 0))
                    {
                        flag = 1;
                        message = "Empty";
                        url = "/signup_form.jsp";
                    }
            }
            if(flag == 0){
                //elegxos while me synthikes otan vgei ap th while tha prepei na ton valw sth vash
                
                set = stmt.executeQuery("SELECT * FROM Pending_User WHERE username = \"" + username + "\"");

                if(set.next()){
                    flag=1;
                    message = "username taken";
                    url = "/signup_form.jsp";
                }
            }
            if(flag == 0){
                counter = 0;
                set = stmt.executeQuery("SELECT * FROM Confirmed_User WHERE username = \"" + username + "\"");
                

                if(set.next()){
                    flag=1;
                    message = "username taken";
                    url = "/signup_form.jsp";
                }
            }
            
            if(flag == 0){
                counter = 0;
                //elegxos while me synthikes otan vgei ap th while tha prepei na ton valw sth vash
                
                set = stmt.executeQuery("SELECT * FROM Pending_User WHERE email_address = \"" + email_address + "\"");

                if(set.next()){
                    flag=1;
                    message = "email taken";
                    url = "/signup_form.jsp";
                }
            }
            if(flag == 0){
                counter = 0;
                set = stmt.executeQuery("SELECT * FROM Confirmed_User WHERE email_address = \"" + email_address + "\"");
                

                if(set.next()){
                    flag=1;
                    message = "email taken";
                    url = "/signup_form.jsp";
                }
            }
            
            if(flag == 0){
                if (!(password.equals(password_confirmation))){
                    flag=1;
                    //out.println("Wrong password confirmation!!!");
                    message = "pass confir";
                    url = "/signup_form.jsp";
                }   
            }

                // validate the parameters
            if (flag==0){
                String sql = null;
                                 //Add the data into the database
                //admin dn einai kaneis ,mono enas o admin admin
                      sql = 
                      "insert into Pending_User values (?,?,?,?,?,?,0,?,?,?,?,?)";
                try (PreparedStatement pst = connection.prepareStatement(sql)) {
                    pst.setString(1, username);
                    pst.setString(2, password);
                    pst.setString(3, name);
                    pst.setString(4, surname);
                    pst.setString(5, email_address);
                    pst.setLong(6, phone);
                    //pst.setInt(7, 0);
                    pst.setInt(7, lessor);
                    pst.setInt(8, seller);
                    pst.setInt(9, tenant);
                    pst.setInt(10, buyer);
                    pst.setInt(11, visitor);
                    pst.executeUpdate();
                    message = "registered";
                    url = "/index.jsp";
                }

            }
            
            request.setAttribute("message", message);
            connection.close();
            stmt.close();
            RequestDispatcher dispatcher =
                    getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ValidateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
