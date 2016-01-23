package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * This class holds the information of the user or staff.
 *
 * @author Nikesh
 */
public class Staff {

    private String name;
    private String id;
    private String emailId;
    private Role role;
    private boolean gender;
    private String facultyName; // just for use while displaying list of all users.

    /**
     * Constructor with no arg.
     */
    public Staff() {
        this(null, 0);
    }

    /**
     * Constructor with one argument.
     *
     * @param name The name of the staff.
     */
    public Staff(String name) {
        this(name, 0);
    }

    /**
     * Constructor with two args.
     *
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
     *
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     * Mutator method to set the name of the staff.
     *
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

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public int addStaff() throws ClassNotFoundException, SQLException {
        int rowsAdded = 0;

        Connection c = Database.getConnection();

        PreparedStatement statement = c.prepareStatement("INSERT INTO staff_info VALUES(?, ?, ?, ?)");
        statement.setString(1, getId());
        statement.setString(2, getName());
        statement.setBoolean(3, isGender());
        statement.setInt(4, getRole().getRoleId());

        rowsAdded = statement.executeUpdate();

        return rowsAdded;
    }
    
    public String getNameForId() throws SQLException, ClassNotFoundException {
        String name = "";

        Connection c = Database.getConnection();
        PreparedStatement s = c.prepareStatement("SELECT name FROM staff_info WHERE id=?");
        s.setString(1, getId());
        ResultSet rs = s.executeQuery();
        while (rs.next()) {
            name = rs.getString("name");
            setName(name);
            break;
        }

        return name;
    }

    public boolean changePassword(String pwd) throws ClassNotFoundException, SQLException {
        boolean flag = false;

        Connection c = Database.getConnection();

        PreparedStatement statement = c.prepareStatement("UPDATE login_info SET password=MD5(?) WHERE email_id=?");
        statement.setString(1, pwd);
        statement.setString(2, emailId);

        int row = statement.executeUpdate();
        if (row > 0) {
            flag = true;
        }

        return flag;
    }

}
