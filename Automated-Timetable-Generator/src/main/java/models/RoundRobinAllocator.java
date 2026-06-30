package models;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import beans.GetConnection; 

public class RoundRobinAllocator {

    // Static map to maintain subject intake counts
    private static Map<String, Integer> subjectCapacities = new HashMap<>();

    public static String allocateSubjectInstantly(StudSubAllocation stu, int intake,String filepath,String email) {
        GetConnection con = new GetConnection();
        Connection conn = null;

        try {
            conn = con.getConnection();

            // Fetch subjects for the student's course, branch, and sem
            String subjectQuery = "SELECT subName FROM subjects WHERE course = ? AND branch = ? AND semester = ? AND sub_type = 'Elective'";
            PreparedStatement ps = conn.prepareStatement(subjectQuery);
            ps.setString(1, stu.getCourse());
            ps.setString(2, stu.getBranch());
            ps.setInt(3, stu.getSem());
            ResultSet rs = ps.executeQuery();

            List<String> subjects = new ArrayList<>();
            while (rs.next()) {
                String subName = rs.getString("subName");
                subjects.add(subName);

                // Fetch current allocation count for this subject
                if (!subjectCapacities.containsKey(subName)) {
                    PreparedStatement countStmt = conn.prepareStatement(
                            "SELECT COUNT(*) FROM stud_sub_allocation WHERE subjectName = ? AND course = ? AND branch = ? AND sem = ?");
                    countStmt.setString(1, subName);
                    countStmt.setString(2, stu.getCourse());
                    countStmt.setString(3, stu.getBranch());
                    countStmt.setInt(4, stu.getSem());
                    ResultSet countRs = countStmt.executeQuery();
                    if (countRs.next()) {
                        int currentCount = countRs.getInt(1);
                        subjectCapacities.put(subName, intake - currentCount);
                    }
                    countStmt.close();
                }
            }
            rs.close();
            ps.close();

            // Preferences list
            List<String> preferences = List.of(stu.getPref1(), stu.getPref2(), stu.getPref3());

            String allocatedSubject = null;
            for (String pref : preferences) {
                if (pref == null || pref.isEmpty()) continue;
                int capacity = subjectCapacities.getOrDefault(pref, 0);
                if (capacity > 0) {
                    allocatedSubject = pref;
                    subjectCapacities.put(pref, capacity - 1);
                    break;
                }
            }

            if (allocatedSubject == null) {
                return "No available subjects to allocate.";
            }
            stu.setSubject(allocatedSubject);
            stu.allocateSubject(email,filepath);
             

            return "Allocated subject: " + allocatedSubject;

        } catch (SQLException e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        } finally {
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}
