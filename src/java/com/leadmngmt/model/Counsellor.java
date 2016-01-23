package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        statement.setString(1, getId());
        statement.setInt(2, getCurrentNoOfLeads());
        statement.setInt(3, getMaxNoOfLeads());
        statement.setInt(4, getFaculty().getFacultyId());

        rowsInserted = statement.executeUpdate();

        return rowsInserted;
    }

    public int updateCounsellor() throws ClassNotFoundException, SQLException {
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

    public List<Lead> getListOfLeads() throws ClassNotFoundException, SQLException {
        List<Lead> listOfLead = new ArrayList<Lead>();

        Connection c = Database.getConnection();

        PreparedStatement st = c.prepareStatement("SELECT * FROM lead_info WHERE counsellor_id=? AND student_status_id=?");
        st.setString(1, getId());
        st.setInt(2, Status.INTERESTED);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
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
            int leadId = rs.getInt("id");
            Date followUp = rs.getDate("next_followup");

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
            lead.setId(leadId);
            lead.setNextFollowup(followUp);

            listOfLead.add(lead);
        }

        return listOfLead;
    }

    public List<Lead> getListOfAllLeads() throws ClassNotFoundException, SQLException{
        List<Lead> listOfLead = new ArrayList<Lead>();

        Connection c = Database.getConnection();

        PreparedStatement st = c.prepareStatement("SELECT * FROM lead_info WHERE counsellor_id=?");
        st.setString(1, getId());

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
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
            int leadId = rs.getInt("id");
            Date followUp = rs.getDate("next_followup");

            Lead lead = new Lead();

            lead.setCounselor(this);
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
            lead.setId(leadId);
            lead.setNextFollowup(followUp);

            listOfLead.add(lead);
        }

        return listOfLead;
    }
    
    public List<Lead> getListOfNewLeads() throws SQLException, ClassNotFoundException {
        List<Lead> leads = new ArrayList<Lead>();

        Connection c = Database.getConnection();

        PreparedStatement st = c.prepareStatement("SELECT * FROM lead_info WHERE counsellor_id=? AND is_old=? AND student_status_id=?");
        st.setString(1, getId());
        st.setBoolean(2, false);
        st.setInt(3, Status.INTERESTED);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
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
            int leadId = rs.getInt("id");

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
            lead.setId(leadId);

            leads.add(lead);
        }

        return leads;
    }

    public List<Lead> getListToFollowupToday() throws SQLException, ClassNotFoundException, ParseException {
        List<Lead> listOfLeads = new ArrayList<Lead>();

        Connection c = Database.getConnection();
        PreparedStatement s = c.prepareStatement("SELECT * FROM lead_info WHERE next_followup=? AND counsellor_id=? AND student_status_id=?");

        GregorianCalendar gCalendar = new GregorianCalendar();

        String dateString = gCalendar.get(Calendar.YEAR) + "-" + (gCalendar.get(Calendar.MONTH) + 1) + "-" + gCalendar.get(GregorianCalendar.DAY_OF_MONTH);
        System.out.println("DATE TO PARSSE: " + dateString);
        Date dateUtil = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);

        //s.setDate(1, (java.sql.Date)dateUtil);
        s.setString(1, dateString);
        s.setString(2, this.getId());
        s.setInt(3, Status.INTERESTED);
        ResultSet rs = s.executeQuery();

        while (rs.next()) {
            Lead l = new Lead();

            l.setId(rs.getInt("id"));
            l.setEmail(rs.getString("email_id"));
            l.setName(rs.getString("name"));
            l.setPhone(rs.getString("phone"));
            l.setDateOfBirth(rs.getDate("date_of_birth"));
            l.setDateOfEntry(rs.getDate("date_of_entry"));
            l.setFaculty(new Faculty(rs.getInt("faculty_id")));
            l.setStatus(new Status(rs.getInt("student_status_id")));
            l.setFollowupCount(rs.getInt("followup_count"));
            l.setCounselor(this);
            l.setSemester(rs.getString("semester"));
            l.setGender(rs.getBoolean("gender"));
            l.setNextFollowup(rs.getDate("next_followup"));

            listOfLeads.add(l);
        }
        System.out.println("LIST TO FOLLOW: " + listOfLeads);
        return listOfLeads;
    }

    public void setNewLeadsToOld() throws ClassNotFoundException, SQLException {
        Connection c = Database.getConnection();
        PreparedStatement statement = c.prepareStatement("UPDATE lead_info SET is_old=? WHERE is_old=? AND counsellor_id=?");
        statement.setBoolean(1, true);
        statement.setBoolean(2, false);
        statement.setString(3, this.getId());

        statement.executeUpdate();
    }

    public int getNoOfNewLeads() throws SQLException, ClassNotFoundException {
        int numberOfNewLeads = 0;
        final int NO = 0;

        Connection c = Database.getConnection();
        PreparedStatement statement = c.prepareStatement("SELECT COUNT(*) AS count FROM lead_info WHERE counsellor_id=? AND is_old=?");
        statement.setString(1, this.getId());
        statement.setInt(2, NO);

        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            numberOfNewLeads = rs.getInt("count");
            break;
        }

        return numberOfNewLeads;
    }

    public int getNoOfLeadsToFollowupToday() throws ClassNotFoundException, SQLException, ParseException {
        int numberOfLeadsToFollowup = 0;
        
        Connection c = Database.getConnection();
        PreparedStatement s = c.prepareStatement("SELECT COUNT(*) AS count FROM lead_info WHERE next_followup=? AND counsellor_id=? AND student_status_id=?");

        GregorianCalendar gCalendar = new GregorianCalendar();

        String dateString = gCalendar.get(Calendar.YEAR) + "-" + (gCalendar.get(Calendar.MONTH) + 1) + "-" + gCalendar.get(GregorianCalendar.DAY_OF_MONTH);
        System.out.println("DATE TO PARSSE: " + dateString);
        Date dateUtil = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);

        s.setString(1, dateString);
        s.setString(2, this.getId());
        s.setInt(3, Status.INTERESTED);
        ResultSet rs = s.executeQuery();
        while(rs.next()){
            numberOfLeadsToFollowup = rs.getInt("count");
            break;
        }
        
        return numberOfLeadsToFollowup;
    }

}
