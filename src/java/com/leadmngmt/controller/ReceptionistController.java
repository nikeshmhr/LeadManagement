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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Nikesh
 */
@Controller
public class ReceptionistController {

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String loadDefaultPage() {
        return "receptionist/receptionist_single_lead_entry";
    }

    @RequestMapping(value = "/add/bulk", method = RequestMethod.GET)
    public String loadBulkAddPage() {
        return "receptionist/receptionist_bulk_lead_entry";
    }

    @RequestMapping(value = "/add/postData", method = RequestMethod.POST)
    public void extractDataFromForm(HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        try {
            response.setContentType("text/html");
            out = response.getWriter();

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

            out.println("test string");
            boolean addStatus = lead.addLead();
            out.print(addStatus + " STATUS");
            if (addStatus) {
                out.print("SUCCESSFULLY ADDED");
            } else {
                out.print("COULD NOT ADD");
            }

        } catch (IOException ex) {
            out.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            out.println(ex.getMessage());
        } catch (SQLException ex) {
            out.println(ex.getMessage());
        } catch (ParseException ex) {
            out.println(ex.getMessage());
        } finally {
            out.close();
        }

    }

}
