package com.leadmngmt.model;

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

}
