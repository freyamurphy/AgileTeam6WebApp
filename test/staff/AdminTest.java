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
 * @author Momoko Werner
 */
public class AdminTest {
    
    public AdminTest() {
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
     * Test of createExam method, of class Admin.
     */
    @Test
    public void testCreateExam() {
        System.out.println("Testing createExam");
        String year = "1718";
        String modName = "Agile Programming";
        String modCode = "AC31007";
        String type = "M";
        String degree = "UG";
        Admin testAdmin = new Admin();
        testAdmin.createExam(year, modName, modCode, type, degree);
        
        //Still missing testing attributes
    }
    
}
