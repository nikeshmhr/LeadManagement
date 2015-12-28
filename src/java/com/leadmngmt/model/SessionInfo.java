package com.leadmngmt.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nikesh
 */
public class SessionInfo {

    private String userEmailId;
    private int userRoleId;

    public SessionInfo() {
        this.userEmailId = "";
        this.userRoleId = 0;
    }

    public SessionInfo(String email, int id) {
        this.userEmailId = email;
        this.userRoleId = id;
    }

    public String getUserEmailId() {
        return userEmailId;
    }

    public void setUserEmailId(String userEmailId) {
        this.userEmailId = userEmailId;
    }

    public int getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(int userRoleId) {
        this.userRoleId = userRoleId;
    }

    public String redirectPage(HttpServletRequest request) {
        /**
         * Getting the current session *
         */
        HttpSession session = request.getSession(false);
        String userId = null;
        int userRole = 0;

        /**
         * If user exists and user role exists set it to its corresponding attributes*
         */
        if (session.getAttribute("userId") != null) {
            userId = session.getAttribute("userId").toString();
            this.setUserEmailId(userId);
        } else {
            this.setUserEmailId(null);
        }
        if (session.getAttribute("userRole") != null) {
            userRole = (Integer) session.getAttribute("userRole");
            this.setUserRoleId(userRole);
        } else {
            this.setUserRoleId(0);
        }

        /**
         * Return the name of the page according to the role of user *
         */
        if (userRoleId == Role.ADMIN) {
            return "/administrator/admin_add_user";
        } else if (userRoleId == Role.ADMISSION_OFFICER) {
            return "/admission_officer/dashboard";
        } else if (userRoleId == Role.COUNSELLOR) {
            return "/counsellor/dashboard";
        } else if (userRoleId == Role.RECEPTIONIST) {
            return "/receptionist/add";
        } else if (userRoleId == Role.TOP_MANAGEMENT) {
            return "/top_management/dashboard";
        } else {
            return "/index";
        }
    }

}
