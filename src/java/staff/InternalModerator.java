/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff;

import classes.Comment;

/**
 *
 * @author freyamurphy
 */
public class InternalModerator extends Staff implements Commenting{
    
    public InternalModerator(String username, String password) 
    { 
        super(username, password); 
    }
    
    public Comment addComment(String content) {
        Comment comment = new Comment(content, this.username, "InternalModerator");
        return comment;
    }
    
}
