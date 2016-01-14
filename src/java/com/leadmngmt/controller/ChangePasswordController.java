package com.leadmngmt.controller;

import com.leadmngmt.model.LoginInfo;
import com.leadmngmt.model.Staff;
import java.sql.SQLException;
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
public class ChangePasswordController {

    @RequestMapping(value = "/changepass", method = RequestMethod.GET)
    public String defaultPage() {
        return "/change_password";
    }

    @RequestMapping(value = "/changepass", method = RequestMethod.POST)
    public String changePassword(HttpServletRequest req, HttpServletResponse res, ModelMap map) {
        String old = req.getParameter("old");
        String newPwd = req.getParameter("new");
        String id = req.getParameter("email");

        LoginInfo info = new LoginInfo(id, old);
        boolean isValid = false;
        try {
            isValid = info.isValid();
            if (!isValid) {
                map.addAttribute("incorrect", "Incorrect password.");
                System.out.println("Message Sent");
                //res.sendRedirect("/LeadManagement/changepass");
            } else {
                Staff s = new Staff();
                s.setEmailId(id);
                boolean changed = s.changePassword(newPwd);
                if (changed) {
                    req.setAttribute("changed", "Password changed.");
                } else {
                    req.setAttribute("message", "Could not change password");
                }
            }
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Internal driver problem.");
        } catch (SQLException ex) {
            map.addAttribute("message", "Internal sql problem.");
        }
        return "/change_password";
    }

}
