<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userlist.userDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");

	String code = null; 
	if(request.getParameter("code") != null) {
		code = request.getParameter("code");
	}
	userDAO userDao = new userDAO();
	String userId = null;
	
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please Login')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	String userEmail = userDao.getUserEmail(userId);
	boolean isRight = SHA256.getSHA256(userEmail).equals(code) ? true : false;
	
	System.out.println(isRight);
	
	if(isRight == true) {
		userDao.setUserEmailChecked(userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Authentication succeeded')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Invalid code')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>