/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff;

import classes.DBConnect;

import java.sql.*;

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
        String expectedYear = "2018/2019";
        String expectedModName = "Agile Programming";
        String expectedModCode = "AC12345";
        String expectedType = "M";
        String expectedDegree = "UG";
        Admin testAdmin = new Admin("foo", "foo");
        
        // Create the exam
        testAdmin.createExam(expectedYear, expectedModName, expectedModCode, expectedType, expectedDegree);
        
        try {
            
            DBConnect dbConnect = new DBConnect();
            Connection connection = dbConnect.connect();
            
            String query = "SELECT * FROM Exams WHERE AcademicYear = '" + expectedYear + "' AND ModuleCode = '" + expectedModCode + "'";
            Statement statement = connection.createStatement();
            
            ResultSet resultSet = statement.executeQuery(query);
            
            int counter = 0;
            while(resultSet.next()) {
                String year = resultSet.getString("AcademicYear");
                String modName = resultSet.getString("ModuleName");
                String modCode = resultSet.getString("ModuleCode");
                String type = resultSet.getString("ExamType");
                String degree = resultSet.getString("ModuleDegree");
                
                // Check correct values were added to table
                assertEquals("AcademicYear is not added to Exams table correctly", year, expectedYear);
                assertEquals("ModuleName is not added to Exams table correctly", modName, expectedModName);
                assertEquals("ModuleCode is not added to Exams table correctly", modCode, expectedModCode);
                assertEquals("ExamType is not added to Exams table correctly", type, expectedType);
                assertEquals("ModuleDegree is not added to Exams table correctly", degree, expectedDegree);
                
                counter++;
            }
            
            // There should be exactly 1 entry for this exam.
            assertEquals("Too many or too few entries are added to Exams table", counter, 1);
            
            // Delete the test entry from the database
            String deleteQuery = "DELETE FROM Exams WHERE AcademicYear = ? AND ModuleCode = ?";
            PreparedStatement deleteStatement = connection.prepareStatement(deleteQuery);
            deleteStatement.setString(1, expectedYear);
            deleteStatement.setString(1, expectedYear);
            deleteStatement.setString(2, expectedModCode);
            deleteStatement.execute();
            connection.close();
        }
        catch (Exception e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
            
        }
        
    }
    
}
