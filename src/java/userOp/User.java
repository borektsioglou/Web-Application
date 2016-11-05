/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package userOp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author johnnys
 */

public class User {

    private String username;
    private String password;
    private String name;
    private String surname;
    private String email_address;
    private long phone;

    
    public User()
    {
        username = "";
        password = "";
        name = "";
        surname = "";
        email_address = "";
        phone = 0;
    }
    
    public User(String u, String p, String n, String s, String e, long ph)
    {
        username = u;
        password = p;
        name = n;
        surname = s;
        email_address = e;
        phone = ph;
    }
     
    public void setUsername(String u)
    {
        username = u;
    }
    public String getUsername()
    { 
        return username; 
    }
    
    public void setPassword(String pa)
    {
        password = pa;
    }
    public String getPassword()
    { 
        return password; 
    }
    
    public void setName(String n)
    {
        name = n;
    }
    public String getName()
    { 
        return name; 
    }
    
    public void setSurname(String sur)
    {
        surname = sur;
    }
    public String getSurname()
    { 
        return surname; 
    }
    
    public void setEmailaddress(String ema)
    {
        email_address = ema;
    }
    public String getEmailaddress()
    { 
        return email_address; 
    }
    
    public void setPhone(long pho)
    {
        phone = pho;
    }
    public long getPhone()
    { 
        return phone; 
    }
    
    public static List<String> getUserRoles(String username) throws SQLException{
        //epistrefei lista me tous rolous tou xrhsth me username:username
        LinkedList<String> roles = new LinkedList<String>();
        
        Connection connection = null;
        Statement stmt = null;
        try{
            try{
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

                set = stmt.executeQuery("SELECT * FROM pend_users where username ='" + username +"'");
                set.next();

                String role;

                int admin = set.getInt("admin");
                int lessor = set.getInt("lessor");
                int seller = set.getInt("seller");
                int tenant = set.getInt("tenant");
                int buyer = set.getInt("buyer");
                int visitor = set.getInt("visitor");

                if(admin == 1){
                    //role = "admin";
                    roles.add("admin");
                }
                if(lessor == 1){
                    role = "lessor";
                    roles.add(role);
                }
                if(seller == 1){
                    role = "seller";
                    roles.add(role);
                }
                if(tenant == 1){
                    role = "tenant";
                    roles.add(role);
                }
                if(buyer == 1){
                    role = "buyer";
                    roles.add(role);
                }
                if(visitor == 1){
                    role = "visitor";
                    roles.add(role);
                }

                connection.close();
                stmt.close();
       } catch (SQLException e) {
	    e.printStackTrace();

	}    
         return roles;
        //return null;
            
    }       
    
}

//public static List<String> getUserRoles(String username) throws SQLException{
