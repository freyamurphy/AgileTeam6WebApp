/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff;

import classes.Comment;
import classes.DBConnect;

import java.sql.*;

/**
 *
 * @author freyamurphy
 */
public class InternalModerator extends Staff implements Commenting{
    
    public InternalModerator(String username, String password) 
    { 
        super(username, password); 
    }
    
    public void addComment(String content) {
        Comment comment = new Comment(content, this.username, "InternalModerator");
        
        try {
            DBConnect dbConnect = new DBConnect();
            Connection connection = dbConnect.connect();
            
            String query = "INSERT INTO Comments(Content, TimeOfComment, ExamNo, Author) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, comment.getContent());
            preparedStatement.setString(2, comment.getTimePosted());
            //preparedStatement.setString(3, exam.get());
            //preparedStatement.setString(4, exam.getExamType());
            //preparedStatement.setString(5, exam.getModuleDegree());

            preparedStatement.execute();

            connection.close();
        }
        catch (Exception e) {
            
        }
    }
    
   
    
}
