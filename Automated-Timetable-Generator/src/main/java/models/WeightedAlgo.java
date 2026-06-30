package models;
import java.sql.*;
import java.util.*;

import beans.GetConnection;

public class WeightedAlgo {

    
    // Subject capacities (example values; replace with actual capacities)
    private static final Map<String, Integer> subjectCapacities = new HashMap<>();

   

    public static void allocateSubject(StudSubAllocation stu,String userid, String username, String branch, String course, int sem,
                                       String pref1, String pref2, String pref3,String filepath,String email) {
    	GetConnection obj=new GetConnection();
        try (Connection conn = obj.getConnection()) {

            // Determine priority score
            double priorityScore = getPriorityScore(conn, userid, sem);

            // Determine subject allocation
            String allocatedSubject = determineAllocation(conn, pref1, pref2, pref3,priorityScore);

            if (allocatedSubject != null) {
                // Insert allocation into stud_sub_allocation table
            	stu.setSubject(allocatedSubject);
                stu.allocateSubject(email, filepath);
                    System.out.println("Subject allocated successfully: " + allocatedSubject);
                
            } else {
                System.out.println("No available subjects for allocation.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static double getPriorityScore(Connection conn, String userid, int sem) throws SQLException {
        String query;
        if (sem == 1) {
            // Use 12th percentage
            query = "SELECT percent FROM academics WHERE userid = ? AND course = 'HSC'";
        } else {
            // Use latest CGPA
            query = "SELECT cgpa FROM academics WHERE userid = ? ORDER BY acid DESC LIMIT 1";
        }

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, userid);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble(1);
                }
            }
        }
        return 0.0; // Default priority score if not found
    }
    private static String determineAllocation(Connection conn, String pref1, String pref2, String pref3, double priorityScore) throws SQLException {
        List<String> preferences = Arrays.asList(pref1, pref2, pref3);

        for (String subject : preferences) {
            int allocatedCount = getAllocatedCount(conn, subject);
            int capacity = subjectCapacities.getOrDefault(subject, 0);
            JavaFuns jf=new JavaFuns();
            Vector v=jf.getValue("select min_score from subject_score where subject_Name='"+subject+"'", 1);
            // Example: Apply minimum score rule
            double minScoreRequired = Double.parseDouble(v.elementAt(0).toString().trim());

            if (allocatedCount < capacity && priorityScore >= minScoreRequired) {
                return subject;
            }
        }
        return null;
    }
  

    private static int getAllocatedCount(Connection conn, String subject) throws SQLException {
        String query = "SELECT COUNT(*) FROM stud_sub_allocation WHERE subjectName = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, subject);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }

    // Example usage
    public static void main(StudSubAllocation stu, int intake,String filepath,String email) {
        // Sample data; replace with actual values
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
        allocateSubject(stu,stu.getUserid(), stu.getUsername(), stu.getBranch(), stu.getCourse(), stu.getSem(), stu.getPref1(), stu.getPref2(), stu.getPref3(),filepath,email);
         }
         catch (Exception e) {
			// TODO: handle exception
		}
    }
}

 
