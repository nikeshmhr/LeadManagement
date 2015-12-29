package com.leadmngmt.controller;

import com.leadmngmt.model.LoginInfo;
import com.leadmngmt.model.Role;
import com.leadmngmt.model.SessionInfo;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    /*@RequestMapping(value = "/login", method = RequestMethod.GET)
     public ModelAndView login() {
     return new ModelAndView("index", "command", new LoginInfo());
     }

     @RequestMapping(value = "/logincontroller", method = RequestMethod.POST)
     public String testMethod(@ModelAttribute LoginInfo info, ModelMap map) {
     try {
     map.addAttribute("username", info.getUsername());
     map.addAttribute("password", info.getPassword());

     if (info.isValid()) {
     return "home";
     } else {
     map.addAttribute("message", "Invalid username or password.");
     return "index";
     }
     } catch (ClassNotFoundException ex) {
     Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
     } catch (SQLException ex) {
     Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
     }
     return null;
     }
    
     @RequestMapping(value="/testform", method = RequestMethod.POST)
     public String test(HttpServletRequest req, HttpServletResponse resp, ModelMap map){
     String name = req.getParameter("name");
     map.addAttribute("name", name);
     return "home";
     }
    
     @RequestMapping(value="/form", method=RequestMethod.GET)
     public String form(){
     return "testform";
     }*/
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /**
         * Retrieve the name of the page that the user should be redirected to *
         */
        //String redirectPageName = (String) new SessionInfo().redirectPage(request);

//        if (redirectPageName.isEmpty()) {
//            redirectPageName = "index";
//        }
        return "index";
        //return redirectPageName;
    }

    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public void redirect(HttpServletRequest req) {

    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String controlForm(HttpServletRequest req, HttpServletResponse res, ModelMap map) {
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
                session.setMaxInactiveInterval(24 * 60 * 60);   // for 24 hours or 1 day

                if (login.getRole().getRoleId() == Role.ADMIN) {
                    //return "/administrator/admin_add_user";
                    System.out.println("BEFORE RETURN");
                    return "/administrator/admin_add_user";
                } else if (login.getRole().getRoleId() == Role.RECEPTIONIST) {
                    return "/receptionist/receptionist_single_lead_entry";
                    //return "/receptionist/receptionist_single_lead_entry";
                } else if (login.getRole().getRoleId() == Role.COUNSELLOR) {
                    return "/counsellor/dashboard";
                    //return "/counsellor/dashboard";
                } else if (login.getRole().getRoleId() == Role.ADMISSION_OFFICER) {
                    return "/admission_officer/dashboard";
                } else {
                    return "/top_management/dashboard";
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
        //return "home";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest req) {
        HttpSession session = req.getSession();
        if (req.getParameter("action").equals("true")) {
            session.setAttribute("userId", null);
            session.setAttribute("userRole", 0);
        }

        return "index";
    }
}
