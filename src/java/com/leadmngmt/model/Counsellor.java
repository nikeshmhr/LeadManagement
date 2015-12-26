package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * This class encapsulates the properties and characteristics
 * of counselor.
 * @author Nikesh
 */
public class Counsellor extends Staff {

    private int maxNoOfLeads;
    private int currentNoOfLeads;
    private Faculty faculty;
    
    public Counsellor(){
        this(0, 0, 0);
    }

    public Counsellor(int maxNoOfLeads, int currentNoOfLeads, int facultyId){
        super();
        this.maxNoOfLeads = maxNoOfLeads;
        this.currentNoOfLeads = currentNoOfLeads;
        this.faculty = new Faculty(facultyId);
        super.setRole(new Role(Role.COUNSELLOR));
    }

    public int getMaxNoOfLeads() {
        return maxNoOfLeads;
    }

    public void setMaxNoOfLeads(int maxNoOfLeads) {
        this.maxNoOfLeads = maxNoOfLeads;
    }

    public int getCurrentNoOfLeads() {
        return currentNoOfLeads;
    }

    public void setCurrentNoOfLeads(int currentNoOfLeads) {
        this.currentNoOfLeads = currentNoOfLeads;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }
    
    public int addCounsellor() throws ClassNotFoundException, SQLException{
        int rowsInserted = 0;
        
        Connection c = Database.getConnection();
        
        PreparedStatement statement = c.prepareStatement("INSERT INTO counsellor VALUES(?, ?, ?, ?)");
        statement.setString(1, getEmailId());
        statement.setInt(2, getCurrentNoOfLeads());
        statement.setInt(3, getMaxNoOfLeads());
        statement.setInt(4, getFaculty().getFacultyId());
        
        rowsInserted = statement.executeUpdate();
        
        return rowsInserted;
    }
    
    
}
