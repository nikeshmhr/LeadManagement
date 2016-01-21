package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author sushant Dec 16, 2015
 */
public class Lead {

    private int id;
    private String name;
    private String phone;
    private String email;
    private Date dateOfBirth;
    private Date dateOfEntry;
    private Date nextFollowup;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNextFollowup() {
        return nextFollowup;
    }

    public void setNextFollowup(Date nextFollowup) {
        this.nextFollowup = nextFollowup;
    }

    public boolean addLead() throws ClassNotFoundException, SQLException {
        boolean addStatus = false;

        /**
         * Let's assign a counsellor to this lead dynamically *
         */
        //assignCounsellor();
        Connection c = Database.getConnection();

        PreparedStatement s = c.prepareStatement("INSERT INTO lead_info VALUES(null, ?, ?, "
                + "?, ?, SYSDATE(), ?, ?, ?, ?, ?, ?, ?, 0)");
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
        //System.out.println("BEFORE METHOD CALL");
        String counsellorId = getCounsellorId();
        //System.out.println("AFTER METHOD CALL");
        //System.out.println(counsellorId);
        s.setString(9, counsellorId);
        s.setBoolean(10, isGender());
        s.setDate(11, new java.sql.Date(getNextFollowup().getTime()));

        if (s.executeUpdate() > 0 && getCounselor().updateCounsellor() > 0) {
            addStatus = true;
        }

        return addStatus;
    }

    /**
     * Reads all the list of counsellor available in database and applies
     * algorithm to determine the appropriate councellor and assigns to the
     * lead.
     *
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
        while (rs.next()) {
            String id = rs.getString("id");
            int noOfCurrentLeads = rs.getInt("no_of_current_leads");
            int maxNoOfLeads = rs.getInt("max_no_of_leads");
            int facultyId = rs.getInt("faculty_id");

            Counsellor counsellor = new Counsellor(maxNoOfLeads, noOfCurrentLeads, facultyId, id);

            listOfCounsellors.add(counsellor);

            noOfCounsellor++;
        }

        while (getCounselor().getId().isEmpty() && (loopCount < (2 * noOfCounsellor))) {
            int randomNumber = (int) (Math.random() * noOfCounsellor);
            System.out.println("RAND 1 " + randomNumber);
            Counsellor counsellor = listOfCounsellors.get(randomNumber);
            if (counsellor.getMaxNoOfLeads() > counsellor.getCurrentNoOfLeads()) {
                setCounselor(counselor);
                counsellor.setCurrentNoOfLeads(counsellor.getCurrentNoOfLeads() + 1);
                counsellorId = counsellor.getId();
            }
            loopCount++;
        }

        if (getCounselor().getId().isEmpty()) {
            int randomNo = (int) (Math.random() * noOfCounsellor);
            System.out.println("RAND 2 " + randomNo);
            Counsellor coun = listOfCounsellors.get(randomNo);
            setCounselor(coun);
            counsellorId = coun.getId();
        }

        return counsellorId;
    }

    public Lead getDetailsUsingId() throws ClassNotFoundException, SQLException {
        Connection c = Database.getConnection();
        PreparedStatement s = c.prepareStatement("SELECT * FROM lead_info WHERE id=?");
        s.setInt(1, getId());

        ResultSet rs = s.executeQuery();
        while (rs.next()) {
            this.setEmail(rs.getString("email_id"));
            this.setFaculty(new Faculty(rs.getInt("faculty_id")));
            this.setStatus(new Status(rs.getInt("student_status_id")));
            this.setName(rs.getString("name"));
            this.setPhone(rs.getString("phone"));
            this.setFollowupCount(rs.getInt("followup_count"));
            this.setSemester(rs.getString("semester"));
            this.setGender(rs.getBoolean("gender"));
            this.setDateOfBirth(rs.getDate("date_of_birth"));
            this.setDateOfEntry(rs.getDate("date_of_entry"));
            this.setNextFollowup(rs.getDate("next_followup"));
            break;
        }

        s = c.prepareStatement("SELECT * FROM feedback WHERE lead_id=?");
        s.setInt(1, this.getId());

        rs = s.executeQuery();
        while (rs.next()) {
            Feedback f = new Feedback(rs.getInt("feedback_id"), rs.getString("feedback_text"));

            this.getListOfFeedbacks().add(f);
        }

        return this;
    }

    public boolean followUpNotDone() throws ClassNotFoundException, SQLException {
        boolean status = false;

        Connection c = Database.getConnection();
        PreparedStatement s = c.prepareStatement("UPDATE lead_info SET next_followup=? WHERE id=?");

        GregorianCalendar gCalendar = new GregorianCalendar();
        final int ONE_DAY = 1;
        gCalendar.add(Calendar.DAY_OF_MONTH, ONE_DAY);

        String newDate = gCalendar.get(Calendar.YEAR) + "-" + (gCalendar.get(Calendar.MONTH) + 1) + "-" + gCalendar.get(GregorianCalendar.DAY_OF_MONTH);

        s.setString(1, newDate);
        s.setInt(2, this.getId());

        if (s.executeUpdate() > 0) {
            status = true;
        }

        return status;
    }

    public int updateLeadFollowup() throws ClassNotFoundException, SQLException {
        int row = 0;

        Connection c = Database.getConnection();

        if (this.getFollowupCount() == 7) {
            setStatus(new Status(Status.EXPIRED));
        }

        /**
         * GENERATING NEXT FOLLOWUP DAY *
         */
        final int ONE_WEEK = 7;
        GregorianCalendar gCalendar = new GregorianCalendar();
        gCalendar.add(Calendar.DAY_OF_MONTH, ONE_WEEK);

        String nextFollowUp = gCalendar.get(Calendar.YEAR) + "-" + (gCalendar.get(Calendar.MONTH) + 1) + "-" + gCalendar.get(GregorianCalendar.DAY_OF_MONTH);

        PreparedStatement s = c.prepareStatement("UPDATE lead_info SET student_status_id=?, followup_count=?, next_followup=? WHERE id=?");
        s.setInt(1, this.getStatus().getStatusId());
        s.setInt(2, this.getFollowupCount() + 1);
        s.setString(3, nextFollowUp);
        s.setInt(4, id);

        System.out.println("NEXT DATE: " + nextFollowUp);

        row = s.executeUpdate();

        return row;
    }

    public int sendLeadForAdmission() throws ClassNotFoundException, SQLException {
        int row = 0;
        
        this.setStatus(new Status(Status.PENDING));

        Connection c = Database.getConnection();
        PreparedStatement st = c.prepareStatement("UPDATE lead_info SET student_status_id=? WHERE id=?");
        st.setInt(1, Status.PENDING);
        st.setInt(2, this.getId());

        row = st.executeUpdate();

        return row;
    }
}
