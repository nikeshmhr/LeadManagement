package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author sushant Dec 16, 2015
 */
public class Lead {

    private String name;
    private String phone;
    private String email;
    private Date dateOfBirth;
    private Date dateOfEntry;
    private Faculty faculty;
    private Status status;
    private int followupCount;
    private String semester;
    private Counsellor counselor;
    private List<Feedback> listOfFeedbacks;
    private boolean gender;
    
    public Lead(){
        faculty = new Faculty();
        status = new Status();
        counselor = new Counsellor();
        listOfFeedbacks = new ArrayList<Feedback>();
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Date getDateOfEntry() {
        return dateOfEntry;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public Status getStatus() {
        return status;
    }    

    public int getFollowupCount() {
        return followupCount;
    }

    public void setFollowupCount(int followupCount) {
        this.followupCount = followupCount;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public Counsellor getCounselor() {
        return counselor;
    }

    public List<Feedback> getListOfFeedbacks() {
        return listOfFeedbacks;
    }

    public void setCounselor(Counsellor counselor) {
        this.counselor = counselor;
    }

    public void setListOfFeedbacks(List<Feedback> listOfFeedbacks) {
        this.listOfFeedbacks = listOfFeedbacks;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public boolean addLead() throws ClassNotFoundException, SQLException{
        boolean addStatus = false;
        
        /** Let's assign a counsellor to this lead dynamically **/
        //assignCounsellor();
        
        Connection c = Database.getConnection();
        
        PreparedStatement s = c.prepareStatement("INSERT INTO lead_info VALUES(null, ?, ?, "
                + "?, ?, SYSDATE(), ?, ?, ?, ?, ?, ?)");
        //PreparedStatement s = c.prepareStatement("INSERT INTO sample VALUES('nikesh', SYSDATE())");
        //s.setDate(1, new java.sql.Date(getDateOfBirth().getTime()));
        s.setString(1, getEmail());
        s.setString(2, getName());
        s.setString(3, getPhone());
        s.setDate(4, new java.sql.Date(getDateOfBirth().getTime()));
//        System.out.println("Time: " + (getDateOfBirth().getTime()));
//        s.setDate(4, new java.sql.Date(getDateOfBirth().getTime()));
        
        s.setInt(5, getFaculty().getFacultyId());
        s.setInt(6, getStatus().getStatusId());
        s.setInt(7, getFollowupCount());
        s.setString(8, getSemester());        
        s.setString(9, "ST103");  
        s.setBoolean(10, isGender());
        
        if(s.executeUpdate() > 0){
            addStatus = true;
        }
        
        return addStatus;
    }
    
}
