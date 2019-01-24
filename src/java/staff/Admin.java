/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff;

import classes.Exam;
import classes.ExamStorage;

import java.util.*;

/**
 *
 * @author freyamurphy
 */
public class Admin extends Staff {
 
    public Admin(String username, String password) 
    { 
        //Currently creates default staff member with these login details
        super(username, password); 
    }
    
    //method to create an exam 
    //currently not in use, since switch to external SQL database instead of Java data structure
    public void createExam(String year, String modName, String modCode, String type, String degree)
    {
        //create exam object with given parameters
        Exam exam = new Exam(year, modName, modCode, type, degree);
        System.out.print("Created Exam");
        
        //functionality to store newly created exams
        //currently not in use, since switch to external SQL database instead of Java data structure
        ExamStorage examStore = new ExamStorage();
        examStore.addExamToList(exam);
    }
    
}
