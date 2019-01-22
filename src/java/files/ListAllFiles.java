/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package files;

import java.io.File;
import java.io.IOException;
import javax.servlet.jsp.JspWriter;

/**
 *
 * @author YHSSSS
 */
public class ListAllFiles {
    
    public ListAllFiles(){}
    
    public void listFilesAndFolders(String directoryName,JspWriter mout) throws IOException{
        File directory = new File(directoryName);
        //get all the files from a directory
        File[] fList = directory.listFiles();
        for (File file : fList){
            mout.print(file.getName());
            mout.print("<br>");
        }
    }
        public void listFiles(String directoryName,JspWriter mout) throws IOException{
        File directory = new File(directoryName);
        //get all the files from a directory
        
        File[] fList = directory.listFiles();
        for (File file : fList){
            if (file.isFile()){
                mout.print("tag");
                 mout.print(file.getName()); 
                 mout.print("<br>");
            }
        }
    }
         public void listFolders(String directoryName,JspWriter mout) throws IOException{
        File directory = new File(directoryName);
        //get all the files from a directory
        File[] fList = directory.listFiles();
        for (File file : fList){
            if (file.isDirectory()){
                 mout.print(file.getName());
                 mout.print("<br>");
            }
        }
    }
        public void listFilesAndFilesSubDirectories(String directoryName,JspWriter mout) throws IOException{
        File directory = new File(directoryName);
        //get all the files from a directory
        File[] fList = directory.listFiles();
        for (File file : fList){
            if (file.isFile()){
                mout.print(file.getName());
                mout.print("<br>");
            } else if (file.isDirectory()){
                listFilesAndFilesSubDirectories(file.getAbsolutePath(),mout);
            }
        }
    }
}
