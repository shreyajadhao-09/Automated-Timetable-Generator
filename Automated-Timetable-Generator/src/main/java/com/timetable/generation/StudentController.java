package com.timetable.generation;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;

 

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import beans.APICaller;
import beans.GMailer;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import models.*;
 

@Controller
public class StudentController implements ErrorController{
	@RequestMapping("/college")
	public String index()
	{
		return "index.jsp";
	}
	@RequestMapping("/RegGrad")
	public String RegGrad(HttpServletRequest request,HttpSession ses)
	{
		String xschool="grd";
	double xpercent=Double.parseDouble(request.getParameter("grad-percentage").trim());
		String xyear=request.getParameter("grad-year");
		String branch=request.getParameter("branch");
		JavaFuns jf=new JavaFuns();
		String qr1="delete from academics where userid='"+ses.getAttribute("userid").toString().trim()+"' and course='"+request.getParameter("sem").toString().trim()+"'";
		if(jf.execute(qr1)) {}
		int mxid=jf.FetchMax("acid", "academics");
		String qr="insert into academics values("+mxid+",'"+ses.getAttribute("userid").toString().trim()+"',";
		qr+="'"+xschool+"',"+xpercent+",'"+xyear+"','"+request.getParameter("sem").toString().trim()+"','"+request.getParameter("branch").toString().trim()+"',0,0)";
		System.out.println(qr);
		if(jf.execute(qr)) {}
		return "viewProfile.jsp";
	}
	@RequestMapping("/RegXIIDetails")
	public String RegXIIDetails(HttpServletRequest request,HttpSession ses)
	{
		String xschool=request.getParameter("xii-school");
	double xpercent=Double.parseDouble(request.getParameter("xii-percentage").trim());
		String xyear=request.getParameter("xii-year");
		JavaFuns jf=new JavaFuns();
		int mxid=jf.FetchMax("acid", "academics");
		String qr="insert into academics values("+mxid+",'"+ses.getAttribute("userid").toString().trim()+"',";
		qr+="'"+xschool+"',"+xpercent+",'"+xyear+"','HSC','NA',"+xpercent+",0)";
		System.out.println(qr);
		if(jf.execute(qr)) {}
		return "viewProfile.jsp";
	}
	@RequestMapping("/RegXDetails")
	public String RegXDetails(HttpServletRequest request,HttpSession ses)
	{
		String xschool=request.getParameter("x-school");
	double xpercent=Double.parseDouble(request.getParameter("x-percentage").trim());
		String xyear=request.getParameter("x-year");
		JavaFuns jf=new JavaFuns();
		int mxid=jf.FetchMax("acid", "academics");
		String qr="insert into academics values("+mxid+",'"+ses.getAttribute("userid").toString().trim()+"',";
		qr+="'"+xschool+"',"+xpercent+",'"+xyear+"','SSC','NA',"+xpercent+",0)";
		System.out.println(qr);
		if(jf.execute(qr)) {}
		return "viewProfile.jsp";
	}
	  
	@RequestMapping("/home")
	public String home()
	{
		return "index.jsp";
	}
	 
	@SessionScope
	@RequestMapping("/viewStudSubjects")
	public ModelAndView viewStudSubjects(HttpServletRequest request,HttpSession ses)
	{
		Subjects obj=new Subjects();
		obj.getAllottedSubjectsStud1(ses.getAttribute("userid").toString().trim(),ses.getAttribute("branch").toString().trim(),ses.getAttribute("sem").toString().trim());
		List<Subjects> lst=obj.getLstsub();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ViewSubjectsStud.jsp");
		mv.addObject("std",lst);
		System.out.println("lst="+lst.size());
		return mv;
	}
	@SessionScope
	@RequestMapping("/viewStudSubjects1")
	public ModelAndView viewStudSubjects1(HttpServletRequest request,HttpSession ses)
	{
		Subjects obj=new Subjects();
		obj.getAllottedSubjectsStud(ses.getAttribute("userid").toString().trim(),ses.getAttribute("branch").toString().trim(),ses.getAttribute("sem").toString().trim());
		List<Subjects> lst=obj.getLstsub();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("setPreference.jsp");
		mv.addObject("std",lst);
		System.out.println("lst="+lst.size());
		return mv;
	}
	@SessionScope
	@RequestMapping("/Courses11")
	public ModelAndView Courses11(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Courses2.jsp");
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/Courses")
	public ModelAndView Courses(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Courses.jsp");
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/CoursesPendingEle")
	public ModelAndView CoursesPendingEle(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("CoursesPendingEle.jsp");
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/Semesters")
	public ModelAndView Semesters(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Semesters.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		return mv;
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
        session.invalidate();
		return "Logout.jsp";
	}
	@SessionScope
	@RequestMapping("/Semesters1")
	public ModelAndView Semesters1(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Semesters1.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/Semesters1-pendingEle")
	public ModelAndView Semesters1_pendingEle(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("Semesters-pendingEle.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/viewMyAllottedSubjects")
	public ModelAndView viewMyAllottedSubjects(HttpServletRequest request,HttpSession ses)
	{
		SubjectsAllocation obj=new SubjectsAllocation();
		obj.getSubjectsAllocationReportStaff(ses.getAttribute("userid").toString().trim());
		List<SubjectsAllocation> lst=obj.getLstsub();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("viewMyAllottedSubjects.jsp");
		mv.addObject("std",lst);
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowAllottedSubjects")
	public ModelAndView ShowAllottedSubjects(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowAllottedSubjects.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		mv.addObject("semester",request.getParameter("semester").toString().trim());
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowAllottedSubjects1")
	public ModelAndView ShowAllottedSubjects1(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowAllottedSubjects1.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		mv.addObject("semester",request.getParameter("semester").toString().trim());
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	 
	@SessionScope
	@RequestMapping("/ShowSubjects")
	public ModelAndView ShowSubjects(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowSubjects.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		mv.addObject("semester",request.getParameter("semester").toString().trim());
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowSubjects_PendingEle")
	public ModelAndView ShowSubjects_PendingEle(Student vs, HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowSubjects_PendingEle.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		mv.addObject("semester",request.getParameter("semester").toString().trim());
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		List<Student> lst = new ArrayList<Student>();
		 
		//lst=vs.getStudentReport2(ses.getAttribute("branch").toString().trim(),request.getParameter("sem").trim(),request.getParameter("subjectName").trim());
		
		lst=vs.getStudentReportPendingEle();
		 
		mv.addObject("stal",lst);
		//mv.setViewName("ViewStudentReportEle.jsp");
		return mv;
	}
	@SessionScope
	@RequestMapping("/ShowSubjects_PendingEle1")
	public ModelAndView ShowSubjects_PendingEle1(Student vs, HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("ShowSubjects_PendingEle1.jsp");
		mv.addObject("courseId",request.getParameter("courseId").toString().trim());
		mv.addObject("semester",request.getParameter("semester").toString().trim());
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		List<Student> lst = new ArrayList<Student>();
		 
		//lst=vs.getStudentReport2(ses.getAttribute("branch").toString().trim(),request.getParameter("sem").trim(),request.getParameter("subjectName").trim());
		
		lst=vs.getStudentReportPendingEle();
		 
		mv.addObject("stal",lst);
		//mv.setViewName("ViewStudentReportEle.jsp");
		return mv;
	}
	@RequestMapping("/registerstudent")
	public String registerstudent()
	{
		return "Register.jsp";
	}
	@RequestMapping("/student")
	public String student()
	{
		return "Student.jsp";
	}
	@RequestMapping("/branchadmin")
	public String branchadmin()
	{
		return "branchadmin.jsp";
	}
	@RequestMapping("/staff")
	public String staff()
	{
		return "Staff.jsp";
	}
	@RequestMapping("/admin")
	public String admin()
	{
		return "Admin.jsp";
	}
	 @RequestMapping("/error")
    public String handleError() {
        //do something like logging
		return "college";
    }
	 
	 @RequestMapping("/GetSubPref2")
		public String GetSubPref2(HttpServletRequest request)
		{
			return "pref2.jsp?sub="+request.getParameter("sub").trim();
		}
	 @RequestMapping("/GetSubPref3")
		public String GetSubPref3(HttpServletRequest request)
		{
			return "pref3.jsp?sub="+request.getParameter("sub").trim();
		}
	 @RequestMapping("/setPreferences")
		public ModelAndView setPreferences( StudSubAllocation stu,HttpSession ses,HttpServletRequest request)
		{
			ModelAndView mv=new ModelAndView();
			 try
			 { 
				 JavaFuns jf=new JavaFuns();
				 Vector v123=jf.getValue("select count(*) from stud_sub_allocation where subjectName='"+request.getParameter("pref1").trim()+"'", 1);
				 Vector v=jf.getValue("SELECT intake from preference_submission  where  CURDATE() between fromdt and todt", 1);
				 int intake=Integer.parseInt(v.elementAt(0).toString().trim());	
				 if(Integer.parseInt(v123.elementAt(0).toString().trim())<intake){		
					
				 stu.setSubject(request.getParameter("pref1").trim());
				 }
				 else
				 {
					   v123=jf.getValue("select count(*) from stud_sub_allocation where subjectName='"+request.getParameter("pref2").trim()+"'", 1);
					   if(Integer.parseInt(v123.elementAt(0).toString().trim())<intake){		
							
							 stu.setSubject(request.getParameter("pref2").trim());
							 }
					   else
					   {
						   stu.setSubject(request.getParameter("pref3").trim());
					   }
				 }
				 stu.setBranch(ses.getAttribute("branch").toString().trim());
				 stu.setCourse(ses.getAttribute("course").toString().trim());
				 stu.setSem(Integer.parseInt(ses.getAttribute("sem").toString().trim()));
				 stu.setUserid(ses.getAttribute("userid").toString().trim());
				 stu.setUsername(ses.getAttribute("username").toString().trim());
				 
				 String filepath=request.getServletContext().getRealPath("/");
			    stu.allocateSubject(ses.getAttribute("email").toString().trim(),filepath);
			     mv.setViewName("Success.jsp");
					 
			 }
			 catch (Exception e) {
				// TODO: handle exception
				 mv.setViewName("Failure.jsp");
			} 
			 mv.addObject("activity","studsuball");
			 mv.addObject("sub",stu.getSubject());
			 return mv;
			
		} 
	 @RequestMapping("/AllocateSubjectEle")
		public ModelAndView AllocateSubjectEle( StudSubAllocation stu,HttpSession ses,HttpServletRequest request)
		{
			ModelAndView mv=new ModelAndView();
			String filepath=request.getServletContext().getRealPath("/");
			 try
			 { 
				 String[] userids=request.getParameterValues("userid");
				 if(userids.length==0)
				 {
					 mv.setViewName("Failure.jsp");
					 mv.addObject("activity","studsuballele");
				 }
				 else
				 {
					 JavaFuns jf=new JavaFuns();
					 
				 if(request.getParameter("action").toString().trim().equals("Allocate"))
				 {
					 for(int i=0;i<userids.length;i++)
					 {
						 Vector v=jf.getValue("SELECT usernm,branch,semester,emailid,course FROM studentpersonal where userid='"+userids[i].trim()+"'" , 5);
						 String email;
						 email=v.elementAt(3).toString().trim();
					 System.out.println("userids="+userids[0]+" action="+request.getParameter("action").toString());
					 mv.addObject("activity","studsuballele");
					 mv.addObject("sub",stu.getSubject());
					 stu.setBranch(v.elementAt(1).toString().trim());
					 stu.setCourse(v.elementAt(4).toString().trim());
					 stu.setSem(Integer.parseInt(v.elementAt(2).toString().trim()));
					 stu.setUserid(userids[i].toString().trim().toString().trim());
					 stu.setUsername(v.elementAt(0).toString().trim());
				    stu.setPref1("NA");
				    stu.setPref2("NA");
				    stu.setPref3("NA");
					 stu.allocateSubject(v.elementAt(3).toString().trim(),filepath);
					 
					 }
					 mv.addObject("activity","studsuballele");
				 }
				 else
				 { 
				 GMailer gmail=new GMailer(filepath);
				 Vector v1=jf.getValue("select fromdt,todt from preference_submission",2 );
					
					 for(int i=0;i<userids.length;i++)
					 {
						 Vector v=jf.getValue("SELECT usernm,branch,semester,emailid,course FROM studentpersonal where userid='"+userids[i].trim()+"'" , 5);
						 String email;
						 email=v.elementAt(3).toString().trim();
					 String msg;
					 msg="Dear Student, fill elective preference form as early as possible. Preferece submission Dates are from "+v1.elementAt(0).toString().trim()+" to "+v1.elementAt(1).toString().trim();
					 if(gmail.sendMail("Elective Preference Form Submission Notification", msg, email))
					 {
						 
					 }
					 }
					 System.out.println("userids="+userids[0]+" action="+request.getParameter("action").toString());
					 mv.addObject("activity","elenotification"); 
				 }
				 mv.setViewName("Success.jsp");
				 
				 }
				  
				/*
				 stu.setBranch(ses.getAttribute("branch").toString().trim());
				 stu.setCourse(ses.getAttribute("course").toString().trim());
				 stu.setSem(Integer.parseInt(ses.getAttribute("sem").toString().trim()));
				 stu.setUserid(ses.getAttribute("userid").toString().trim());
				 stu.setUsername(ses.getAttribute("username").toString().trim());
			    stu.allocateSubject(ses.getAttribute("email").toString().trim());
			     */
			    
					 
			 }
			 catch (Exception e) {
				// TODO: handle exception
				 mv.setViewName("Failure.jsp");
				 mv.addObject("activity","studsuballele");
			} 
			 
			 return mv;
			
		} 
	 @RequestMapping("/setAlgo")
		public ModelAndView setAlgo(HttpServletRequest request)
		{
			ModelAndView mv=new ModelAndView();
			 try
			 { 
			   JavaFuns jf=new JavaFuns();
			   if(jf.execute("delete from setAllocationAlgo")) {}
			   String algo=request.getParameter("algo").trim();
			   
			   if(jf.execute("insert into setAllocationAlgo(algo) values('"+algo+"')")) {}
			    mv.setViewName("Success.jsp");
					 
			 }
			 catch (Exception e) {
				// TODO: handle exception
				 mv.setViewName("Failure.jsp");
			} 
			 mv.addObject("activity","AlgoReg");
			 return mv;
			
		} 
	 @RequestMapping("/regpreferences")
		public ModelAndView regpreferences(HttpServletRequest request)
		{
			ModelAndView mv=new ModelAndView();
			 try
			 { 
			   JavaFuns jf=new JavaFuns();
			   if(jf.execute("delete from preference_submission")) {}
			   String fromdt=request.getParameter("fromdt").trim();
			   String todt=request.getParameter("todt").trim();
			   String intake=request.getParameter("intake").trim();
			   if(jf.execute("insert into preference_submission values(1001,'"+fromdt+"','"+todt+"','"+intake+"')")) {}
			    mv.setViewName("Success.jsp");
					 
			 }
			 catch (Exception e) {
				// TODO: handle exception
				 mv.setViewName("Failure.jsp");
			} 
			 mv.addObject("activity","prefReg");
			 return mv;
			
		} 
		 	 
	@RequestMapping("/registeruser")
	public ModelAndView registeruser(Student stu,ServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		 try
		 {MultipartFile file=stu.getFile();
		 String filepath=request.getServletContext().getRealPath("/")+"/Uploads/";
		 
		 
		 System.out.println("path="+filepath);
		 File f=new File(filepath);
		 f.mkdir();
		  
		 try {
			  
			 String fileName=stu.getUserid()+"."+ file.getOriginalFilename().split("\\.")[1];
			 file.transferTo(new File(filepath+"/"+fileName));
			 stu.setPath(fileName);
			 String st=stu.addNewStudent();
				if(st.equals("success"))
					mv.setViewName("Success.jsp");
				else
					mv.setViewName("Failure.jsp");
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 mv.setViewName("Failure.jsp");
		}}
		 catch (Exception e) {
				// TODO: handle exception
			 mv.setViewName("Failure.jsp");
			}
		 mv.addObject("activity","StudReg");
		 return mv;
		
	}
	@RequestMapping("/updateuser")
	public ModelAndView updateuser(Student stu,ServletRequest request,HttpSession ses)
	{String fileName="NA";
		
	ModelAndView mv=new ModelAndView();
	try
		 {
			 stu.setUserid(ses.getAttribute("userid").toString().trim());
			 
		  
		 try {
			 MultipartFile file=stu.getFile();
			 String filepath=request.getServletContext().getRealPath("/")+"/Uploads/";
			 
			 
			 System.out.println("path="+filepath);
			 File f=new File(filepath);
			 f.mkdir();
			  fileName=stu.getUserid()+"."+ file.getOriginalFilename().split("\\.")[1];
			 file.transferTo(new File(filepath+"/"+fileName));
			 
		 }
		 catch (Exception e) {
			// TODO: handle exception
			// return "UserRegFailure.jsp";
		}
		 if(!fileName.equals("NA"))
		 {
			 ses.setAttribute("photo", fileName);
		 }
		 stu.setPath(fileName);
		 String st=stu.updateStudent(stu.getUserid());
		 ses.setAttribute("sem", stu.getSemester());
		 if(st.equals("success"))
				mv.setViewName("Success.jsp");
			else
				mv.setViewName("Failure.jsp");
		 }
		 catch (Exception e) {
			 System.out.println("in update="+e.getMessage());
				// TODO: handle exception
			 mv.setViewName("Failure.jsp");
			}
		 mv.addObject("activity","StudProfile");
		 return mv;
	}
	@RequestMapping("/updatestaff")
	public ModelAndView updatestaff(Staff1 stu,ServletRequest request,HttpSession ses)
	{
		ModelAndView mv=new ModelAndView();
		String fileName="NA";
		 try
		 {
			 stu.setUserid(ses.getAttribute("userid").toString().trim());
			
		 try {
			 MultipartFile file=stu.getFile();
			 String filepath=request.getServletContext().getRealPath("/")+"/Uploads/";
			 
			 
			 System.out.println("path="+filepath);
			 File f=new File(filepath);
			 f.mkdir();
			  
			  fileName=stu.getUserid()+"."+ file.getOriginalFilename().split("\\.")[1];
			 file.transferTo(new File(filepath+"/"+fileName));
			 
		 }
		 catch (Exception e) {
			// TODO: handle exception
			// return "UserRegFailure.jsp";
		}
		 if(!fileName.equals("NA"))
		 {
			 ses.setAttribute("photo", fileName);
		 }
		 stu.setPath(fileName);
		 String st=stu.updateStaff(stu.getUserid());
		 if(st.equals("success"))
				mv.setViewName("Success.jsp");
			else
				mv.setViewName("Failure.jsp");
		 }
		 catch (Exception e) {
			 System.out.println("in update="+e.getMessage());
				// TODO: handle exception
			 mv.setViewName("Failure.jsp");
			}
		 mv.addObject("activity","StaffProfile");
		 return mv;
	}
	@RequestMapping("/forgetpassword")
	public String forgetpassword() {
		
		return("ForgetPassword.jsp");
	}
	@RequestMapping("/recoverpassword")
	public String recoverpassword(PasswordRecovery pr) {
		
		String sts=pr.getNewPassword();
		
		return(sts);
	}
	@RequestMapping("/ChangePass")
	public String ChangePass()
	{
		return "ChangePass.jsp";
	}
	@RequestMapping("/ChangePassService")
	public ModelAndView ChangePassService(Pass eobj,HttpSession ses)
	{
		ModelAndView mv=new ModelAndView();
		 try
		 {
			 
			 eobj.setUserid(ses.getAttribute("userid").toString().trim());
			 if(eobj.changePassword())
			 { 
				 mv.setViewName("Success.jsp");
			 }
			 else
			 { 
				 mv.setViewName("Failure.jsp");
			 }
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 mv.setViewName("Failure.jsp");
		}
		 mv.addObject("activity","changePass");
		 return mv;
		 
	}
	
	@RequestMapping("/registernewBranchAdmin")
	public ModelAndView registernewBranchAdmin(Staff f)
	{
		ModelAndView mv=new ModelAndView();
		String st=f.addNewStaff();
		if(st.equals("success"))
			 mv.setViewName("Success.jsp");
		else
			 mv.setViewName("Failure.jsp");
		mv.addObject("activity","BAReg");
		 return mv;
	}
	@RequestMapping("/registernewstaff")
	public ModelAndView registernewstaff(Staff f)
	{
		ModelAndView mv=new ModelAndView();
		String st=f.addNewStaff();
		if(st.equals("success"))
			 mv.setViewName("Success.jsp");
		else
			 mv.setViewName("Failure.jsp");
		mv.addObject("activity","StaffReg");
		 return mv;
	}
	
	@RequestMapping("/GenerateTimeTable")
	@SessionScope
	public ModelAndView GenerateTimeTable(HttpServletRequest request) {
		String branch,sem;
		ModelAndView mv=new ModelAndView();
		branch=request.getParameter("branchname").toString().trim();
		sem=request.getParameter("semester").toString().trim();
		try {
		String result=APICaller.main(branch,sem);
		if(!result.trim().equals("NA"))
		{
			
		}
		}
		catch (Exception e) {
		}
		mv.setViewName("TimeTable.jsp");
		mv.addObject("sem",sem);
		mv.addObject("branch",branch);
		return(mv);
		
	}
	@RequestMapping("/getTimeTable")
	@SessionScope
	public ModelAndView getTimeTable(HttpServletRequest request) {
		String branch,sem;
		ModelAndView mv=new ModelAndView();
		branch=request.getParameter("branch").toString().trim();
		sem=request.getParameter("sem").toString().trim();
		 
		mv.setViewName("TimeTable.jsp");
		mv.addObject("sem",sem);
		mv.addObject("branch",branch);
		return(mv);
		
	}
	@RequestMapping("/registerbranch")
	@SessionScope
	public String registerbranch() {
		
		return("RegisterBranch.jsp");
		
	}
	@RequestMapping("/generateTT")
	@SessionScope
	public ModelAndView generateTT() {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		//System.out.println("branch lst="+lst.size());
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		mv.setViewName("generateTimeTable.jsp");
		return mv;
	}
	@RequestMapping("/RegCourse")
	@SessionScope
	public ModelAndView RegCourse() {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		//System.out.println("branch lst="+lst.size());
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		mv.setViewName("RegCourse.jsp");
		return mv;
	}
	@RequestMapping("/CourseReg")
	public ModelAndView CourseReg(Courses rb) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp";
		if(rb.registerCourse())
		{
			st="Success.jsp";
		}
		 
		mv.setViewName(st);
		mv.addObject("activity","courseReg");
		return mv;
	}
	@RequestMapping("/RegSubject")
	@SessionScope
	public ModelAndView RegSubject() {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		mv.setViewName("RegSubject.jsp");
		return mv;
	}
	 
	@RequestMapping("/SubAllocation")
	@SessionScope
	public ModelAndView SubAllocation(HttpSession ses) {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		List<Staff> lststaff = new ArrayList<Staff>();
		Staff staff=new Staff();
		lststaff=staff.getStaffList1(ses.getAttribute("branch").toString().trim());
		RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst);
		mv.addObject("lstStaff",lststaff);
		mv.setViewName("SubjectAllocation.jsp");
		return mv;
	}
	@RequestMapping("/viewPendingEle")
	@SessionScope
	public ModelAndView viewPendingEle(HttpSession ses) {
		
		List<RegisterBranch> lst = new ArrayList<RegisterBranch>();
		 RegisterBranch br = new RegisterBranch();
		br.getBranches();
		lst=br.getLstbranch();
		ModelAndView mv=new ModelAndView();
		mv.addObject("lstbranch",lst); 
		mv.setViewName("viewPendingEle.jsp");
		return mv;
	}
	@RequestMapping("/AllocateSubject")
	public ModelAndView AllocateSubject(SubjectsAllocation rb) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp";
		if(rb.allocateSubject())
		{
			st="Success.jsp";
		}
		 
		mv.setViewName(st);
		mv.addObject("activity","SubAllocation");
		return mv;
	}
	@RequestMapping("/SubjectReg")
	public ModelAndView SubjectReg(Subjects rb) {
		ModelAndView mv=new ModelAndView();
		String st="Failure.jsp";
		if(rb.registerSubject())
		{
			st="Success.jsp";
		}
		 
		mv.setViewName(st);
		mv.addObject("activity","SubReg");
		return mv;
	}
	 
	@RequestMapping("/registernewbranch")
	public ModelAndView registernewbranch(RegisterBranch rb) {
		
		String st=rb.registerBranch();
		ModelAndView mv=new ModelAndView();
		mv.setViewName(st);
		mv.addObject("activity","branchReg");
		return mv;
	}

	@RequestMapping("/activatestudent")
	public ModelAndView activatestudent(HttpServletRequest request,ApproveStudents ap) {
		ModelAndView mv=new ModelAndView();
		 
		String filepath=request.getServletContext().getRealPath("/");
		ap.setPath(filepath);
		String sts=ap.updateStudentStatus();
		if(sts.equals("success"))
			 mv.setViewName("Success.jsp");
		else
			 mv.setViewName("Failure.jsp");
		mv.addObject("activity","studActivation");
		 return mv;
	}
	@RequestMapping("/UploadDoc")
	@SessionScope
	public ModelAndView UploadDoc(HttpSession ses,HttpServletRequest request) {
		
		 
		//ViewStudent vs = new ViewStudent();
		//lst=vs.getStudentReport2(,request.getParameter("sem").trim(),request.getParameter("sub").trim());
		ModelAndView mv=new ModelAndView();
		//mv.addObject("std",lst);
		mv.addObject("branch",request.getParameter("branch").toString().trim());
		mv.addObject("sem",request.getParameter("sem").toString().trim());
		mv.addObject("sub",request.getParameter("sub").toString().trim());
		mv.setViewName("UploadDoc.jsp");
		return mv;
	}
	@RequestMapping("/viewstudent2")
	@SessionScope
	public ModelAndView viewstudent2(HttpSession ses,HttpServletRequest request) {
		
		List<ViewStudent> lst = new ArrayList<ViewStudent>();
		ViewStudent vs = new ViewStudent();
		lst=vs.getStudentReport2(request.getParameter("branch").toString().trim(),request.getParameter("sem").trim(),request.getParameter("sub").trim());
		ModelAndView mv=new ModelAndView();
		mv.addObject("std",lst);
		mv.setViewName("ViewStudentReport2.jsp");
		return mv;
	}
	@RequestMapping("/ShowPendingStudEle")
	@SessionScope
	public ModelAndView ShowPendingStudEle(Student vs ,HttpSession ses,HttpServletRequest request) {
		
		List<Student> lst = new ArrayList<Student>();
		 
		//lst=vs.getStudentReport2(ses.getAttribute("branch").toString().trim(),request.getParameter("sem").trim(),request.getParameter("subjectName").trim());
		
		lst=vs.getStudentReportPendingEle();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stal",lst);
		mv.setViewName("ViewStudentReportEle.jsp");
		return mv;
	}
	@RequestMapping("/viewstudent")
	@SessionScope
	public ModelAndView viewstudent(HttpSession ses,HttpServletRequest request) {
		
		List<Student> lst = new ArrayList<Student>();
		Student vs = new Student();
		//lst=vs.getStudentReport2(ses.getAttribute("branch").toString().trim(),request.getParameter("sem").trim(),request.getParameter("subjectName").trim());
		lst=vs.getStudentReport();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stal",lst);
		mv.setViewName("ViewStudentReport.jsp");
		return mv;
	}
	
	@RequestMapping("/editProfile")
	@SessionScope
	public ModelAndView editProfile(HttpSession ses) {
		ModelAndView mv=new ModelAndView();
		try
		{
		List<Student> lst = new ArrayList<Student>();
		Student vs = new Student();
		lst=vs.getStudentReport(ses.getAttribute("userid").toString().trim());
		
		mv.addObject("std",lst);
		}
		catch (Exception e) {
		System.out.println("errr in edit="+e.getMessage());
		}
		mv.setViewName("EditProfileStud.jsp");
		return mv;
	}
	@RequestMapping("/editProfile1")
	@SessionScope
	public ModelAndView editProfile1(HttpSession ses) {
		
		List<Staff> lst = new ArrayList<Staff>();
		Staff vs = new Staff();
		lst=vs.getStaff(ses.getAttribute("userid").toString().trim());
		ModelAndView mv=new ModelAndView();
		mv.addObject("std",lst);
		mv.setViewName("EditProfileStaff.jsp");
		return mv;
	}
	@RequestMapping("/approvestudentlist")
	@SessionScope
	public ModelAndView approvestudentlist(HttpSession ses) {
		
		List<Student> lst = new ArrayList<Student>();
		Student vls= new Student();
		
		lst=vls.getPendingRegistrations();
		System.out.println("lst="+lst.size());
		ModelAndView mv=new ModelAndView();
		mv.addObject("stal",lst);
		mv.setViewName("UpdateStudentStatus.jsp");
		return mv;
	
	}
	@RequestMapping("/check")
	public String check(CheckUser cu,HttpServletRequest request) {
		String st="";
		try
		{
			System.out.println(""+cu.getUserid()+" "+cu.getPswd());
		st=cu.checkUser(request);
		}
		catch (Exception e) {
			System.out.println("err="+e.getMessage());
			// TODO: handle exception
			st="index.jsp";
		}
		return st;
	}
	
	@RequestMapping("/registerstaff")
	@SessionScope
	public String registerstaff()
	{
		return "RegisterStaff.jsp";
	}
	@RequestMapping("/registerBA")
	@SessionScope
	public String registerBA()
	{
		return "RegisterSubadmin.jsp";
	}
	@RequestMapping("/viewBA")
	@SessionScope
	public ModelAndView viewBA() {
		List<ViewStaff> lst=new ArrayList<ViewStaff>();
		ViewStaff vs = new ViewStaff();
		lst=vs.getBA();
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		mv.setViewName("ViewStaffReport1.jsp");
		return mv;
	}
	 
	@RequestMapping("/viewstaff")
	@SessionScope
	public ModelAndView viewstaff(HttpSession ses) {
		List<ViewStaff> lst=new ArrayList<ViewStaff>();
		ViewStaff vs = new ViewStaff();
		lst=vs.getStaff1(ses.getAttribute("branch").toString().trim());
		ModelAndView mv=new ModelAndView();
		mv.addObject("stf",lst);
		System.out.println("lst="+lst.size());
		mv.setViewName("ViewStaffReport.jsp");
		return mv;
	}
	 
	@RequestMapping("/uploadDocs")
	public ModelAndView uploadDocs(HttpSession ses,HttpServletRequest request)
	{ModelAndView mv=new ModelAndView();
		try {
		mv.addObject("sessTitle",request.getParameter("sessTitle").toString().trim());
		mv.addObject("topic",request.getParameter("topic").toString().trim());
		mv.addObject("sessId",request.getParameter("sessId").toString().trim());
		mv.addObject("topicId",request.getParameter("topicId").toString().trim());
		mv.setViewName("UploadDoc.jsp");
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("err in upd="+e.getMessage());
		}
		return mv;
		 
	}
	@RequestMapping("/ViewDocs")
	public ModelAndView viewDocs(HttpSession ses,HttpServletRequest request)
	{
		
		List<Documents> lst = new ArrayList<Documents>();
		Documents obj=new Documents();
		//obj.setSessId(Integer.parseInt(request.getParameter("sessId").toString().trim()));
		obj.setSem(request.getParameter("sem").toString().trim());
		obj.setBranch(request.getParameter("branch").toString().trim());
		obj.setSub(request.getParameter("sub").toString().trim());
		obj.getDocs1(ses.getAttribute("userid").toString().trim());
		 lst=obj.getLstdocs();
System.out.println("lstsize="+lst.size());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewDocs.jsp");
		 		
		mv.addObject("lst", lst); 
		return mv;
		 
	}
	@RequestMapping("/viewDocs1")
	public ModelAndView viewDocs1(HttpSession ses,HttpServletRequest request)
	{
		
		List<Documents> lst = new ArrayList<Documents>();
		Documents obj=new Documents();
		obj.setSem(request.getParameter("sem").toString().trim());
		obj.setBranch(request.getParameter("branch").toString().trim());
		obj.setSub(request.getParameter("sub").toString().trim());
		 obj.getDocs();
		 lst=obj.getLstdocs();
System.out.println("lstsize="+lst.size());
		ModelAndView mv = new ModelAndView();

		mv.setViewName("viewDocs.jsp");
		mv.addObject("lst", lst); 
		return mv;
		 
	}
	@SessionScope
	@RequestMapping("/RegDocs")
	public ModelAndView RegDocs(Documents eobj,ServletRequest request,HttpSession ses)
	{
		ModelAndView mv=new ModelAndView();
		 
		 try
		 {MultipartFile file=eobj.getFile();
		 String filepath=request.getServletContext().getRealPath("/")+"/LearningContent/";
		  
		 System.out.println("path="+filepath+" "+eobj.getBranch());
		 File f=new File(filepath);
		 f.mkdir();
		 f=new File(filepath);
		 f.mkdir();
		 try {
			 eobj.getId();
			 int mx=eobj.getDocId();
			 String fileName=mx+"."+ file.getOriginalFilename().split("\\.")[1];
			 file.transferTo(new File(filepath+"/"+fileName));
			  
			 eobj.setDocpath(fileName);
			 eobj.setUserid(ses.getAttribute("userid").toString().trim());
			 if(eobj.registration() )
			 { 
				mv.setViewName("Success.jsp");
				mv.addObject("activity","DocumentReg");
			 }
			 else
			 { 
				 mv.setViewName("Failure.jsp?type=DocumentReg");
				 mv.addObject("activity","DocumentReg");
			 }
			 } catch (IOException e) {
				 
			 }
		 
			 
		// mv.setViewName("Success.jsp?type=DocumentReg");
		 }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("err="+e.getMessage());
			 mv.setViewName("Failure.jsp?type=DocumentReg");
		}
		 return mv;
	}
	 
}

