package com.leadmngmt.controller;

import com.leadmngmt.model.Counsellor;
import com.leadmngmt.model.Lead;
import com.leadmngmt.model.SessionInfo;
import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
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
            listOfLeads = (ArrayList<Lead>) counsellor.getListOfLeads();
            System.out.println("LEADS SHOULD BE DISPLAYED");
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Could not load leads due to internal driver error.");
        } catch (SQLException ex) {
            map.addAttribute("message", "Could not load leads due to internal error.");
        }
        map.addAttribute("leads", listOfLeads);
        
        return "/counsellor/leads_list";
    }

}
