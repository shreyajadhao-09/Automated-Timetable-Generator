<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 
<%@page import="models.LoginTracker"%>
  <%@page import="java.util.List"%>
<%@page import="models.LoginTracker"%>
 
  <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
  
  
</head>

<body  >
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>SmartEduPlatform</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="<%=session.getAttribute("usertype").toString().trim()%>" class="nav-item nav-link">Home</a>
                  <%if(session.getAttribute("usertype").toString().trim().equals("admin"))
                                	{
                                	%>
                  <a class="nav-item nav-link" href="registerbranch">Branches</a>
                  <a class="nav-item nav-link" href="generateTT">Generate Timetable</a> 
                                	 <a class="nav-item nav-link"  href="PrefSubmissionDt.jsp">Set Preference Submission Date</a></li>
                    <a class="nav-item nav-link"  href="viewPendingEle">Pending Elective Students</a> 
                                	              	   
           
           
        
		 <a class="nav-item nav-link" href="RegCourse">Courses</a> 
	  
		 <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Staff</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="/registerstaff" class="dropdown-item">Register Staff</a>
                        <a href="viewstaff" class="dropdown-item">View Staff</a>
                         
                    </div>
                </div> 
	  <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Students</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="approvestudentlist" class="dropdown-item">Pending students</a>
                        <a href="viewstudent" class="dropdown-item">View Student</a>
                         
                    </div>
                </div> 
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Subjects</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="RegSubject" class="dropdown-item">Register Subjects</a>
                        <a href="SubAllocation" class="dropdown-item">Allocate Subjects</a>
                         
                    </div>
                </div> 
								 <%}
        
        else if(session.getAttribute("usertype").toString().trim().equals("branchadmin"))
    	{
    	%>
        
                 
    	   <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Staff</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="/registerstaff" class="dropdown-item">Register Staff</a>
                        <a href="viewstaff" class="dropdown-item">View Staff</a>
                      
                    </div>
                </div>
    	  
 <a class="nav-item nav-link" href="viewstudent" >View Student</a></li> 
 <a class="nav-item nav-link" href="RegSubject">Subject Registration</a></li>
 <a  class="nav-item nav-link" href="SubAllocation">Subject Allocation</a></li> 
 <a href="approvestudentlist" > Pending students</a></li>
	 <%}
        
        else if(session.getAttribute("usertype").toString().trim().equals("staff"))
                            	{
                            	%>
                            	   
                            	   <a class="nav-item nav-link" href="viewMyAllottedSubjects" >View My Allotted Subjects </a></li>
		    
                            	 <a  class="nav-item nav-link" href="editProfile1" >My Profile</a></li>
                                  <a  class="nav-item nav-link" href="viewstudent" >View Students</a></li>
                             
                            	<%} else if(session.getAttribute("usertype").toString().trim().equals("student"))
                            	{
                            	%>
                            	 <a class="nav-item nav-link" href="getTimeTable?branch=<%=session.getAttribute("branch").toString().trim() %>&sem=<%=session.getAttribute("sem").toString().trim() %>">Time Table</a> 
                            	 <a  class="nav-item nav-link" href="editProfile" >Edit Profile</a></li>
                            	 <a class="nav-item nav-link" href="viewProfile.jsp">Education Profile</a>
                            	 <a  class="nav-item nav-link" href="viewStudSubjects1" >Set Preferences</a></li>
                               <a class="nav-item nav-link" href="viewStudSubjects">View Subjects</a></li>
                               
                            
                             <%} %> 
                            	 <a  class="nav-item nav-link" href="ChangePass">Change Password</a></li>
								 <a  class="nav-item nav-link" href="logout">Logout</a></li>
       </div></div></nav>
       
       
       <!-- Header Start -->
    <div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">Automatic Subject Allocation & Time Table Generator System</h1>
                    <nav aria-label="breadcrumb justify-content-center">
                      <%if(!session.getAttribute("usertype").toString().equals("admin")){ %>
	 <center><img src='Uploads/<%=session.getAttribute("photo").toString() %>' class="img-responsive img-thumbnail rounded-circle" width="100px"/></center>
	 <%} %> <h6 class=" breadcrumb-item"> Logged in as <%=session.getAttribute("userid").toString() %> (<%=session.getAttribute("usertype").toString() %>)
	</h6>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
			  <div class="wrapper bgded overlay gradient" style="background-image:url('img/044.jpg');">
  <div id="breadcrumb" class="hoc clear"> 
    <!-- ################################################################################################ -->
    
    
    <!-- ################################################################################################ -->
  </div>
</div>
      
   <div class="container"> 
   
	 <div class="jumbotron">
	 
	 
    
    <!-- Back to Top 
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
-->

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>