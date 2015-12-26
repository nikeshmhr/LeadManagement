package com.leadmngmt.model;

/**
 *
 * @author Nikesh
 */
public class Role {

    private int roleId;
    private String roleName;
    
    // Constant ids of different roles.
    public static final int ADMIN = 1, COUNSELLOR = 2, RECEPTIONIST = 3, ADMISSION_OFFICER = 4, TOP_MANAGEMENT = 5;

    /**
     * Constructor with one argument.
     * @param roleId The role id of the staff.
     */
    public Role(int roleId) {
        this.roleId = roleId;
        setRoleName(roleId);
    }

    /**
     * Accessor method to access role id.
     * @return The role id of the user.
     */
    public int getRoleId() {
        return roleId;
    }

    /**
     * Mutator method to set role id.
     * @param roleId The role id of the user.
     */
    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    /**
     * Accessor method to access the role of the user.
     * @return The role of a user in textual form.
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * Mutator method to set the role name of the user.
     * @param roleName The role name of user.
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
    /**
     * Mutator method to set the role name of the user.
     * @param id The role id of the user.
     */
    public void setRoleName(int id){
        switch(id){
            case Role.ADMIN:
                this.roleName = "Admin";
                break;
                
            case Role.ADMISSION_OFFICER:
                this.roleName = "Admission Officer";
                break;
                
            case Role.COUNSELLOR:
                this.roleName = "Counsellor";
                break;
                
            case Role.TOP_MANAGEMENT:
                this.roleName ="Top Management";
                break;
                
            case Role.RECEPTIONIST:
                this.roleName = "Receptionist";
                break;
        }
    }

}
