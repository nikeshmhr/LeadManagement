package com.leadmngmt.model;

/**
 * This class encapsulates the properties and characteristics
 * of counselor.
 * @author Nikesh
 */
public class Counsellor extends Staff {

    private int maxNoOfLeads;
    private int currentNoOfLeads;
    private Faculty faculty;
    
    public Counsellor(){
        this(0, 0, 0);
    }

    public Counsellor(int maxNoOfLeads, int currentNoOfLeads, int facultyId){
        super();
        this.maxNoOfLeads = maxNoOfLeads;
        this.currentNoOfLeads = currentNoOfLeads;
        this.faculty = new Faculty(facultyId);
    }

    public int getMaxNoOfLeads() {
        return maxNoOfLeads;
    }

    public void setMaxNoOfLeads(int maxNoOfLeads) {
        this.maxNoOfLeads = maxNoOfLeads;
    }

    public int getCurrentNoOfLeads() {
        return currentNoOfLeads;
    }

    public void setCurrentNoOfLeads(int currentNoOfLeads) {
        this.currentNoOfLeads = currentNoOfLeads;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }
    
    
}
