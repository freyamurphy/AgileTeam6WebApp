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
    private boolean empty;
    private HashMap<String, Staff> staffList;
    
    public StaffHandler() {
        empty = true;
        staffList = new HashMap<String, Staff>();
        Staff staff1 = new Staff("Freya", "123");
        Staff staff2 = new Staff("Momoko", "abc");
        Staff staff3 = new Staff("Shanshan", "hello");
        addStaff(staff1);
        addStaff(staff2);
        addStaff(staff3);
    }
    
    public boolean isEmpty() {
        return empty;
    }
    
    public void addStaff(Staff newMember) {
        String username = newMember.getUsername();
        staffList.put(username, newMember);
    }
    
    public Staff getStaffMember(String username) {
        Staff foundMember = staffList.get(username);
        return foundMember;
    }
    
    public String getPassword(String username) {
        Staff foundMember = staffList.get(username);
        return foundMember.getPassword();
    }
}
