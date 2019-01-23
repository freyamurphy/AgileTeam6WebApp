/*
 * A class to store all the users of the system.
 * Maybe this should be done a different way or called something else.
 */
package staff;

/**
 *
 * @author freyamurphy
 */
import java.util.HashMap;

public class StaffHandler {
    private HashMap<String, Admin> adminList;
    private HashMap<String, InternalModerator> iMList;
    private HashMap<String, ExamSetter> eSList;
    
    public StaffHandler() {
        adminList = new HashMap<String, Admin>();
        iMList = new HashMap<String, InternalModerator>();
        eSList = new HashMap<String, ExamSetter>();
        
        addExampleStaff();
    }
    
    public void addExampleStaff() {
        Admin craig = new Admin("Craig", "craig");
        InternalModerator bob = new InternalModerator("Bob", "123");
        InternalModerator guy = new InternalModerator("Guy", "abc");
        ExamSetter lily = new ExamSetter("Lily", "asdf");
        ExamSetter bob2 = new ExamSetter("Bob", "123456");
        Boolean bla = addAdmin(craig);
        Boolean bla2 = addInternalModerator(bob);
        Boolean bla3 = addInternalModerator(guy);
        Boolean bla4 = addExamSetter(lily);
        Boolean bla5 = addExamSetter(bob2);
    }
    
    public boolean addAdmin(Admin newMember) {
        String username = newMember.getUsername();
        
        // Username is unique
        if (getAdmin(username) == null) {
            adminList.put(username, newMember);
            return true;
        }
        
        // This is a bad implementation because if the username is already taken
        // no feedback is sent to the user to tell them the new admin has not been added.
        // I tried to throw an exception if the username was taken but Java didn't like it
        // because the exception wasn't caught anywhere.
        return false;
        
    }
    
    public boolean addInternalModerator(InternalModerator newMember) {
        String username = newMember.getUsername();
        
        // Username is unique
        if (getIM(username) == null) {
            iMList.put(username, newMember);
            return true;
        }
        
        // This is a bad implementation because if the username is already taken
        // no feedback is sent to the user to tell them the new IM has not been added.
        // I tried to throw an exception if the username was taken but Java didn't like it
        // because the exception wasn't caught anywhere.]
        return false;
    }
    
    public boolean addExamSetter(ExamSetter newMember) {
        String username = newMember.getUsername();
        
        // Username is unique
        if (getES(username) == null) {
            eSList.put(username, newMember);
            return true;
        }
        
        // This is a bad implementation because if the username is already taken
        // no feedback is sent to the user to tell them the new ES has not been added.
        // I tried to throw an exception if the username was taken but Java didn't like it
        // because the exception wasn't caught anywhere.
        return false;
    }
    
    public Admin getAdmin(String username) {
        Admin foundAdmin = adminList.get(username);
        if (foundAdmin == null) {
            return null;
        }
        return foundAdmin;
    }
    
    public InternalModerator getIM(String username) {
        InternalModerator foundIM = iMList.get(username);
        if (foundIM == null) {
            return null;
        }
        return foundIM;
    }
    
    public ExamSetter getES(String username) {
        ExamSetter foundES = eSList.get(username);
        if (foundES == null) {
            return null;
        }
        return foundES;
    }
    
    public String getAdminPassword(String username) {
        Admin foundMember = adminList.get(username);
        if (foundMember == null) {
            return null;
        }
        return foundMember.getPassword();
    }
    
    public String getIMPassword(String username) {
        InternalModerator foundMember = iMList.get(username);
        if (foundMember == null) {
            return null;
        }
        return foundMember.getPassword();
    }
    
    public String getESPassword(String username) {
        ExamSetter foundMember = eSList.get(username);
        if (foundMember == null) {
            return null;
        }
        return foundMember.getPassword();
    }
}
