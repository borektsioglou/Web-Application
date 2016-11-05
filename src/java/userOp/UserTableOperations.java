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
import userOp.User;

/**
 *
 * @author johnnys
 */
public class UserTableOperations {
    
    private static Connection connection;
    private static Statement stmt;
    
        public static List<User> getPendUsers() {

        //epistrefei lista me olous tous pending users
	List<User> pendUsers = new LinkedList<User>();
	try {
            ResultSet set;
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
            
            set = stmt.executeQuery("SELECT * FROM pending_user");


	    String username;
	    String name;
	    String surname;
	    String password;
	    String email;
            long phone;


	    while (set.next()) {
		username = set.getString("username");
		name = set.getString("name");
		surname = set.getString("surname");
		password = set.getString("password");
		email = set.getString("email_address");
                phone = set.getLong("phone");
                
		User us = new User(username, password, name, surname, email,phone);
		pendUsers.add(us);
	    }
            connection.close();
            stmt.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}
	return pendUsers;
    }
        

    public static List<User> getConfUsers() {

    //epistrefei lista me olous tous confirmed users
    LinkedList<User> confUsers = new LinkedList<User>();

	try {
            ResultSet set;
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

            set = stmt.executeQuery("SELECT * FROM confirmed_user ");


	    String username;
	    String name;
	    String surname;
	    String password;
	    String email;
            long phone;
            int admin;


	    while (set.next()) {
		username = set.getString("username");
		name = set.getString("name");
		surname = set.getString("surname");
		password = set.getString("password");
		email = set.getString("email_address");
                phone = set.getLong("phone");
                admin = set.getInt("admin");
                
                if(admin == 0){
                    User us = new User(username, password, name, surname, email,phone);
                    confUsers.add(us);
                }
	    }
            connection.close();
            stmt.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}



	return confUsers;
    
    }
    
}
