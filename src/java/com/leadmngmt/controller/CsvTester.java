/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leadmngmt.controller;

import com.csvreader.CsvReader;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import org.apache.tomcat.jni.FileInfo;

/**
 *
 * @author Nikesh
 */
public class CsvTester {

    public static void main(String[] args) {

    }

    public static void readFile(String file) {
        try {

            CsvReader products = new CsvReader(file);

            products.readHeaders();
            System.out.println(products == null);

//            String[] headers = products.getHeaders();
//            for(String s : headers){
//                System.out.println(s);
//            }
            while (products.readRecord()) {
                String email = products.get("email");
                String name = products.get("name");
                String phone = products.get("phone");
                String dob = products.get("dob");

                // perform program logic here
                System.out.println(email + ":" + name + ":" + phone + ":" + dob);
            }
            System.out.println("Should successfully display data.");
            products.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
