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
 * @author freyamurphy
 */
public class CommentTest {
    
    public CommentTest() {
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
    public void test_getContent() {
        String content = "This is a comment.";
        Comment comment = new Comment(content, "foo", "foo");
        
        String c = comment.getContent();
        
        assertEquals("getContent() does not return content passed to constructor", c, content);

    }
    
    @Test
    public void test_getAuthorUsername() {
        String username = "myUsername";
        Comment comment = new Comment("foo", username, "foo");
        
        String u = comment.getAuthorUsername();
        
        assertEquals("getAuthorUsername() does not return username passed to constructor", u, username);
    }
    
    @Test
    public void test_getAuthorRole() {
        String role = "InternalModerator";
        Comment comment = new Comment("foo", "foo", role);
        
        String r = comment.getAuthorRole();
        
        assertEquals("getAuthorRole() does not return username passed to constructor", r, role);
    }
    
}
