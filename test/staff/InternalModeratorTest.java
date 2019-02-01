/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staff;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

import classes.Comment;

/**
 *
 * @author freyamurphy
 */
public class InternalModeratorTest {
    
    public InternalModeratorTest() {
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

    @Test
    public void test_addComment() {
        String testUsername = "foo";
        InternalModerator user = new InternalModerator(testUsername, "foo");
        String content = "This is a comment.";
        
        //Comment newComment = user.addComment(content);
        
        //String commentContent = newComment.getContent();
        //String commentUsername = newComment.getAuthorUsername();
        //String commentRole = newComment.getAuthorRole();
        
        //assertEquals("Comment content does not match value passed to addComment()", commentContent, content);
        //assertEquals("Comment username does not match actual author username", commentUsername, testUsername);
        //assertEquals("Comment role does not match author's actual role", commentRole, "InternalModerator");
        
        
    }
    
}
