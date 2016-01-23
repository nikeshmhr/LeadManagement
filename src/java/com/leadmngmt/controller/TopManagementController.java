package com.leadmngmt.controller;

import com.leadmngmt.model.Counsellor;
import com.leadmngmt.model.Lead;
import com.leadmngmt.model.Status;
import com.leadmngmt.util.DataAccessObject;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Nikesh
 */
@Controller
public class TopManagementController {

    @RequestMapping(value = "/top_management/dashboard", method = RequestMethod.GET)
    public String showDashboard() {
        return "/top_management/dashboard";
    }

    @RequestMapping(value = "/top_management/reports/counsellor", method = RequestMethod.GET)
    public String showCounsellorReportPage(ModelMap map) {
        try {
            setCounsellors(map);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/top_management/counsellor_report";
    }

    @RequestMapping(value = "/top_management/reports/counsellor", method = RequestMethod.POST)
    public String generateCounsellorReport(ModelMap map, HttpServletRequest request) {
        List<Counsellor> counsellors = new ArrayList<Counsellor>();
        List<Lead> leads = null;

        Counsellor c = new Counsellor();
        c.setId(request.getParameter("counsellorId"));
        try {
            setCounsellors(map);

            leads = c.getListOfAllLeads();
            map.addAttribute("listOfLeads", leads);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/top_management/counsellor_report";
    }

    @RequestMapping(value = "/top_management/reports/status", method = RequestMethod.GET)
    public String showStatusReportPage(ModelMap map) {
        try {
            List<Status> listOfStatus = DataAccessObject.getListOfAllStatus();
            map.addAttribute("status", listOfStatus);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "/top_management/status_report";
    }

    @RequestMapping(value = "/top_management/reports/status", method = RequestMethod.POST)
    public String generateStatusReport(ModelMap map, HttpServletRequest req) {
        List<Lead> listOfLeads = null;
        try {
            List<Status> listOfStatus = DataAccessObject.getListOfAllStatus();
            map.addAttribute("status", listOfStatus);

            int statusId = Integer.parseInt(req.getParameter("statusId"));
            Status status = new Status();
            status.setStatusId(statusId);
            listOfLeads = status.getLeadsForThisStatus();

            map.addAttribute("listOfLeads", listOfLeads);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/top_management/status_report";
    }

    @RequestMapping(value = "/top_management/reports/activeLeads", method = RequestMethod.GET)
    public String showActiveLeadsReportPage(ModelMap map) {
        return "/top_management/active_report";
    }

    @RequestMapping(value = "/top_management/reports/activeLeads", method = RequestMethod.POST)
    public String generateActiveLeadsReport(ModelMap map, HttpServletRequest req) {

        try {
            String semester = req.getParameter("semester");

            List<Lead> leads = DataAccessObject.getLeadsForSemester(semester);

            map.addAttribute("listOfLeads", leads);

        } catch (SQLException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/top_management/active_report";
    }

    @RequestMapping(value = "/top_management/reports/customized", method = RequestMethod.GET)
    public String showCustomizeLeadReportPage(ModelMap map) {
        try {
            setCounsellors(map);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/top_management/customized_report";
    }

    @RequestMapping(value = "/top_management/reports/customized", method = RequestMethod.POST)
    public String generateCustomizedLeadReport(ModelMap map, HttpServletRequest request) {
        try {
            List<Lead> listOfLeads = new ArrayList<Lead>();

            setCounsellors(map);

            String semester = request.getParameter("semester");
            String counsellorId = request.getParameter("counsellorId");

            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");

            Date utilStartDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
            Date utilEndDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);

            listOfLeads = DataAccessObject.getLeadsForCustomReport(semester, new SimpleDateFormat("yyyy-MM-dd").format(utilStartDate), new SimpleDateFormat("yyyy-MM-dd").format(utilEndDate), counsellorId);

            map.addAttribute("listOfLeads", listOfLeads);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(TopManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/top_management/customized_report";
    }

    private void setCounsellors(ModelMap map) throws ClassNotFoundException, SQLException {
        List<Counsellor> counsellors = DataAccessObject.getListOfAllCounsellors();
        map.addAttribute("counsellors", counsellors);
    }
}
