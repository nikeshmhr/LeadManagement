/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leadmngmt.model;

/**
 * This class contains the faculty information.
 *
 * @author Nikesh
 */
public class Faculty {

    private int facultyId;
    private String facultyName;

    public static final int COMPUTING = 1, NETWORKING = 2, MULTIMEDIA = 3, MANAGEMENT = 5, NA = 6;

    public Faculty() {
        this(0);
    }

    public Faculty(int facultyId) {
        this.facultyId = facultyId;

        setFacultyName(facultyId);
    }

    private void setFacultyName(int facultyId) {
        switch (facultyId) {
            case COMPUTING:
                setFacultyName("Computing");
                break;

            case NETWORKING:
                setFacultyName("Networking");
                break;

            case MULTIMEDIA:
                setFacultyName("Multimedia");
                break;

            case MANAGEMENT:
                setFacultyName("Management");
                break;

            case NA:
                setFacultyName("N/A");
                break;

            default:
                setFacultyName("");
        }
    }

    public int getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(int facultyId) {
        this.facultyId = facultyId;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public int getFacultyIdByName(String name) {
        if (name.equalsIgnoreCase("computing")) {
            return COMPUTING;
        } else if (name.equalsIgnoreCase("networking")) {
            return NETWORKING;
        } else if (name.equalsIgnoreCase("multimedia")) {
            return MULTIMEDIA;
        } else if (name.equalsIgnoreCase("management")) {
            return MANAGEMENT;
        } else if (name.equalsIgnoreCase("na")) {
            return NA;
        } else {
            return 0;
        }
    }

}
