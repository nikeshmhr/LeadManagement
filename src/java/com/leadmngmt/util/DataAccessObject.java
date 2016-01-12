package com.leadmngmt.util;

import com.leadmngmt.model.Faculty;
import com.leadmngmt.model.Role;
import com.leadmngmt.model.Staff;
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

}
