package com.leadmngmt.controller;

import com.leadmngmt.model.LoginInfo;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * This class the login.
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
    public String showForm() {
        return "index";
    }

    @RequestMapping(value = "/logincontroller", method = RequestMethod.POST)
    public String controlForm(HttpServletRequest req, HttpServletResponse res) {
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

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "home";
    }

}
