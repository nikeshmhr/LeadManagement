/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leadmngmt.util;

import com.csvreader.CsvReader;
import com.leadmngmt.model.Faculty;
import com.leadmngmt.model.Lead;
import com.leadmngmt.model.Status;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nikesh
 */
public class BulkInsert {

    public static List<Lead> getLeadsFromFile(String file) throws IOException, ParseException {
        ArrayList<Lead> listOfLeads = new ArrayList<Lead>();

        CsvReader leads = new CsvReader(file);

        leads.readHeaders();

//            String[] headers = products.getHeaders();
//            for(String s : headers){
//                System.out.println(s);
//            }
        while (leads.readRecord()) {
            String email = leads.get("email");
            String name = leads.get("name");
            String phone = leads.get("phone");
            String dob = leads.get("dob");
            int facultyId = Integer.parseInt(leads.get("facultyId"));
            int statusId = Integer.parseInt(leads.get("statusId"));
            String semester = leads.get("semester");
            String genderString = leads.get("gender");
            boolean gender = (genderString.equalsIgnoreCase("male"));
            
            Lead l = new Lead();
            l.setName(name);
            l.setEmail(email);
            l.setPhone(phone);
            l.setDateOfBirth(new SimpleDateFormat("yyyy-MM-dd").parse(dob));
            l.setFaculty(new Faculty(facultyId));
            l.setStatus(new Status(statusId));
            l.setSemester(semester);
            l.setGender(gender);
            
            listOfLeads.add(l);

            // perform program logic here
            //System.out.println(email + ":" + name + ":" + phone + ":" + dob);
        }
//        System.out.println("Should successfully display data.");
        leads.close();

        return listOfLeads;
    }
}
