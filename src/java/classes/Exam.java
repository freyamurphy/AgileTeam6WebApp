/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author freyamurphy
 */

//Exam class declaration
public class Exam 
{
    //Instance Variables 
    String academicYear; 
    String moduleCode; 
    String moduleName;
    String examType;  //main (M) or resit (R)
    String moduleDegree; //undergraduate (UG) or postgraduate (PG) exam
    //online vs paper

    //later should add exam setter object or smth
    
    // Constructor Declaration of Class 
    public Exam(String academicYear, String moduleName, String moduleCode, String examType, String moduleDegree) 
    { 
        this.moduleName = moduleName; 
        this.academicYear = academicYear; 
        this.moduleCode = moduleCode;
        this.examType = examType;
        this.moduleDegree = moduleDegree; 
    } 
  
    // get methods for exam class attributes 
    public String getModuleName() 
    { 
        return moduleName; 
    } 
    public String getModuleCode() 
    { 
        return moduleCode; 
    }     
    public String getAcademicYear()
    {
        return academicYear;
    }
    public String getExamType() 
    { 
        return examType; 
    }
    public String getModuleDegree() 
    { 
        return moduleDegree; 
    }
    
    //setter methods for exam attributes
    public void setAcademicYear(String year)
    {
        this.academicYear = year;
    }
    public void setModuleCode(String code)
    {
        this.moduleCode = code;
    }
    public void setModuleName(String name)
    {
        this.moduleName = name;
    }
    public void setExamType(String type)
    {
        this.examType = type;
    }
    public void setModuleDegree(String degree)
    {
        this.moduleDegree = degree;
    }
}