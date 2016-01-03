package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * This class encapsulates the properties and characteristics of counselor.
 *
 * @author Nikesh
 */
public class Counsellor extends Staff {

    private int maxNoOfLeads;
    private int currentNoOfLeads;
    private Faculty faculty;
    private String id;

    public Counsellor() {
        this(0, 0, 0, "");
    }

    public Counsellor(int maxNoOfLeads, int currentNoOfLeads, int facultyId, String id) {
        super();
        this.maxNoOfLeads = maxNoOfLeads;
        this.currentNoOfLeads = currentNoOfLeads;
        this.faculty = new Faculty(facultyId);
        super.setRole(new Role(Role.COUNSELLOR));
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public void setFaculty(int facultyId) {
        this.faculty = new Faculty(facultyId);
    }

    public int addCounsellor() throws ClassNotFoundException, SQLException {
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
    
    public int updateCounsellor() throws ClassNotFoundException, SQLException{
        int rowsUpdated = 0;
        
        Connection connection = Database.getConnection();
        
        PreparedStatement s = connection.prepareStatement("UPDATE counsellor SET no_of_current_leads=?, max_no_of_leads=?, faculty_id=? WHERE id=?");
        s.setInt(1, getCurrentNoOfLeads());
        s.setInt(2, getMaxNoOfLeads());
        s.setInt(3, getFaculty().getFacultyId());
        s.setString(4, getId());
        
        rowsUpdated = s.executeUpdate();
        
        return rowsUpdated;
    }
    
    public List<Lead> getListOfLeads() throws ClassNotFoundException, SQLException{
        List<Lead> listOfLead = new ArrayList<Lead>();
        
        Connection c = Database.getConnection();
        
        PreparedStatement st = c.prepareStatement("SELECT * FROM lead_info WHERE counsellor_id=?");
        st.setString(1, getId());
        
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            String email = rs.getString("email_id");
            String name = rs.getString("name");
            String phone = rs.getString("phone");
            Date dob = rs.getDate("date_of_birth");
            Date doe = rs.getDate("date_of_entry");
            //String doe = rs.getString("date_of_entry");
            int facultyId = rs.getInt("faculty_id");
            int studentStatusId = rs.getInt("student_status_id");
            int followupCount = rs.getInt("followup_count");
            String semester = rs.getString("semester");
            String counsellorId = rs.getString("counsellor_id");
            boolean gender = rs.getBoolean("gender");
            
            
            Counsellor counsellor = new Counsellor();
            counsellor.setId(id);
            
            Lead lead = new Lead();
            
            lead.setCounselor(counsellor);
            lead.setDateOfBirth(dob);
            lead.setEmail(email);
            lead.setFaculty(new Faculty(facultyId));
            lead.setFollowupCount(followupCount);
            lead.setGender(gender);
            lead.setName(name);
            lead.setPhone(phone);
            lead.setSemester(semester);
            lead.setStatus(new Status(studentStatusId));
            lead.setDateOfEntry(doe);
            
            listOfLead.add(lead);
        }
        
        return listOfLead;
    }

}
