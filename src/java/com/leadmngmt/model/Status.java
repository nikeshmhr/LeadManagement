package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nikesh
 */
public class Status {

    private int statusId;
    private String statusName;

    public static final int INTERESTED = 1;
    public static final int DISMISSED = 2;
    public static final int POSTPOND = 3;
    public static final int EXPIRED = 4;
    public static final int PENDING = 5;
    public static final int ADMITTED = 6;

    public Status() {
        this(1);
    }

    public Status(int id) {
        this.statusId = id;

        setStatusName(id);
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public final void setStatusName(int id) {
        switch (id) {
            case INTERESTED:
                setStatusName("Interested");
                break;

            case DISMISSED:
                setStatusName("Dismissed");
                break;

            case POSTPOND:
                setStatusName("Postpond");
                break;

            case EXPIRED:
                setStatusName("Expired");
                break;

            case PENDING:
                setStatusName("Pending");
                break;

            case ADMITTED:
                setStatusName("Admitted");
                break;
        }
    }

    public List<Lead> getLeadsForThisStatus() throws ClassNotFoundException, SQLException {
        List<Lead> listOfLeads = new ArrayList<Lead>();

        Connection c = Database.getConnection();

        PreparedStatement s = c.prepareStatement("SELECT * FROM lead_info WHERE student_status_id=?");
        s.setInt(1, getStatusId());

        ResultSet rs = s.executeQuery();
        while (rs.next()) {
            Lead lead = new Lead();
            lead.setName(rs.getString("name"));
            lead.setEmail(rs.getString("email_id"));
            lead.setDateOfBirth(rs.getDate("date_of_birth"));
            lead.setDateOfEntry(rs.getDate("date_of_entry"));
            lead.setSemester(rs.getString("semester"));
            
            Counsellor coun = new Counsellor();
            coun.setId(rs.getString("counsellor_id"));
            coun.setName(coun.getNameForId());
            
            lead.setCounselor(coun);
            
            listOfLeads.add(lead);
        }
        
//        for(Lead l : listOfLeads){
//            Staff staff = l.getCounselor();
//            staff.setName(staff.getNameForId());
//        }

        return listOfLeads;
    }

}
