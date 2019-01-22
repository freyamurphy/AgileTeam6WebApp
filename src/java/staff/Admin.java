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
 
    public Admin() 
    { 
        //Currently creates default staff member with these login details
        super("username", "password"); 
    }
    
    //method to create an exam
    public void createExam(String year, String modName, String modCode, String type, String degree)
    {
        //will need to add other attributes later, like exam types, staff names, etc etc
        Exam exam = new Exam(year, modName, modCode, type, degree);
        System.out.print("Created Exam");
        
        //functionality to store newly created exams
        ExamStorage examStore = new ExamStorage();
        examStore.addExamToList(exam);
    }
    
}
