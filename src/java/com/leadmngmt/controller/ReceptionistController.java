package com.leadmngmt.controller;

import com.leadmngmt.model.Faculty;
import com.leadmngmt.model.Lead;
import com.leadmngmt.util.BulkInsert;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.chart.PieChart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Nikesh
 */
@Controller
public class ReceptionistController {

    @RequestMapping(value = "receptionist/add", method = RequestMethod.GET)
    public String loadDefaultPage() {
        return "receptionist/receptionist_single_lead_entry";
    }

    @RequestMapping(value = "receptionist/add/bulk", method = RequestMethod.GET)
    public String loadBulkAddPage() {
        return "receptionist/receptionist_bulk_lead_entry";
    }

    @RequestMapping(value = "receptionist/add/postData", method = RequestMethod.POST)
    public String extractDataFromForm(HttpServletRequest request, HttpServletResponse response, ModelMap map) {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email_id");
            String phone = request.getParameter("phone");
            String dateString = request.getParameter("date_of_birth");
            final int ONE_WEEK = 7;

            GregorianCalendar gCalendar = new GregorianCalendar();
            int currentDayNumber = gCalendar.get(Calendar.DAY_OF_MONTH);
            gCalendar.add(Calendar.DAY_OF_MONTH, ONE_WEEK);

            String nextFollowUp = gCalendar.get(Calendar.YEAR) + "-" + (gCalendar.get(Calendar.MONTH) + 1) + "-" + gCalendar.get(GregorianCalendar.DAY_OF_MONTH);
//            System.out.println(dateString);
            Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
            Date followUp = new SimpleDateFormat("yyyy-MM-dd").parse(nextFollowUp);
            
            int faculty = Integer.parseInt(request.getParameter("Faculty"));
            String semester = request.getParameter("semester");
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

            Lead lead = new Lead();
            lead.setName(name);
            lead.setEmail(email);
            lead.setPhone(phone);
            lead.setDateOfBirth(utilDate);
            lead.setFaculty(new Faculty(faculty));
            lead.setSemester(semester);
            lead.setGender(gender);
            lead.setNextFollowup(followUp);

            //System.out.println("NEXT FOLLOW UP: " + nextFollowUp);
            boolean addStatus = lead.addLead();
            if (addStatus) {
                map.addAttribute("message", "Lead successfully added");
            } else {
                map.addAttribute("message", "Failed to add lead.");
            }

        } catch (ClassNotFoundException ex) {
            map.addAttribute("message", "Failed to add lead due to internal driver problem.");
        } catch (SQLException ex) {
            map.addAttribute("message", "Failed to add lead due to internal error.");
        } catch (ParseException ex) {
            map.addAttribute("message", "Failed to add lead due to parse error.");
        }
        return "receptionist/receptionist_single_lead_entry";
    }

    @RequestMapping(value = "/receptionist/bulkUpload", method = RequestMethod.POST)
    public String extractBulkData(HttpServletRequest req, ModelMap map) {
        DataInputStream in = null;
        try {
            String contentType = req.getContentType();
            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                in = new DataInputStream(req.getInputStream());
                int formDataLength = req.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while (totalBytesRead < formDataLength) {
                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                    totalBytesRead += byteRead;
                }
                String file = new String(dataBytes);
                String saveFile = file.substring(file.indexOf("filename=\"") + 10);
//                System.out.println("saveFile=" + saveFile);
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
//                System.out.println("saveFile" + saveFile);
                saveFile = file.substring(file.indexOf("filename=\"") + 10);
                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
                int pos;
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                FileOutputStream fileOut = new FileOutputStream(saveFile);
                fileOut.write(dataBytes, startPos, (endPos - startPos));

                List<Lead> leadsToAdd = BulkInsert.getLeadsFromFile(saveFile);

                List<String> failedToAdd = new ArrayList<String>();

                for (Lead l : leadsToAdd) {
                    final int ONE_WEEK = 7;

                    GregorianCalendar gCalendar = new GregorianCalendar();
                    int currentDayNumber = gCalendar.get(Calendar.DAY_OF_MONTH);
                    gCalendar.add(Calendar.DAY_OF_MONTH, ONE_WEEK);

                    String nextFollowUp = gCalendar.get(Calendar.YEAR) + "-" + (gCalendar.get(Calendar.MONTH) + 1) + "-" + gCalendar.get(GregorianCalendar.DAY_OF_MONTH);
                    Date followUp = new SimpleDateFormat("yyyy-MM-dd").parse(nextFollowUp);
                    
                    l.setNextFollowup(followUp);
                    
                    try {
                        boolean isAdded = l.addLead();
                        if (!isAdded) {
                            failedToAdd.add(l.getName());
                        } else {
                            map.addAttribute("message", "Leads added.");
                        }

                    } catch (ClassNotFoundException ex) {
                        map.addAttribute("message", "Driver not found.");
                    } catch (SQLException ex) {
                        map.addAttribute("message", "SQL error.");
                    }
                    map.addAttribute("failedToAdd", failedToAdd);
                }
            }
        } catch (IOException ex) {
            map.addAttribute("message", "IO Exception.");
        } catch (ParseException ex) {
            map.addAttribute("message", "Parse Exception.");
        } finally {
            try {
                in.close();
            } catch (IOException ex) {
                map.addAttribute("message", "IO Exception.");
            }
        }
        return "receptionist/receptionist_bulk_lead_entry";
    }

}
