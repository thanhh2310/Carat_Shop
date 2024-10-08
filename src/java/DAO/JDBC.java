/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JDBC {
    public static Connection getConnection(){
        Connection c=null;
        try {
            // register driver
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            String url="jdbc:mySql://localhost:3306/carat_shop";
            String username="root";
            String password="123456";
            //create connect
            c=DriverManager.getConnection(url,username, password);
        } catch (Exception e) {
            Logger.getLogger(JDBC.class.getName()).log(Level.SEVERE, null, e);
        }
        return c;
    }
    
    public static void closeConnection(Connection c){
         try{
            if(c!=null){
                c.close();
            }
        }catch(Exception e){
            e.printStackTrace();
            
        }
        
    }
}

