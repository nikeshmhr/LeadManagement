package com.leadmngmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * This class handles all the page requests of admin.
 *
 * @author Nikesh
 */
@Controller
public class AdminController {

    @RequestMapping(value = "/admin/addUser", method = RequestMethod.GET)
    public String showDefaultPage() {
        return "/admin/admin_add_user";
    }

}
