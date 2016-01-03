package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public Lead() {
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

    public void setDateOfEntry(Date dateOfEntry) {
        this.dateOfEntry = dateOfEntry;
    }
    

    public boolean addLead() throws ClassNotFoundException, SQLException {
        boolean addStatus = false;

        /**
         * Let's assign a counsellor to this lead dynamically *
         */
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
        System.out.println("BEFORE METHOD CALL");
        String counsellorId = getCounsellorId();
        System.out.println("AFTER METHOD CALL");
        System.out.println(counsellorId);
        s.setString(9, counsellorId);
        s.setBoolean(10, isGender());

        if (s.executeUpdate() > 0 && getCounselor().updateCounsellor() > 0) {
            addStatus = true;
        }

        return addStatus;
    }

    /**
     * Reads all the list of counsellor available in database and applies algorithm to determine the appropriate councellor and assigns to the lead.
     * @return The selected counsellor's ID.
     * @throws ClassNotFoundException
     * @throws SQLException 
     */
    private String getCounsellorId() throws ClassNotFoundException, SQLException {
        String counsellorId = null;
        int loopCount = 0;
        
        List<Counsellor> listOfCounsellors = new ArrayList<Counsellor>();
        
        int noOfCounsellor = 0;
        
        Connection c = Database.getConnection();
        PreparedStatement statement = c.prepareStatement("SELECT * FROM counsellor");
        ResultSet rs = statement.executeQuery();
        while(rs.next()){
            String id = rs.getString("id");
            int noOfCurrentLeads = rs.getInt("no_of_current_leads");
            int maxNoOfLeads = rs.getInt("max_no_of_leads");
            int facultyId = rs.getInt("faculty_id");
            
            Counsellor counsellor = new Counsellor(maxNoOfLeads, noOfCurrentLeads, facultyId, id);
            
            listOfCounsellors.add(counsellor);
            
            noOfCounsellor++;
        }
        
        while(getCounselor().getId().isEmpty() && (loopCount < (2 * noOfCounsellor))){
            int randomNumber = (int)(Math.random() * noOfCounsellor);
            System.out.println("RAND 1 " + randomNumber);
            Counsellor counsellor = listOfCounsellors.get(randomNumber);
            if(counsellor.getMaxNoOfLeads() > counsellor.getCurrentNoOfLeads()){
                setCounselor(counselor);
                counsellor.setCurrentNoOfLeads(counsellor.getCurrentNoOfLeads() + 1);
                counsellorId = counsellor.getId();
            }
            loopCount++;
        }
        
        if(getCounselor().getId().isEmpty()){
            int randomNo = (int) (Math.random() * noOfCounsellor);
            System.out.println("RAND 2 " + randomNo);
            Counsellor coun = listOfCounsellors.get(randomNo);
            setCounselor(coun);
            counsellorId = coun.getId();
        }
        
        return counsellorId;
    }
}
