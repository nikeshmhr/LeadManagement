package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * This class holds the login info of the user and provides the functionality to
 * validate the user credentials.
 *
 * @author Nikesh
 */
public class LoginInfo extends Staff {

    private String username;
    private String password;
    private String id;

    /**
     * Constructor with 2 args.
     *
     * @param username The username of the user.
     * @param password The password of the user.
     */
    public LoginInfo(String username, String password) {
        super();
        this.username = username;
        this.password = password;
    }    

    public LoginInfo() {
        this("", "");
    }

    /**
     * Accessor method to access the username of user.
     *
     * @return
     */
    public String getUsername() {
        return username;
    }

    /**
     * Mutator method to set the username of user.
     *
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Accessor method to access the password of the user.
     *
     * @return
     */
    public String getPassword() {
        return password;
    }

    /**
     * Mutator method to set the password of the user.
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId(){
        return this.id;
    }
    

    /**
     * Method that validates the username and password against database.
     *
     * @return The validity status either true if user exists or false if user
     * does not exists.
     * @throws ClassNotFoundException The root cause is in
     * com.leadmngmt.util.Database file.
     * @throws SQLException The root cause is in com.leadmngmt.util.Database
     * file.
     */
    public boolean isValid() throws ClassNotFoundException, SQLException {
        boolean valid = false;

        Connection c = Database.getConnection();

        PreparedStatement statement = c.prepareStatement("SELECT * FROM login_info WHERE email_id=? AND password=MD5(?)");
        statement.setString(1, getUsername());
        statement.setString(2, getPassword());

        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            setId(resultSet.getString("id"));
            System.out.println("ID WHILE SETTING:" + resultSet.getString("id"));
            String mailId = resultSet.getString("email_id");
            super.setEmailId(mailId);

            int roleId = resultSet.getInt("role");
            Role r = new Role(roleId);
            super.setRole(r);

            valid = true;

            break;
        }
        return valid;
    }
    
    /**
     * This method helps to create a new user with the information available to this class.
     * @return The boolean value true to indicated created and false to indicated not created.
     * @throws ClassNotFoundException Please refer to the Database class.
     * @throws SQLException Error due to mistake in sql query.
     */
    public boolean createUser() throws ClassNotFoundException, SQLException{
        boolean isCreated = false;
        
        Connection c = Database.getConnection();
        
        PreparedStatement statement = c.prepareStatement("INSERT INTO login_info VALUES(?, MD5(?), ?, ?)");
        statement.setString(1, getId());
        statement.setString(2, getPassword());
        statement.setInt(3, getRole().getRoleId());
        statement.setString(4, getEmailId());
        
        if(statement.executeUpdate() > 0){
            isCreated = true;
        }
        
        return isCreated;
    }

}
