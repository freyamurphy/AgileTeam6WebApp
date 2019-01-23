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
    public void test_addAdmin() {
        String testUsername = "username";
        String testPassword = "password";
        Admin newAdmin = new Admin(testUsername, testPassword);
        StaffHandler staffHandler = new StaffHandler();
        staffHandler.addAdmin(newAdmin);
        
        Admin foundAdmin = staffHandler.getAdmin(testUsername);
        assertEquals("Added and stored Admin object do not match", newAdmin, foundAdmin);
        
        // Usernames must be unique.
        Admin secondAdmin = new Admin(testUsername, testPassword);
        boolean accepted = staffHandler.addAdmin(secondAdmin);
        assertFalse("Should not be able to add non-unique Admin usernames", accepted);
    }
    
    @Test
    public void test_addInternalModerator() {
        String testUsername = "username";
        String testPassword = "password";
        InternalModerator newIM = new InternalModerator(testUsername, testPassword);
        StaffHandler staffHandler = new StaffHandler();
        staffHandler.addInternalModerator(newIM);
        
        InternalModerator foundIM = staffHandler.getIM(testUsername);
        assertEquals("Added and stored InternalModerator object do not match", newIM, foundIM);
        
        // Usernames must be unique.
        InternalModerator secondIM = new InternalModerator(testUsername, testPassword);
        boolean accepted = staffHandler.addInternalModerator(secondIM);
        assertFalse("Should not be able to add non-unique IM usernames", accepted);
    }
    
    @Test
    public void test_addExamSetter() {
        String testUsername = "username";
        String testPassword = "password";
        ExamSetter newES = new ExamSetter(testUsername, testPassword);
        StaffHandler staffHandler = new StaffHandler();
        staffHandler.addExamSetter(newES);
        
        ExamSetter foundExamSetter = staffHandler.getES(testUsername);
        assertEquals("Added and stored ExamSetter object do not match", newES, foundExamSetter);
        
        // Usernames must be unique.
        ExamSetter secondES = new ExamSetter(testUsername, testPassword);
        boolean accepted = staffHandler.addExamSetter(secondES);
        assertFalse("Should not be able to add non-unique ES usernames", accepted);
    }
    
    @Test
    public void test_getAdmin() {
        // That getAdmin() returns the correct object when it exists and the username is unique 
        // is already tested in test_addAdmin().
        
        // User does not exist
        StaffHandler staffHandler = new StaffHandler();
        Admin foundAdmin = staffHandler.getAdmin("foo");
        assertEquals("getAdmin does not return NULL for nonexistent username", foundAdmin, null);
    }
    
    @Test
    public void test_getIM() {
        // That getIM() returns the correct object when it exists and the username is unique 
        // is already tested in test_addInternalModerator().
        
        // User does not exist
        StaffHandler staffHandler = new StaffHandler();
        InternalModerator foundIM = staffHandler.getIM("foo");
        assertEquals("getIM does not return NULL for nonexistent username", foundIM, null);
    }
    
    @Test
    public void test_getES() {
        // That getES() returns the correct object when it exists and the username is unique 
        // is already tested in test_addExamSetter().
        
        // User does not exist
        StaffHandler staffHandler = new StaffHandler();
        ExamSetter foundES = staffHandler.getES("foo");
        assertEquals("getES does not return NULL for nonexistent username", foundES, null);
    }
    
    @Test
    public void test_getAdminPassword() {
        String testUsername = "Freya";
        String testPassword = "ILoveDigby";
        Admin newAdmin = new Admin(testUsername, testPassword);
        StaffHandler staffHandler = new StaffHandler();
        staffHandler.addAdmin(newAdmin);
        
        String password = staffHandler.getAdminPassword(testUsername);
        assertEquals("Added and stored password do not match for Admin", password, testPassword);
        
        // User does not exist
        StaffHandler emptyStaffHandler = new StaffHandler();
        String foundPassword = emptyStaffHandler.getAdminPassword("foo");
        assertEquals("getAdminPassword does not return NULL for nonexistent username", foundPassword, null);
    }
    
    @Test
    public void test_getIMPassword() {
        String testUsername = "Momoko";
        String testPassword = "ILoveGermany";
        InternalModerator newIM = new InternalModerator(testUsername, testPassword);
        StaffHandler staffHandler = new StaffHandler();
        staffHandler.addInternalModerator(newIM);
        
        String password = staffHandler.getIMPassword(testUsername);
        assertEquals("Added and stored password do not match for InternalModerator", password, testPassword);
        
        // User does not exist
        StaffHandler emptyStaffHandler = new StaffHandler();
        String foundPassword = emptyStaffHandler.getIMPassword("foo");
        assertEquals("getIMPassword does not return NULL for nonexistent username", foundPassword, null);
    }
    
    @Test
    public void test_getESPassword() {
        String testUsername = "Cerys";
        String testPassword = "ILoveQ";
        ExamSetter newES = new ExamSetter(testUsername, testPassword);
        StaffHandler staffHandler = new StaffHandler();
        staffHandler.addExamSetter(newES);
        
        String password = staffHandler.getESPassword(testUsername);
        assertEquals("Added and stored password do not match for ExamSetter", password, testPassword);
        
        // User does not exist
        StaffHandler emptyStaffHandler = new StaffHandler();
        String foundPassword = emptyStaffHandler.getESPassword("foo");
        assertEquals("getESPassword does not return NULL for nonexistent username", foundPassword, null);
    }
    
}
