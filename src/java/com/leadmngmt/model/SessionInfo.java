package com.leadmngmt.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    public void redirect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (userRoleId == Role.ADMIN) {
            req.getRequestDispatcher("/administrator/addUser").forward(req, resp);
        } else if (userRoleId == Role.ADMISSION_OFFICER) {
            req.getRequestDispatcher("/LeadMangement/admission_officer/").forward(req, resp);
        } else if (userRoleId == Role.COUNSELLOR) {
            req.getRequestDispatcher("/LeadMangement/counsellor/dashboard").forward(req, resp);
        } else if (userRoleId == Role.RECEPTIONIST) {
            req.getRequestDispatcher("/LeadMangement/receptionist/add").forward(req, resp);
        } else if (userRoleId == Role.TOP_MANAGEMENT) {
            req.getRequestDispatcher("/LeadMangement/top_management/dashboard").forward(req, resp);
        } else {
            req.getRequestDispatcher("/login");
        }
    }

}
