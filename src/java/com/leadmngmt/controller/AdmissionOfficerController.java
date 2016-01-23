package com.leadmngmt.controller;

import com.leadmngmt.model.Counsellor;
import com.leadmngmt.model.Faculty;
import com.leadmngmt.model.Lead;
import com.leadmngmt.model.Status;
import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Nikesh
 */
@Controller
public class AdmissionOfficerController {

    @RequestMapping(value = "/admission_officer/dashboard", method = RequestMethod.GET)
    public String showDashboard(ModelMap map) {
        return "/admission_officer/dashboard";
    }

    private void setListOfLeadsSentForConversion(ModelMap map) {

        try {
            List<Lead> listOfLeads = new ArrayList<Lead>();

            Connection c = Database.getConnection();
            PreparedStatement s = c.prepareStatement("SELECT * FROM lead_info WHERE student_status_id=?");
            s.setInt(1, Status.PENDING);

            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                Lead lead = new Lead();
                lead.setId(rs.getInt("id"));
                lead.setEmail(rs.getString("email_id"));
                lead.setName(rs.getString("name"));
                lead.setPhone(rs.getString("phone"));
                lead.setDateOfBirth(rs.getDate("date_of_birth"));
                lead.setDateOfEntry(rs.getDate("date_of_entry"));
                lead.setFaculty(new Faculty(rs.getInt("faculty_id")));
                lead.setStatus(new Status(rs.getInt("student_status_id")));
                lead.setFollowupCount(rs.getInt("followup_count"));
                Counsellor counsellor = new Counsellor();
                counsellor.setId(rs.getString("counsellor_id"));
                lead.setCounselor(counsellor);
                lead.setSemester(rs.getString("semester"));
                lead.setGender(rs.getBoolean("gender"));
                lead.setNextFollowup(rs.getDate("next_followup"));

                listOfLeads.add(lead);
            }
            map.addAttribute("leadsForAdmission", listOfLeads);
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Driver error.");
        } catch (SQLException ex) {
            map.addAttribute("message", "SQL Error.");
        }

    }

    @RequestMapping(value = "/admission_officer/leadsToAdmit", method = RequestMethod.GET)
    public String displayLeadsToAdmit(ModelMap map) {
        setListOfLeadsSentForConversion(map);
        return "/admission_officer/leads_to_admit";
    }

    @RequestMapping(value = "/admission_officer/admit", method = RequestMethod.POST)
    public String admitStudent(ModelMap map, HttpServletRequest req) {

        try {
            int leadId = Integer.parseInt(req.getParameter("leadId"));

            Lead lead = new Lead();
            lead.setId(leadId);
            lead.setStatus(new Status(Status.ADMITTED));

            int rows = lead.admitLead();
            if (rows > 0) {
                map.addAttribute("message", "Lead admitted successfully.");
            }
        } catch (SQLException ex) {
            map.addAttribute("message", "SQL Error.");
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Driver error.");

        }
        setListOfLeadsSentForConversion(map);

        return "/admission_officer/dashboard";
    }

    @RequestMapping(value = "/admission_officer/notification", method = RequestMethod.POST)
    public @ResponseBody
    String checkForNewLead() {
        String number = "0";
        try {

            Connection c = Database.getConnection();
            PreparedStatement s = c.prepareStatement("SELECT COUNT(*) AS count FROM lead_info WHERE student_status_id=?");
            s.setInt(1, Status.PENDING);
            ResultSet rs = s.executeQuery();
            while (rs.next()) {
                number = rs.getInt("count") + "";
                break;
            }
            System.out.println("SHOULD RETURN SOMETHING");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdmissionOfficerController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdmissionOfficerController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return number;
    }
}
