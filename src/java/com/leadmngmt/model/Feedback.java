package com.leadmngmt.model;

import com.leadmngmt.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * The class holds the information of feedbacks given by
 * counsellor to students.
 * @author Nikesh
 */
public class Feedback {

    private int feedbackId;
    private String feedbackText;

    public Feedback() {
        this(0, "");
    }

    public Feedback(String feedbackText) {
        this(0, feedbackText);
    }

    public Feedback(int id, String text) {
        this.feedbackId = id;
        this.feedbackText = text;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getFeedbackText() {
        return feedbackText;
    }

    public void setFeedbackText(String feedbackText) {
        this.feedbackText = feedbackText;
    }
    
    public int addFeedback(int leadId) throws ClassNotFoundException, SQLException{
        int row = 0;
        
        Connection c = Database.getConnection();
        PreparedStatement s = c.prepareStatement("INSERT INTO feedback (feedback_text, lead_id) VALUES(?, ?)");
        s.setString(1, this.feedbackText);
        s.setInt(2, leadId);
        
        row = s.executeUpdate();
        
        return row;
    }

}
