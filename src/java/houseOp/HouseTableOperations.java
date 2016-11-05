/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package houseOp;

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
public class HouseTableOperations {
    
    private static Connection connection;
    private static Statement stmt;
    
        public static List<House> getHouseRent(String username) {


	List<House> houseRent = new LinkedList<House>();
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
            
            
            set = stmt.executeQuery("SELECT * FROM house_rent where confirmed_user_username = \"" + username + "\"");


            int id;
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
            


	    while (set.next()) {
                id = set.getInt("idhouse_rent");
                
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
                 new House(id,price, place, area_size, house_or_appartment, shared, year, heat, description,lng,lat,info);
		houseRent.add(ho);
	    }
            connection.close();
            stmt.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}
	return houseRent;
    }
        

    public static List<House> getHouseSale(String username) {


	List<House> houseSale = new LinkedList<House>();
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
            
            set = stmt.executeQuery("SELECT * FROM house_sale where confirmed_user_username = \"" + username + "\"");

            
            int id;
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
            


	    while (set.next()) {
                id = set.getInt("idhouse_sale");
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
		houseSale.add(ho);
	    }
            connection.close();
            stmt.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}
	return houseSale;
    }
    
    public static List<House> getBetterHousesSale(int[] ids) {
        //pairnei ta ids spitiwn pros pwlhsh kai epistrefei ta 10 top

	List<House> betterHouses = new LinkedList<House>();
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
            int length;
            if(ids.length < 10){
                length = ids.length;
            }else{
                length = 10;
            }
            for(int i=0;i<length;i++){
                set = stmt.executeQuery("SELECT * FROM house_sale where idhouse_sale = " + ids[i]);
                set.next();

                int id;
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



                
                id = ids[i];
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

                House house = 
                 new House(id,price, place, area_size, house_or_appartment, shared, year, heat, description,lng,lat,info);
                betterHouses.add(house);
                
            }
            connection.close();
            stmt.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}
	return betterHouses;
    }
    
    public static List<House> getBetterHousesRent(int[] ids) {
        //pairnei ta ids spitiwn pros enoikiash kai epistrefei ta 10 top

	List<House> betterHouses = new LinkedList<House>();
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
            int length;
            if(ids.length < 10){
                length = ids.length;
            }else{
                length = 10;
            }
            for(int i=0;i<length;i++){
                set = stmt.executeQuery("SELECT * FROM house_rent where idhouse_rent = " + ids[i]);
                set.next();

                int id;
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



                
                id = ids[i];
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

                House house = 
                 new House(id,price, place, area_size, house_or_appartment, shared, year, heat, description,lng,lat,info);
                betterHouses.add(house);
                
            }
            connection.close();
            stmt.close();
	} catch (SQLException e) {
	    e.printStackTrace();

	}
	return betterHouses;
    }
    
}
