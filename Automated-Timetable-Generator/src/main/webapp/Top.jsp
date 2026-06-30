<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SmartEduPlatform | Admin Panel</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/style.css" rel="stylesheet">
<style>
body{
    font-family:'Nunito',sans-serif;
    background:linear-gradient(135deg, cyan, navy);
    min-height:100vh;
}

/* ===== SIDEBAR ===== */
.sidebar{
    position:fixed;
    top:0;
    left:0;
    width:280px;
    height:100%;
    background:rgba(0,0,0,.88);
    padding:20px 0;
    overflow-y:auto;
}

.sidebar h3{
    color:#fff;
    text-align:center;
    font-weight:800;
    margin-bottom:25px;
}

.sidebar a{
    display:block;
    color:#ddd;
    padding:12px 25px;
    text-decoration:none;
    font-weight:600;
    transition:.3s;
}

.sidebar a:hover{
    background:#0d6efd;
    color:#fff;
}

.sidebar .submenu a{
    padding-left:45px;
    font-size:.9rem;
}

/* ===== CONTENT ===== */
.content{
    margin-left:280px;
    padding:25px;
}

/* ===== TOP BAR ===== */
.topbar{
    background:rgba(255,255,255,.15);
    backdrop-filter:blur(10px);
    border-radius:15px;
    padding:15px 25px;
    color:#fff;
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
}
.display-5{
color:white;
text-transform: capitalize;
}

/* ===== HEADER ===== */
.page-header{
    background:
      linear-gradient(rgba(0,0,0,.6),rgba(0,0,0,.6)),
      url("img/carousel-1.jpg") center/cover no-repeat;
    border-radius:20px;
    padding:60px 20px;
    color:#fff;
    margin-bottom:25px;
}
</style>
</head>

<body>

<!-- ================= SIDEBAR (ALL MENUS KEPT) ================= -->
<div class="sidebar">
<h3>SmartEduPlatform</h3>

<a href="<%=session.getAttribute("usertype")%>">
<i class="fa fa-home me-2"></i>Home
</a>

<% if(session.getAttribute("usertype").toString().equals("admin")){ %>

<a href="registerbranch">Branches</a>
<a href="generateTT">Generate Timetable</a>
<a href="PrefSubmissionDt.jsp">Set Preference Submission Date</a>
<a href="viewPendingEle">Pending Elective Students</a>
<a href="RegCourse">Courses</a>

<a data-bs-toggle="collapse" href="#staffMenu">Staff</a>
<div class="collapse submenu" id="staffMenu">
  <a href="/registerstaff">Register Staff</a>
  <a href="viewstaff">View Staff</a>
</div>

<a data-bs-toggle="collapse" href="#studentMenu">Students</a>
<div class="collapse submenu" id="studentMenu">
  <a href="approvestudentlist">Pending Students</a>
  <a href="viewstudent">View Students</a>
</div>

<a data-bs-toggle="collapse" href="#subjectMenu">Subjects</a>
<div class="collapse submenu" id="subjectMenu">
  <a href="RegSubject">Register Subjects</a>
  <a href="SubAllocation">Allocate Subjects</a>
</div>

<% } else if(session.getAttribute("usertype").toString().equals("branchadmin")){ %>

<a data-bs-toggle="collapse" href="#staffMenu">Staff</a>
<div class="collapse submenu" id="staffMenu">
  <a href="/registerstaff">Register Staff</a>
  <a href="viewstaff">View Staff</a>
</div>

<a href="viewstudent">View Student</a>
<a href="RegSubject">Subject Registration</a>
<a href="SubAllocation">Subject Allocation</a>
<a href="approvestudentlist">Pending Students</a>

<% } else if(session.getAttribute("usertype").toString().equals("staff")){ %>

<a href="viewMyAllottedSubjects">View My Allotted Subjects</a>
<a href="editProfile1">My Profile</a>
<a href="viewstudent">View Students</a>

<% } else if(session.getAttribute("usertype").toString().equals("student")){ %>

<a href="getTimeTable?branch=<%=session.getAttribute("branch")%>&sem=<%=session.getAttribute("sem")%>">
Time Table</a>
<a href="editProfile">Edit Profile</a>
<a href="viewProfile.jsp">Education Profile</a>
<a href="viewStudSubjects1">Set Preferences</a>
<a href="viewStudSubjects">View Subjects</a>

<% } %>

<a href="ChangePass">Change Password</a>
<a href="logout">Logout</a>

</div>

<!-- ================= MAIN CONTENT ================= -->
<div class="content">

<!-- TOP BAR -->
<div class="topbar">
<div>
<h4 class="mb-0">Automatic Subject Allocation & Timetable System</h4>
 
</div>
<div>
<b><%=session.getAttribute("userid")%></b>
(<%=session.getAttribute("usertype")%>)
</div>
</div>

<!-- HEADER / SLIDER -->
<div class="page-header text-center">
<h1 class="display-5 fw-bold">
<%=session.getAttribute("usertype").toString() %> Panel
</h1>

<% if(!session.getAttribute("usertype").toString().equals("admin")){ %>
<img src="Uploads/<%=session.getAttribute("photo")%>"
 class="rounded-circle img-thumbnail mt-3" width="110">
<% } %>
</div>

<!-- YOUR PAGE CONTENT GOES HERE -->
<div class="card p-4">
 
 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
