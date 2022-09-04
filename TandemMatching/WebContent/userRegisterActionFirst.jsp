<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userlist.userDAO" %>
<%@ page import="userlist.userDTO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 1 page
	String userId = null; 
	String userEmail = null;
	String userPW = null;
	String userPwChecked = null;
	String userNationality = null;
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("./userRegisterAction.jsp");
	
	String[] firstParam = { "userId", "userEmail", "userPW", "userPwChecked", "userNationality" };
	String[] firstRegCheck = { userId, userEmail, userPW, userPwChecked, userNationality };
	
	for (int i = 0; i < firstParam.length; i++) {
		if(request.getParameter(firstParam[i]) != null) {
			firstRegCheck[i] = request.getParameter(firstParam[i]);
			request.setAttribute(firstParam[i], new String(firstRegCheck[i]));
		}
		
		if(firstRegCheck[i] == null || firstRegCheck[i].equals("")) {
			PrintWriter firstRegScript = response.getWriter();
			firstRegScript.println("<script>");
			firstRegScript.println("alert('A blank space is exists. Please fill in the blank.')");
			firstRegScript.println("history.back()");
			firstRegScript.println("</script>");
			firstRegScript.close();
			return;
		}
	}
	
	
	if(!firstRegCheck[2].equals(firstRegCheck[3])) {
		PrintWriter firstRegScript = response.getWriter();
		firstRegScript.println("<script>");
		firstRegScript.println("alert('Password Check is wrong.')");
		firstRegScript.println("history.back()");
		firstRegScript.println("</script>");
		firstRegScript.close();
		return;
	}
	
	dispatcher.forward(request, response); // 실행되면 바로 emailSendAction.jsp로 넘어가버림 
	
%>