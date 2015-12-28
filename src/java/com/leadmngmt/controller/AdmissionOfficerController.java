package com.leadmngmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Nikesh
 */
@Controller
public class AdmissionOfficerController {

    @RequestMapping(value="/admission_officer/dashboard", method=RequestMethod.GET)
    public String showDashboard(){
        return "/admission_officer/dashboard";
    }
}
