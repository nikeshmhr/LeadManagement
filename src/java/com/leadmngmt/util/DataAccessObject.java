package com.leadmngmt.util;

import com.leadmngmt.model.Counsellor;
import com.leadmngmt.model.Faculty;
import com.leadmngmt.model.Lead;
import com.leadmngmt.model.Role;
import com.leadmngmt.model.Staff;
import com.leadmngmt.model.Status;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * All the activities involved in access multiple rows of data from database.
 *
 * @author Nikesh
 */
public class DataAccessObject {

    private static Connection connection;

    public static List<Staff> getExistingUsers() throws ClassNotFoundException, SQLException {
        List<Staff> listOfStaffs = new ArrayList<Staff>();

        connection = Database.getConnection();

        PreparedStatement statement = connection.prepareStatement("SELECT id, role, email_id FROM login_info");
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            Staff s = new Staff();
            s.setId(rs.getString("id"));
            s.setRole(new Role(rs.getInt("role")));
            s.setEmailId(rs.getString("email_id"));
            s.setFacultyName("N/A");
            listOfStaffs.add(s);

        }
        for (Staff s : listOfStaffs) {
            statement = connection.prepareStatement("SELECT name, gender FROM staff_info WHERE id=?");
            statement.setString(1, s.getId());

            rs = statement.executeQuery();
            while (rs.next()) {
                s.setGender(rs.getBoolean("gender"));
                s.setName(rs.getString("name"));
            }
        }

        /**
         * NOW SETTING FACULTY FOR ONLY COUNSELLORS *
         */
        for (Staff staff : listOfStaffs) {
            if (staff.getRole().getRoleId() == Role.COUNSELLOR) {
                statement = connection.prepareStatement("SELECT faculty_id FROM counsellor WHERE id=?");
                statement.setString(1, staff.getId());

                rs = statement.executeQuery();
                while (rs.next()) {
                    staff.setFacultyName(new Faculty(rs.getInt("faculty_id")).getFacultyName());
                    break;
                }
            }
        }
        System.out.println(listOfStaffs);
        return listOfStaffs;
    }

    public static List<Counsellor> getListOfAllCounsellors() throws ClassNotFoundException, SQLException {
        List<Counsellor> listOfCounsellors = new ArrayList<Counsellor>();

        connection = Database.getConnection();
        PreparedStatement stat = connection.prepareStatement("SELECT * FROM staff_info WHERE role_id=?");
        stat.setInt(1, Role.COUNSELLOR);

        ResultSet rs = stat.executeQuery();
        while (rs.next()) {
            Counsellor c = new Counsellor();
            c.setId(rs.getString("id"));
            c.setName(rs.getString("name"));

            listOfCounsellors.add(c);
        }

        return listOfCounsellors;
    }

    public static List<Status> getListOfAllStatus() throws ClassNotFoundException, SQLException {
        List<Status> listOfStatus = new ArrayList<Status>();

        connection = Database.getConnection();
        PreparedStatement st = connection.prepareStatement("SELECT * FROM student_status");
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Status s = new Status(rs.getInt("student_status_id"));
            listOfStatus.add(s);
        }

        return listOfStatus;
    }

    public static List<Lead> getLeadsForSemester(String semester) throws SQLException, ClassNotFoundException {
        List<Lead> listOfLeads = new ArrayList<Lead>();

        connection = Database.getConnection();
        PreparedStatement st = connection.prepareStatement("SELECT * FROM lead_info WHERE semester=?");
        st.setString(1, semester);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Lead l = new Lead();

            l.setId(rs.getInt("id"));
            l.setEmail(rs.getString("email_id"));
            l.setName(rs.getString("name"));
            l.setPhone(rs.getString("phone"));
            l.setDateOfBirth(rs.getDate("date_of_birth"));
            l.setDateOfEntry(rs.getDate("date_of_entry"));
            l.setStatus(new Status(rs.getInt("student_status_id")));
            l.setFaculty(new Faculty(rs.getInt("faculty_id")));

            listOfLeads.add(l);
        }

        return listOfLeads;
    }

    public static List<Lead> getLeadsForCustomReport(String semester, String startDate, String endDate, String counsellorId) throws SQLException, ClassNotFoundException {
        List<Lead> listOfLeads = new ArrayList<Lead>();

        connection = Database.getConnection();
        PreparedStatement st = connection.prepareCall("SELECT * FROM lead_info WHERE semester=? AND counsellor_id=? AND date_of_entry BETWEEN ? AND ?");
        st.setString(1, semester);
        st.setString(2, counsellorId);
        st.setString(3, startDate);
        st.setString(4, endDate);

        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Lead l = new Lead();

            l.setId(rs.getInt("id"));
            l.setEmail(rs.getString("email_id"));
            l.setName(rs.getString("name"));
            l.setPhone(rs.getString("phone"));
            l.setDateOfBirth(rs.getDate("date_of_birth"));
            l.setDateOfEntry(rs.getDate("date_of_entry"));
            l.setStatus(new Status(rs.getInt("student_status_id")));
            l.setFaculty(new Faculty(rs.getInt("faculty_id")));
            Counsellor coun = new Counsellor();
            coun.setId(rs.getString("counsellor_id"));
            coun.setName(coun.getNameForId());
            
            l.setCounselor(coun);

            listOfLeads.add(l);
        }

        
        return listOfLeads;
    }
}
