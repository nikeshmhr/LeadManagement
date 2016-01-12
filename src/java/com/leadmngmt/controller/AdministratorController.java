package com.leadmngmt.controller;

import com.leadmngmt.model.Counsellor;
import com.leadmngmt.model.LoginInfo;
import com.leadmngmt.model.Role;
import com.leadmngmt.model.Staff;
import com.leadmngmt.util.DataAccessObject;
import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
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

            //String dateString = request.getParameter("date_of_birth");
            //Date d = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
            String name = request.getParameter("name");
            String email = request.getParameter("email_id");

            int role = Integer.parseInt(request.getParameter("Role"));
            int faculty = Integer.parseInt(request.getParameter("Faculty"));

            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

            LoginInfo info = new LoginInfo();
            info.setEmailId(email);
            info.setName(name);
            info.setRole(new Role(role));
            info.setGender(gender);
            info.setId(getGeneratedId());
            String pwd = randomPassword();
            info.setPassword(pwd);

            Counsellor c = new Counsellor();
            if (role == Role.COUNSELLOR) {
//                c = new Counsellor();
                c.setEmailId(email);
                c.setFaculty(faculty);
                c.setMaxNoOfLeads(8);
                c.setCurrentNoOfLeads(0);
                c.setId(info.getId());
            }

            boolean isUserCreated = info.createUser();
            int staffCreated = info.addStaff();
            if (role == Role.COUNSELLOR) {
                c.addCounsellor();
            }

            if (isUserCreated && staffCreated > 0) {
                map.addAttribute("message", "User Created Successfully.");
                map.addAttribute("details", "<br/>Email: " + email + "<br/>Password: " + pwd);
            }
            // generateUsernameAndPassword();
            // Insert into login_info
            // Insert into staff_info
            // if the staff is counsellor, also insert into counsellor
            return "/administrator/admin_add_user";
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "User creation error: Internal driver problem.");
        } catch (SQLException ex) {
            map.addAttribute("message", "User creation error: Internal problem.");
        }
        return "/administrator/admin_add_user";
    }

    @RequestMapping(value = "/administrator/updateUser", method = RequestMethod.GET)
    public String showDefaultUpdatePage(ModelMap map) {
        try {
            List<Staff> existingUsers = DataAccessObject.getExistingUsers();
            System.out.println("existing user" + existingUsers);
            map.addAttribute("allUsers", existingUsers);
        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Exception: Internal driver error.");
        } catch (SQLException ex) {
            map.addAttribute("message", "Exception: Internal sql error.");
        }
        return "/administrator/admin_update_user";
    }

    private String getGeneratedId() throws SQLException, ClassNotFoundException {
        String id = "";

        Connection c = Database.getConnection();

        PreparedStatement statement = c.prepareStatement("SELECT id FROM login_info ORDER BY id DESC");
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int currentId = Integer.parseInt(rs.getString("id").substring(2));
            id = "ST" + (++currentId);
            break;
        }

        return id;
    }

    /**
     * Generates random alpha numeric characters of 8 characters long.
     *
     * @return
     */
    private String randomPassword() {
        String password = "";

        String alphaLower = "abcdefghijklmnopqrstuvwxyz";

        ArrayList<Character> randCharacters = new ArrayList<Character>();

        for (int i = 0; i <= 4; i++) {
            int randomAlpha = (int) (Math.random() * alphaLower.length());
            char character = alphaLower.charAt(randomAlpha);
            randCharacters.add(character);

            if (i % 2 == 0) {
                String randomNumber = ((int) (Math.random() * 10)) + "";
                randCharacters.add(randomNumber.toCharArray()[0]);
            }
        }

        Collections.shuffle(randCharacters);
        for (int i = 0; i < randCharacters.size(); i++) {
            password += randCharacters.get(i);
        }

        return password;
    }
}
