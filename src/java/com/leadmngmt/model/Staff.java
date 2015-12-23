package com.leadmngmt.model;

/**
 * This class holds the information of the user or staff.
 *
 * @author Nikesh
 */
public class Staff {

    private String name;
    private String emailId;
    private Role role;

    /**
     * Constructor with no arg.
     */
    public Staff() {
        this(null, 0);
    }

    /**
     * Constructor with one argument.
     * @param name The name of the staff.
     */
    public Staff(String name) {
        this(name, 0);
    }

    /**
     * Constructor with two args.
     * @param name The name of the staff.
     * @param role The role id of the staff.
     */
    public Staff(String name, int role) {
//        super(null, null, null, role);

        this.name = name;
        this.role = new Role(role);
    }

    /**
     * Accessor method to access the name of staff.
     * @return 
     */
    public String getName() {
        return name;
    }

    /**
     * Mutator method to set the name of the staff.
     * @param name 
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     * Accessor method to get the email address of user.
     *
     * @return The email address of user.
     */
    public String getEmailId() {
        return emailId;
    }

    /**
     * Mutator method to set the email address of user.
     *
     * @param emailId
     */
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    
    /**
     * Accessor method to access the role object of the user.
     *
     * @return
     */
    public Role getRole() {
        return role;
    }

    /**
     * Mutator method to set the role of the user.
     *
     * @param role
     */
    public void setRole(Role role) {
        this.role = role;
    }
    
}
