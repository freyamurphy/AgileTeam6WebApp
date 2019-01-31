/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author freyamurphy
 */
public class DBConnectTest {
    
    public DBConnectTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of DBConnect constructor with no parameters
     */
    @Test
    public void testDBConnectNoParameters() {
        // These are the default values that should be assigned in the constructor
        String expectedDriver = "com.mysql.jdbc.Driver";
        String expectedUrl = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam6db";
        String expectedUser = "18agileteam6";
        String expectedPassword = "1243.at6.3421";
        
        DBConnect dbConnect = new DBConnect();
        
        String driver = dbConnect.getDriver();
        String url = dbConnect.getUrl();
        String user = dbConnect.getUser();
        String password = dbConnect.getPassword();
        
        assertEquals("driver is not assigned correct value in DBConnect()", driver, expectedDriver);
        assertEquals("url is not assigned correct value in DBConnect()", url, expectedUrl);
        assertEquals("user is not assigned correct value in DBConnect()", user, expectedUser);
        assertEquals("password is not assigned correct value in DBConnect()", password, expectedPassword);
    }
    
    @Test
    public void testDBConnectWithParameters() {
        String expectedDriver = "driver";
        String expectedUrl = "url";
        String expectedUser = "user";
        String expectedPassword = "password";
        
        DBConnect dbConnect = new DBConnect(expectedDriver, expectedUrl, expectedUser, expectedPassword);
        
        String driver = dbConnect.getDriver();
        String url = dbConnect.getUrl();
        String user = dbConnect.getUser();
        String password = dbConnect.getPassword();
        
        assertEquals("driver is not assigned correct value in DBConnect()", driver, expectedDriver);
        assertEquals("url is not assigned correct value in DBConnect()", url, expectedUrl);
        assertEquals("user is not assigned correct value in DBConnect()", user, expectedUser);
        assertEquals("password is not assigned correct value in DBConnect()", password, expectedPassword);
    }
    
    @Test
    public void testConnect() {
        // Use default parameters (correct log in details)
        DBConnect dbConnect = new DBConnect();
        
        // Try to connect to the database
        Connection connection = dbConnect.connect();
        
        // The connection should be successful.
        assertNotNull("Database connection fails with correct log in details", connection);
        
        // Use incorrect parameters to log in
        DBConnect badConnect = new DBConnect("wrong driver", "wrong url", "wrong user", "wrong password");
        Connection badConnection = badConnect.connect();
        
        // The connection should fail.
        assertNull("Database connection is successful with incorrect log in details", badConnection);
        
    }
    
}
