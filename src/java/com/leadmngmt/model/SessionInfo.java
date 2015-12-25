package com.leadmngmt.model;

/**
 *
 * @author Nikesh
 */
public class SessionInfo {

    private String userEmailId;
    private int userRoleId;

    public SessionInfo(){
        this.userEmailId = "";
        this.userRoleId = 0;
    }
    
    public SessionInfo(String email, int id) {
        this.userEmailId = email;
        this.userRoleId = id;
    }

    public String getUserEmailId() {
        return userEmailId;
    }

    public void setUserEmailId(String userEmailId) {
        this.userEmailId = userEmailId;
    }

    public int getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(int userRoleId) {
        this.userRoleId = userRoleId;
    }

}
