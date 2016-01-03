package com.leadmngmt.controller;

import com.leadmngmt.model.LoginInfo;
import com.leadmngmt.model.Role;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * This class the login.
 *
 * @author Nikesh
 */
@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showForm() {
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String controlForm(HttpServletRequest req, HttpServletResponse res, ModelMap map) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        LoginInfo login = new LoginInfo(username, password);
        try {
            boolean status = login.isValid();

            if (status) {
                /**
                 * Creating session for this user.
                 */
                HttpSession session = req.getSession();
                session.setAttribute("userId", login.getEmailId());
                session.setAttribute("userRole", login.getRole().getRoleId());
                session.setAttribute("id", login.getId());
                
                session.setMaxInactiveInterval(30 * 60);  // session valid only for 30 minutes

                if (login.getRole().getRoleId() == Role.ADMIN) {
                    res.sendRedirect("/LeadManagement/administrator/addUser");  // this url will be mapped by spring and should match the controller url
                    //return "/administrator/admin_add_user";
                } else if (login.getRole().getRoleId() == Role.RECEPTIONIST) {
                    res.sendRedirect("/LeadManagement/receptionist/add");
                    //return "/receptionist/receptionist_single_lead_entry";
                } else if (login.getRole().getRoleId() == Role.COUNSELLOR) {
                    //return "/counsellor/dashboard";
                    res.sendRedirect("/LeadManagement/counsellor/dashboard");
                } else if (login.getRole().getRoleId() == Role.ADMISSION_OFFICER) {
                    //return "/admission_officer/dashboard";
                    res.sendRedirect("/LeadManagement/admisssion_officer/dashboard");
                } else {
                    //return "/top_management/dashboard";
                    res.sendRedirect("/LeadManagement/top_management/dashboard");
                }
            } else {
                map.addAttribute("errorMessage", "Incorrect username or password.");
                return "index";
            }
        } catch (ClassNotFoundException ex) {
            map.addAttribute("errorMessage", "Login Failed due to internal error.");
            return "index";
        } catch (SQLException ex) {
            map.addAttribute("errorMessage", "Login Failed: " + ex.getMessage());
            return "index";
        }
        return null;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String logout(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        session.invalidate();
        /*if (req.getParameter("action").equals("true")) {
         session.setAttribute("userId", null);
         session.setAttribute("userRole", 0);
         }*/

        //System.out.println("I'll always destroy session.");
        return "index";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutGet(HttpServletRequest req) {
        System.out.println("Came throught GET request ..... argggh");
        return logout(req);
    }
}
