/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package algoOp;

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


public class AlgoTableOperations {
    
    private static Connection connection;
    private static Statement stmt;
    
    public static List<String> getAlgoValues() {
        
        List<String> values = new LinkedList<String>();
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
            
            set = stmt.executeQuery("SELECT * FROM algorithm");


	    String topsis;
	    String saw;
            
            set.next();

            topsis = set.getString("topsis");
            saw = set.getString("saw");

            values.add(topsis);
            values.add(saw);
	    
            connection.close();
            stmt.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}
	return values;
    }
    
}
