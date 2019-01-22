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
public class StaffHandlerTest {
    
    public StaffHandlerTest() {
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
    public void testisEmpty() {
        StaffHandler staffHandler = new StaffHandler();
        boolean empty = staffHandler.isEmpty();
        assertTrue("The staff list in a new staffHandler is not empty.", empty);
        
    }
    
    @Test
    public void testaddStaff() {
        Staff newMember = new Staff("username", "password");
        StaffHandler staffHandler = new StaffHandler();
        staffHandler.addStaff(newMember);
        
        Staff foundMember = staffHandler.getStaffMember("username");
        String password = foundMember.getPassword();
        assertEquals("Added and stored password do not match", password, "password");
    }
    
    @Test
    public void testgetPassword() {
        Staff newMember = new Staff("username", "password");
        StaffHandler staffHandler = new StaffHandler();
        staffHandler.addStaff(newMember);
        
        String password = staffHandler.getPassword("username");
        assertEquals("Added and stored password do not match", password, "password");
    }
    
}
