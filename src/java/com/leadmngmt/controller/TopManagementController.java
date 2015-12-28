package com.leadmngmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Nikesh
 */
@Controller
public class TopManagementController {

    @RequestMapping(value="/top_management/dashboard", method=RequestMethod.GET)
    public String showDashboard(){
        return "/top_management/dashboard";
    }
    
}
