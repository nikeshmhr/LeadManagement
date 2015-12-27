package com.leadmngmt.controller;

import com.leadmngmt.model.LoginInfo;
import com.leadmngmt.model.Role;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * This class handles all the page requests of admin.
 *
 * @author Nikesh
 */
@Controller
public class AdministratorController {

    @RequestMapping(value = "/administrator/addUser", method = RequestMethod.GET)
    public String showDefaultPage() {
        return "/administrator/admin_add_user";
    }

    @RequestMapping(value = "/administrator/addUser", method = RequestMethod.POST)
    public String addUser(HttpServletRequest request, HttpServletResponse response, ModelMap map) {
        try {
            // USER ADDING CODE GOES HERE

            String name = request.getParameter("name");
            String email = request.getParameter("email_id");
            String dateString = request.getParameter("date_of_birth");

            Date d = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);

            int role = Integer.parseInt(request.getParameter("Role"));

            boolean gender = false;
            if (request.getParameter("gender").equals("1")) {
                gender = true;
            }
            System.out.println("GENDER: " + gender);

//            int faculty = 0;
//            if(role == Role.COUNSELLOR){
//               faculty = Integer.parseInt(request.getParameter("Faculty"));
//            }
//            
//            
//            Staff staff = null;
//            if(role == Role.COUNSELLOR){
//                staff = new Counsellor();
//            }else{
//                staff = new Staff();
//            }
            LoginInfo info = new LoginInfo("nikeshm", "maharjan");
            info.setEmailId(email);
            info.setName(name);
            info.setRole(new Role(role));
            info.setGender(gender);

            boolean isUserCreated = info.createUser();
            int staffCreated = info.addStaff();

            if (isUserCreated && staffCreated > 0) {
                map.addAttribute("message", "User Created Successfully.");
            }

            // generateUsernameAndPassword();
            // Insert into login_info
            // Insert into staff_info
            // if the staff is counsellor, also insert into counsellor
            return "/administrator/admin_add_user";
        } catch (ParseException ex) {
            Logger.getLogger(AdministratorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdministratorController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdministratorController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "/administrator/admin_add_user";
    }

    @RequestMapping(value = "/administrator/updateUser", method = RequestMethod.GET)
    public String showDefaultUpdatePage() {
        return "/administrator/admin_update_user";
    }

}
