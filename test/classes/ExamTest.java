/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

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
public class ExamTest {
    
    public ExamTest() {
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
    
    /*
     * Tests for all get methods
     * 
     * Testing by setting variable value in constructor call and then 
     * checking whether get method fetches correct value
     */
    

    /**
     * Test of getModuleName method, of class Exam.
     */
    @Test
    public void testGetModuleName() {
        System.out.println("Testing getModuleName");
        Exam testExam = new Exam("","Agile","","","");
        String expResult = "Agile";
        String result = testExam.getModuleName();
        assertEquals("Method getModuleName failed.",expResult, result);
    }
    /**
     * Test of getModuleCode method, of class Exam.
     */
    @Test
    public void testGetModuleCode() {
        System.out.println("Testing getModuleCode");
        Exam testExam = new Exam("","","AC31007","","");
        String expResult = "AC31007";
        String result = testExam.getModuleCode();
        assertEquals("Method getModuleCode failed.", expResult, result);
    }
    /**
     * Test of getAcademicYear method, of class Exam.
     */
    @Test
    public void testGetAcademicYear() {
        System.out.println("Testing getAcademicYear");
        Exam testExam = new Exam("1819","","","","");
        String expResult = "1819";
        String result = testExam.getAcademicYear();
        assertEquals("Method getAcademicYear failed.",expResult, result);      
    }
    /**
     * Test of getExamType method, of class Exam.
     */
    @Test
    public void testGetExamType() {
        System.out.println("Testing getExamType");
        Exam testExam = new Exam("","","","M","");
        String expResult = "M";
        String result = testExam.getExamType();
        assertEquals("Method getExamType failed.",expResult, result);      
    }
    /**
     * Test of getModuleDegree method, of class Exam.
     */
    @Test
    public void testGetModuleDegree() {
        System.out.println("Testing getModuleDegree");
        Exam testExam = new Exam("","","","","UG");
        String expResult = "UG";
        String result = testExam.getModuleDegree();
        assertEquals("Method getModuleDegree failed.",expResult, result);      
    }
    
    
    
    /**
     * Tests for set methods
     * 
     * Testing by setting variable to a certain value, 
     * then using get method to fetch value and see if it's the same
     */
    
    
    /**
     * Test of setAcademicYear method, of class Exam.
     */
    @Test
    public void testSetAcademicYear() {
        System.out.println("Testing setAcademicYear");
        //create empty exam object, then call set method to set to expected value
        String expResult = "1819";
        Exam testExam = new Exam("","","","","");
        testExam.setAcademicYear("1819");
        String result = testExam.getAcademicYear();
        assertTrue("Method setAcademicYear failed", result.equals(expResult));      
    }
    
    /**
     * Test of setModuleCode method of class Exam
     */
    @Test
    public void testSetModuleCode() 
    {
        System.out.println("Testing setModuleCode");
        //create empty exam object, then call set method to set to expected value
        String expResult = "AC31007";
        Exam testExam = new Exam("","","","","");
        testExam.setModuleCode("AC31007");
        String result = testExam.getModuleCode();
        assertTrue("Method setmoduleCode failed", result.equals(expResult));
    }
    
    /**
     * Test of setModuleName method of class Exam
     */
    @Test
    public void testSetModuleName() 
    {
        System.out.println("Testing setModuleName");
        //create empty exam object, then call set method to set to expected value
        String expResult = "Agile Programming";
        Exam testExam = new Exam("","","","","");
        testExam.setModuleName("Agile Programming");
        //fetch set value and compare to expected value
        String result = testExam.getModuleName();
        assertTrue("Method setModuleName failed", result.equals(expResult));
    }
    
    /**
     * Test of setExamType method of class Exam
     */
    @Test
    public void testSetExamType() 
    {
        System.out.println("Testing setExamType");
        //create empty exam object, then call set method to set to expected value
        String expResult = "M";
        Exam testExam = new Exam("","","","","");
        testExam.setExamType("M");
        //fetch set value and compare to expected value
        String result = testExam.getExamType();
        assertTrue("Method setExamType failed", result.equals(expResult));
    }
    
    /**
     * Test of setModuleDegree method of class Exam
     */
    @Test
    public void testSetModuleDegree() 
    {
        System.out.println("Testing setModuleDegree");
        //create empty exam object, then call set method to set to expected value
        String expResult = "UG";
        Exam testExam = new Exam("","","","","");
        testExam.setModuleDegree("UG");
        //fetch set value and compare to expected value
        String result = testExam.getModuleDegree();
        assertTrue("Method setModuleDegree failed", result.equals(expResult));
    }
}
