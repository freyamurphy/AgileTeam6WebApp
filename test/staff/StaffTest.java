/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff;

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
public class StaffTest {
    
    public StaffTest() {
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

    @Test
    public void testgetUsername() {
        String testUsername = "username";
        Staff staff = new Staff(testUsername, "foo");
        String username = staff.getUsername();
        assertEquals("Username passed in constructor does not match output from getUsername()", username, testUsername);
        
        // Another test to ensure getUsername() does not just return "username" every time
        testUsername = "myUsername";
        Staff anotherStaff = new Staff(testUsername, "foo");
        username = anotherStaff.getUsername();
        assertEquals("Username passed in constructor does not match output from getUsername()", username, testUsername);
    }
    
    @Test
    public void testgetPassword() {
        String testPassword = "password";
        Staff staff = new Staff("foo", testPassword);
        String password = staff.getPassword();
        assertEquals("Password passed in constructor does not match output from getPassword()", password, testPassword);
        
        // Another test to ensure getPassword() does not just return "password" every time
        testPassword = "myPassword";
        Staff anotherStaff = new Staff("foo", testPassword);
        password = anotherStaff.getPassword();
        assertEquals("Password passed in constructor does not match output from getPassword()", password, testPassword);
    }
    
}
