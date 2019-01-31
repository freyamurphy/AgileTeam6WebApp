/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff;

import classes.Exam;
import classes.ExamStorage;
import classes.DBConnect;

import java.util.*;
import java.sql.*;

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
        
        //functionality to store newly created exams
        //currently not in use, since switch to external SQL database instead of Java data structure
        //ExamStorage examStore = new ExamStorage();
        //examStore.addExamToList(exam);
        
        try {
            DBConnect dbConnect = new DBConnect();
            Connection connection = dbConnect.connect();

            String query = "INSERT INTO Exams(AcademicYear, ModuleCode, ModuleName, ExamType, ModuleDegree) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, exam.getAcademicYear());
            preparedStatement.setString(2, exam.getModuleCode());
            preparedStatement.setString(3, exam.getModuleName());
            preparedStatement.setString(4, exam.getExamType());
            preparedStatement.setString(5, exam.getModuleDegree());

            preparedStatement.execute();

            connection.close();
        }
        catch (Exception e) {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }
        
        
    }
    
}
