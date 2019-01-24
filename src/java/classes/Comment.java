/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Timestamp;

/**
 *
 * @author freyamurphy
 */
public class Comment {
    String content;
    String authorUsername;
    Timestamp timePosted;
    String authorRole;
    
    public Comment(String content, String authorUsername, String authorRole) {
        this.content = content;
        this.authorUsername = authorUsername;
        this.authorRole = authorRole;
        this.timePosted = new Timestamp(System.currentTimeMillis());
    }
    
    public String getContent() {
        return content;
    }
    
    public String getAuthorUsername() {
        return authorUsername;
    }
    
    public String getAuthorRole() {
        return authorRole;
    }
    
    public String getTimePosted() {
        return timePosted.toString();
    }
    
    
    
}
