package com.leadmngmt.controller;

import com.leadmngmt.model.Faculty;
import com.leadmngmt.model.Lead;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Nikesh
 */
@Controller
public class ReceptionistController {

    @RequestMapping(value = "receptionist/add", method = RequestMethod.GET)
    public String loadDefaultPage() {
        return "receptionist/receptionist_single_lead_entry";
    }

    @RequestMapping(value = "receptionist/add/bulk", method = RequestMethod.GET)
    public String loadBulkAddPage() {
        return "receptionist/receptionist_bulk_lead_entry";
    }

    @RequestMapping(value = "receptionist/add/postData", method = RequestMethod.POST)
    public String extractDataFromForm(HttpServletRequest request, HttpServletResponse response, ModelMap map) {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email_id");
            String phone = request.getParameter("phone");

            String dateString = request.getParameter("date_of_birth");

            Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);

            int faculty = Integer.parseInt(request.getParameter("Faculty"));
            String semester = request.getParameter("semester");
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

            Lead lead = new Lead();
            lead.setName(name);
            lead.setEmail(email);
            lead.setPhone(phone);
            lead.setDateOfBirth(utilDate);
            lead.setFaculty(new Faculty(faculty));
            lead.setSemester(semester);
            lead.setGender(gender);

            boolean addStatus = lead.addLead();
            if (addStatus) {
                map.addAttribute("message", "Lead successfully added");
            } else {
                map.addAttribute("message", "Failed to add lead.");
            }

        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Failed to add lead due to internal driver problem.");
        } catch (SQLException ex) {
            map.addAttribute("message", "Failed to add lead due to internal error.");
        } catch (ParseException ex) {
            map.addAttribute("message", "Failed to add lead due to parse error.");
        }
        return "receptionist/receptionist_single_lead_entry";
    }

}
