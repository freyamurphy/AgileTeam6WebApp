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
        Staff staff = new Staff("username", "password");
        String username = staff.getUsername();
        assertEquals("Username passed in constructor does not match output from getUsername()", username, "username");
    }
    
    @Test
    public void testgetPassword() {
        Staff staff = new Staff("username", "password");
        String password = staff.getPassword();
        assertEquals("Password passed in constructor does not match output from getPassword()", password, "password");
    }
    
}
