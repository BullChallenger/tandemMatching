<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userlist.userDAO" %>
<%@ page import="userlist.userDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8");

	String userId = null; 
	String userPW = null;
	
	if(request.getParameter("userId") != null) {
		userId = request.getParameter("userId");
	}
	
	if(request.getParameter("userPW") != null) {
		userPW = request.getParameter("userPW");
	}
	
	
	if(userId == null || userId.equals("")
			|| userPW == null || userPW.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('A blank space is exists. Please fill in the blank.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	userDAO userDao = new userDAO();
	int result = userDao.login(userId, userPW);
	
	
	if(result == -1) { // 아이디가 존재하지 않을 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('This ID doesn't exist.');");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	} else if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Password don't match.');");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} else if(result == 1) {
		session.setAttribute("userId", userId);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Login success!');");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	} else if(result == 2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB Error has occured!');");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	
	
%>