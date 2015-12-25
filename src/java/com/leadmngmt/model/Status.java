package com.leadmngmt.model;

/**
 *
 * @author Nikesh
 */
public class Status {

    private int statusId;
    private String statusName;

    public static final int INTERESTED = 1;
    public static final int DISMISSED = 2;
    public static final int POSTPOND = 3;
    public static final int EXPIRED = 4;
    public static final int PENDING = 5;
    public static final int ADMITTED = 6;

    public Status() {
        this(1);
    }

    public Status(int id) {
        this.statusId = id;

        setStatusName(id);
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public final void setStatusName(int id) {
        switch (id) {
            case INTERESTED:
                setStatusName("Interested");
                break;

            case DISMISSED:
                setStatusName("Dismissed");
                break;

            case POSTPOND:
                setStatusName("Postpond");
                break;

            case EXPIRED:
                setStatusName("Expired");
                break;

            case PENDING:
                setStatusName("Pending");
                break;

            case ADMITTED:
                setStatusName("Admitted");
                break;
        }
    }

}
