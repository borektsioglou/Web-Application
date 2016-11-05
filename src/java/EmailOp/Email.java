/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package EmailOp;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class Email {
    private int id;
    private String email_address;
    private String question;
    
    public Email()
    {
        id =0;
        email_address = "";
        question = "";
    }
    
    public Email(int email_id,String ad,String q){
        id = email_id;
        email_address = ad;
        question = q;
    }
    
    public void setId(int email_id){
        id = email_id;
    }
    
    public int getId()
    { 
        return id; 
    }
    
    public void setEmail_address(String email_id){
        email_address = email_id;
    }
    
    public String getEmail_address()
    { 
        return email_address; 
    }
    
    public void setQuestion(String q){
        question = q;
    }
    
    public String getQuestion()
    { 
        return question; 
    }
    
    /**
     *
     * @param idhouse
     * @param s_or_r
     * @return
     * @throws SQLException
     */
    public static List<Email> getEmails(int idhouse,int s_or_r) throws SQLException{
        //epistrefei ola ta mails pou exoun stalthei se ena spiti 
        List<Email> mails = new LinkedList<Email>();
        int sale_or_rent = 0;
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

                if(s_or_r==0){    //sale
                    set = stmt.executeQuery("SELECT * FROM Email_sale where house_sale_idhouse_sale ='" + idhouse +"'");
                    sale_or_rent = 1;
                }
                else{           //rent
                    set = stmt.executeQuery("SELECT * FROM Email_rent where house_rent_idhouse_rent ='" + idhouse +"'");
                    sale_or_rent = 2;
                }
                //set = stmt.executeQuery("SELECT * FROM pend_users where username ='" + username +"'");
                set.afterLast();    //ksekinwntas apo to pio prosfato (anapoda)
                int ID = 0;
                String EMAIL;
                String QUESTION;
                while (set.previous()) {        //kai phgainontas pros ta paw sta apotelesmata
                    if(s_or_r==0){
                        ID = set.getInt("idEmail_sale");
                    }else{
                        ID = set.getInt("idEmail_rent");
                    }
                    EMAIL = set.getString("email_address");
                    QUESTION = set.getString("question");
                    Email e = new Email(ID,EMAIL,QUESTION);
                    mails.add(e);
                }
                
                connection.close();
                stmt.close();
       } catch (SQLException e) {
	    e.printStackTrace();

	}    
         return mails;
        //return null;
            
    }       
    
}
    

