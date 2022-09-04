<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userlist.userDAO" %>
<%@ page import="userlist.userDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");

	String userId = null; 
	String userEmail = null;
	String userPW = null;
	String userPwChecked = null;
	String userNationality = null; 
	String userInstaAccount = null;
	String userFbAccount = null;
	String userName = null;
	String userPhoneNum = null;
	String userLanguage = null;
	
	if(request.getParameter("userId") != null) {
		userId = request.getParameter("userId");
	}
	
	if(request.getParameter("userEmail") != null) {
		userEmail = request.getParameter("userEmail");
	}
	
	if(request.getParameter("userPW") != null) {
		userPW = request.getParameter("userPW");
	}
	
	if(request.getParameter("userPwChecked") != null) {
		userPwChecked = request.getParameter("userPwChecked");
	}
	
	if(request.getParameter("userNationality") != null) {
		userNationality = request.getParameter("userNationality");
	}
	
	if(request.getParameter("userInstaAccount") != null) {
		userInstaAccount = request.getParameter("userInstaAccount");
	}
	
	if(request.getParameter("userFbAccount") != null) {
		userFbAccount = request.getParameter("userFbAccount");
	}
	
	if(request.getParameter("userName") != null) {
		userName = request.getParameter("userName");
	}
	
	if(request.getParameter("userPhoneNum") != null) {
		userPhoneNum = request.getParameter("userPhoneNum");
	}
	
	if(request.getParameter("userLanguage") != null) {
		userLanguage = request.getParameter("userLanguage");
	}
	
	
	if(userId == null || userId.equals("") || userEmail == null || userEmail.equals("")
			|| userPW == null || userPW.equals("") || userPwChecked == null || userPwChecked.equals("")  
			|| userNationality == null || userNationality.equals("") || userName == null || userName.equals("")
			|| userPhoneNum == null || userPhoneNum.equals("") || userLanguage == null || userLanguage.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('A blank space is exists. Please fill in the blank.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}

	if(!userPW.equals(userPwChecked)) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Password Check is wrong.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	userDAO userDao = new userDAO();
	int result = userDao.join(new userDTO(userId, userPW, userEmail, 
			SHA256.getSHA256(userEmail), false, userNationality, 
			userInstaAccount, userFbAccount, userName, userPhoneNum, userLanguage));
	
	
	if(result == -1) { // 회원가입 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('This ID already exists.');");
		script.println("location.href = './#register';");
		script.println("</script>");
		script.close();
		return;
	} else {
		session.setAttribute("userId", userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = './emailSendAction.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	

	
%>