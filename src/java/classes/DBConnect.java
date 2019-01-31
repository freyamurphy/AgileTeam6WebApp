/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.*;

/**
 *
 * @author freyamurphy
 */
public class DBConnect {
    String driver;
    String url;
    String user;
    String password;
    
    public DBConnect() {
        driver = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam6db";
        user = "18agileteam6";
        password = "1243.at6.3421";
    }
    
    public DBConnect(String driver, String url, String user, String password) {
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.password = password;
    }
    
    public String getDriver() {
        return driver;
    }
    
    public String getUrl() {
        return url;
    }
    
    public String getUser() {
        return user;
    }
    
    public String getPassword() {
        return password;
    }
    
    public Connection connect() {
        try{  
            Class.forName(driver); 
            
            // Connect to the database
            Connection connection = DriverManager.getConnection(url,user,password); 
            
            return connection;
         }
        catch(Exception e){ System.out.println(e);}  
        return null;    
    }
    
}
