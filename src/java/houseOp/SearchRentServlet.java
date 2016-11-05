/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package houseOp;

import algoOp.SAW;
import algoOp.TOPSIS;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
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


public class SearchRentServlet extends HttpServlet {
    
    private static Connection connection;
    private static Statement stmt;
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
                    String message = "start";
                    String url = "";
                    int counter = 0, rec_counter = 0; //plithos 4arwn oriwn kai eggrafon antistoixa
                    int flag = 0;   //an yparxei estw kai enas periorismos sto where
                    int weight_flag = 0;
                    int weight1=0, weight2=0, weight3=0, weight4=0; 
                    //getparameters edw
                    String username =(String) session.getAttribute("username");
                    String query = "select * from house_rent where Confirmed_User_username != \""+ username + "\" ";
                    int min_price = 0;
                    
                    if(!request.getParameter("min_price").equals("")&& !request.getParameter("max_price").equals("")
                            && !request.getParameter("weight1").equals("")){
                        flag = 1;
                        min_price = Integer.parseInt(request.getParameter("min_price"));
                        String max_price = request.getParameter("max_price");
                        weight1 = Integer.parseInt(request.getParameter("weight1"));
                        if(weight1 < 1 || weight1 > 5){
                            weight_flag=1;  //lathos timh varous
                        }
                        query += "and price>="+ min_price + " and price<="+ max_price + " ";
                        counter++;
                    }
                    else if(!request.getParameter("min_price").equals("")|| !request.getParameter("max_price").equals("")
                            || !request.getParameter("weight1").equals("")){

                        flag = 2;
                    }
                    if(!request.getParameter("place").equals("")){
                        flag = 1;
                        query += "and place=\""+ request.getParameter("place") + "\" ";
                        
                    }
                    if(!request.getParameter("min_area_size").equals("")&& !request.getParameter("max_area_size").equals("")
                            && !request.getParameter("weight2").equals("")){
                        flag = 1;
                        String min_area_size = request.getParameter("min_area_size");
                        String max_area_size = request.getParameter("max_area_size");
                        weight2 = Integer.parseInt(request.getParameter("weight2"));
                        if(weight2 < 1 || weight2 > 5){
                            weight_flag=1;
                        }
                        query += "and area_size>="+ min_area_size + " and area_size<="+ max_area_size + " " ;
                        counter++;
                    }             
                    else if(!request.getParameter("min_area_size").equals("")|| !request.getParameter("max_area_size").equals("")
                            || !request.getParameter("weight2").equals("")){
                        flag = 2;
                    }
                    if(request.getParameter("house_or_appartment").equals("house")){
                        flag = 1;
                        query += "and house_or_appartment=0 ";
                    }
                    if(request.getParameter("house_or_appartment").equals("appartment")){
                        flag = 1;
                        query += "and house_or_appartment=1 ";
                    }
                    if(!request.getParameter("min_shared").equals("")&& !request.getParameter("max_shared").equals("")
                            && !request.getParameter("weight3").equals("")){
                        flag = 1;
                        String min_shared = request.getParameter("min_shared");
                        String max_shared = request.getParameter("max_shared");
                        weight3 = Integer.parseInt(request.getParameter("weight3"));
                        if(weight3 < 1 || weight3 > 5){
                            weight_flag=1;
                        }
                        query += "and shared>="+ min_shared + " and shared<="+ max_shared + " " ;
                        counter++;
                    }             
                    else if(!request.getParameter("min_shared").equals("")|| !request.getParameter("max_shared").equals("")
                            || !request.getParameter("weight3").equals("")){
                        flag = 2;
                    }
                    if(!request.getParameter("min_year").equals("")&& !request.getParameter("max_year").equals("")
                            && !request.getParameter("weight4").equals("")){
                        flag = 1;
                        String min_year = request.getParameter("min_year");
                        String max_year = request.getParameter("max_year");
                        weight4 = Integer.parseInt(request.getParameter("weight4"));
                        if(weight4 < 1 || weight4 > 5){
                            weight_flag=1;
                        }
                        query += "and year>="+ min_year + " and year<="+ max_year + " " ;
                        counter++;
                    }             
                    else if(!request.getParameter("min_year").equals("")|| !request.getParameter("max_year").equals("")
                            || !request.getParameter("weight4").equals("")){
                        url = "/search_for_rent.jsp";
                        message="3orno";
                        flag = 2;
                    }
                    if(request.getParameter("none_central_or_self").equals("none")){
                        flag = 1;
                        query += "and none_central_or_self=0 ";
                    }
                    if (request.getParameter("none_central_or_self").equals("central")){
                        flag = 1;
                        query += "and none_central_or_self=1 ";
                    }
                    if (request.getParameter("none_central_or_self").equals("autonomous")){
                        flag = 1;
                        query += "and none_central_or_self=2 ";     //for autonomous
                    }
                    //query += ";"
                    
                    

                    //getparameters mexri edw
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
                    //query kai epistrofes edw
                    if (flag!=0 && weight_flag==0){
                        set = stmt.executeQuery(query);
                        while(set.next()){
                            rec_counter++;
                        }
                        if (rec_counter==0){
                            flag=4;
                        }
                        else{
                                int [] ids = new int[rec_counter];
                                double [] weight = new double[counter];
                                double [] [] initMatrix  = new double[rec_counter][counter];
                                int j;
                                int i = 0;
                                set.first();
                                //ids[i]=set.getInt("idhouse_rent");
                                do{
                                    j=0;

                                    if(weight1 != 0){
                                        weight[j]=weight1;
                                        initMatrix[i][j] = min_price/set.getDouble("price");
                                        j++;
                                    }
                                    if(weight2 != 0){
                                        weight[j]=weight2;
                                        initMatrix[i][j] = set.getDouble("area_size");
                                        j++;
                                    }
                                    if(weight3 != 0){
                                        weight[j]=weight3;
                                        initMatrix[i][j] = set.getDouble("shared");
                                        j++;
                                    }
                                    if(weight4 != 0){
                                        weight[j]=weight4;
                                        initMatrix[i][j] = set.getDouble("year");
                                        j++;
                                    }

                                    ids[i]=set.getInt("idhouse_rent");
                                    i++;

                                }while(set.next());
                                int length;
                                if(rec_counter < 10){
                                    length = rec_counter;
                                }else{
                                    length = 10;
                                }
                                int [] better = new int[length];

                                if(request.getParameter("algorithm").equals("TOPSIS")){
                                    if(counter == 0){   //dn yparxoun varu ara vgale ta 10 prwta
                                        //o algorithmos dn leitourgei xwris varu!!
                                        for(int k = 0; k < length; k++)
                                        {
                                            better[k] = ids[k];
                                        }
                                    }else{
                                        TOPSIS topsis = new TOPSIS(weight,initMatrix,rec_counter,counter);
                                        better = getBetterIds(ids,topsis.getClosenesCoefficient(),rec_counter);
                                    }
                                    session.setAttribute("ids", better);
                                }else if(request.getParameter("algorithm").equals("SAW")){
                                    SAW saw = new SAW(weight,initMatrix,rec_counter,counter);
                                    better = getBetterIds(ids,saw.getSum(),rec_counter);
                                    session.setAttribute("ids", better);
                                }else{
                                    //message = "algorithm";
                                    flag = 3;
                                }
                            }
                    }
                    
                    if(weight_flag ==1){    //dn evale varu
                        message = "weight";
                        
                    }
                    if(flag ==0){   //den evale tipota
                        message = "nothing";
                        
                    }
                    if(flag ==3){   //dn evale algorithmo
                        message = "algorithm";
                        
                    }
                    if(flag ==2){   //dn evale kai ta 3 pou xreiazontai (me evrh)
                        message = "3orno";
                        
                    }
                    if(flag ==4){   //dn evgale tipota to query pou na ton kaluptei
                        message = "Nothing_found";
                        
                    }
                    if(flag==1 && weight_flag==0){   //ola ok
                        request.setAttribute("search","ok");
                    }
                    url = "/search_for_rent.jsp";
                    request.setAttribute("message",message);
                    session.setAttribute("sale", "false");
                    
                    //query kai epistrofes mexri edw
                    connection.close();
                    stmt.close();
                    RequestDispatcher dispatcher =
                            getServletContext().getRequestDispatcher(url);
                    dispatcher.forward(request, response);
                    } catch (SQLException ex) {
                    Logger.getLogger(AddRentServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

    }
    
    public static int[] getBetterIds(int[] ids,double[] coefficients,int length){
        
        int [] better;
        if(length < 10){
            better = new int[length];
            double max ;
            int index = 0;
            for(int i=0; i<length; i++){
                max = -1.0;
                for(int j=0; j<length; j++){
                    if(coefficients[j] >= max){
                        max = coefficients[j];
                        index = j;
                    }
                }
                better[i] = ids[index];
                coefficients[index] = -1;
            }
        }else{
            better = new int[10];
            double max ;
            int index = 0;
            for(int i=0; i<10; i++){
                max = -1.0;
                for(int j=0; j<length; j++){
                    if(coefficients[j] >= max){
                        max = coefficients[j];
                        index = j;
                    }
                }
                better[i] = ids[index];
                coefficients[index] = -1;
            }
        }
        return better;
    }
    
     
}
