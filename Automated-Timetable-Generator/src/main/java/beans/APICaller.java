package beans;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class APICaller {
    public static String main(String branch,String sem) {
        
        	// String studentId = userid; // Replace with actual student ID
             String apiUrl = "http://127.0.0.1:5000/generate_timetable?branch="+branch.trim()+"&semester="+sem.trim();
              
             try {
                 URL url = new URL(apiUrl);
                 HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                 conn.setRequestMethod("GET");
                 conn.setRequestProperty("Accept", "application/json");

                 int responseCode = conn.getResponseCode();
                 if (responseCode != 200) {
                     throw new RuntimeException("Failed: HTTP error code: " + responseCode);
                 }

                 BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                 StringBuilder response = new StringBuilder();
                 String output;

                 while ((output = br.readLine()) != null) {
                     response.append(output);
                 }

                 System.out.println("API Response: " + response.toString());
                 
                 conn.disconnect();
                 return response.toString();
             } catch (Exception e) {
                 e.printStackTrace();
                 return "NA";
             }
             
    }
  
}
