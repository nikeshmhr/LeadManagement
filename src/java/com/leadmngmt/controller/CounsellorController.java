package com.leadmngmt.controller;

import com.leadmngmt.model.Counsellor;
import com.leadmngmt.model.Feedback;
import com.leadmngmt.model.Lead;
import com.leadmngmt.model.SessionInfo;
import com.leadmngmt.util.Database;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Nikesh
 */
@Controller
public class CounsellorController {

    @RequestMapping(value = "/counsellor/dashboard", method = {RequestMethod.GET})
    public String showDashboard(HttpServletRequest req, ModelMap map) {
        ArrayList<Lead> listOfLeads = null;
        try {
            SessionInfo info = new SessionInfo();
            info.redirectPage(req); // sets the user email, user role and returns the page to go but we dont need page so no need to store return value
            String id = info.getId();   // we only needed the id.

            /**
             * Retrieving all the data of leads that are assigned to this
             * particular counsellor *
             */
            Counsellor counsellor = new Counsellor();
            counsellor.setId(id);
            listOfLeads = (ArrayList<Lead>) counsellor.getListOfLeads();
            System.out.println("LEADS SHOULD BE DISPLAYED");
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Could not load leads due to internal driver error.");
        } catch (SQLException ex) {
            map.addAttribute("message", "Could not load leads due to internal error.");
        }
        map.addAttribute("leads", listOfLeads);
        return "/counsellor/dashboard";
    }

    @RequestMapping(value = "/counsellor/leads", method = RequestMethod.GET)
    public String showListOfLeads(HttpServletRequest req, ModelMap map) {
        ArrayList<Lead> listOfLeads = null;
        try {
            SessionInfo info = new SessionInfo();
            info.redirectPage(req); // sets the user email, user role and returns the page to go but we dont need page so no need to store return value
            String id = info.getId();   // we only needed the id.

            /**
             * Retrieving all the data of leads that are assigned to this
             * particular counsellor *
             */
            Counsellor counsellor = new Counsellor();
            counsellor.setId(id);
            listOfLeads = (ArrayList<Lead>) counsellor.getListOfNewLeads();
            counsellor.setNewLeadsToOld();
            System.out.println("LEADS SHOULD BE DISPLAYED");
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Could not load leads due to internal driver error.");
        } catch (SQLException ex) {
            map.addAttribute("message", "Could not load leads due to internal error.");
        }
        map.addAttribute("leads", listOfLeads);

        return "/counsellor/leads_list";
    }

    @RequestMapping(value = "/counsellor/lead/details", method = RequestMethod.GET)
    public String showDetailsOfLead(ModelMap map, HttpServletRequest req) {
        int id = Integer.parseInt(req.getParameter("id"));

        Lead l = new Lead();
        l.setId(id);
        try {
            l.getDetailsUsingId();
            map.addAttribute("lead", l);
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Could not load leads due to internal driver error.");
        } catch (SQLException ex) {
            map.addAttribute("message", "Could not load leads due to internal error.");
        }

        return "/counsellor/lead_details";
    }

    @RequestMapping(value = "/counsellor/lead/followupToday", method = RequestMethod.GET)
    public String displayLeadsToFollowUpToday(ModelMap map, HttpServletRequest req) {
        setLeadsForToday(map, req);
        return "/counsellor/lead_followup_today";
    }
    
    @RequestMapping(value="/counsellor/lead/followupDone", method=RequestMethod.POST)
    public String updateFollowupInfo(HttpServletRequest req, ModelMap map){
        try {
            int leadId = Integer.parseInt(req.getParameter("leadId"));
            String feedback = req.getParameter("feedback");
            int status = Integer.parseInt(req.getParameter("status"));
            
            int followupCount = Integer.parseInt(req.getParameter("followupCount"));
            
            /** CREATING NEW LEAD FROM AVAILABLE ATTRIBUTES **/
            Lead l = new Lead();
            l.setId(leadId);
            l.setFollowupCount(followupCount);
            Feedback f = new Feedback(req.getParameter("feedback"));
            
            int rows = f.addFeedback(leadId);
            if(rows > 0){
                rows = l.updateLeadFollowup();
                if(rows > 0){
                    map.addAttribute("message", "Lead updated.");
                }else{
                    map.addAttribute("message", "Sorry, could not update followup");
                }
            }else{
                map.addAttribute("message", "Sorry, could not update. (Error while adding feedback)");
            }
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Driver not found.");
        } catch (SQLException ex) {
            map.addAttribute("message", "SQL error. " + ex.getMessage());
        }
        setLeadsForToday(map, req);
        return "/counsellor/lead_followup_today";
    }

    @RequestMapping(value = "/counsellor/lead/followUpNotDone", method = RequestMethod.GET)
    public String followupNotDone(HttpServletRequest req, HttpServletResponse res, ModelMap map) throws IOException {
        try {
            int leadId = Integer.parseInt(req.getParameter("id"));
            Lead l = new Lead();
            l.setId(leadId);

            boolean status = l.followUpNotDone();
            if (status) {
                req.setAttribute("message", "Shifted nextday.");
            }
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Driver error.");
        } catch (SQLException ex) {
            map.addAttribute("message", "SQL error.");
        }
        setLeadsForToday(map, req);
        return "/counsellor/lead_followup_today";
        //res.sendRedirect("/LeadManagement/counsellor/lead/followupToday");
    }

    /**
     * Reads leads info from database whose followup date is equal to today and add that info to the list.
     * Finally adds the list to the ModelMap before sending it the view.
     * @param map List of leads are bundled here and are sent.
     * @param req The request object from the page.
     */
    private void setLeadsForToday(ModelMap map, HttpServletRequest req) {
        try {
            List<Lead> listOfLeads = new ArrayList<Lead>();

            SessionInfo info = new SessionInfo();
            info.redirectPage(req); // sets the user email, user role and returns the page to go but we dont need page so no need to store return value
            String id = info.getId();   // we only needed the id.

            /**
             * Retrieving all the data of leads that needs to be followed up
             * today
             */
            Counsellor counsellor = new Counsellor();
            counsellor.setId(id);
            listOfLeads = (ArrayList<Lead>) counsellor.getListToFollowupToday();

            map.addAttribute("leads", listOfLeads);

        } catch (SQLException ex) {
            map.addAttribute("message", "SQL ERROR.");
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Driver not found.");
        } catch (ParseException ex) {
            map.addAttribute("message", "Date parse error.");
        }
    }

}
