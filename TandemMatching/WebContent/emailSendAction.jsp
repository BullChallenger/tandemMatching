<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="userlist.userDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="util.Gmail" %>
<%@ page import="java.io.PrintWriter" %>

<%
	userDAO userDao = new userDAO();
	String userId = null;
	if(session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	
	if(userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('You have to login to use this page.');");
		script.println("location.href = './index.jsp#';");
		script.println("</script>");
		script.close();
		return;
	}
	
	boolean userEmailChecked = userDao.getUserEmailChecked(userId);
	if(userEmailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Your email already checked.');");
		script.println("location.href = './index.jsp#';");
		script.println("</script>");
		script.close();
		return;
	}
	
	String host = "http://localhost:8081/TandemMatching/";
	String from = "2GatherTandem@gmail.com";
	String to = userDao.getUserEmail(userId);
	String subject = "Email authentication for Tandem Matching.";
	String content = "Access this link to verify your email." + "<br> " + 
 				"<a href ='" + host + "emailCheckAction.jsp?code=" + SHA256.getSHA256(to) + "'>Verify your email</a>";
	
	Properties p = new Properties();
	p.put("mail.smtp.starttls.required", "true");
	p.put("mail.smtp.ssl.protocols", "TLSv1.2");
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	
	try {
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html; charset=UTF-8");
		Transport.send(msg);
	} catch (Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Some Error Occured!');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}

%>

<!DOCTYPE HTML>
<!--
	Dimension by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Project : Tandem</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">	
						<div class="content">
							<div class="inner">
								<!-- School Logo -->
				
								<div id = "bufslogo">
									<span class="bufslogo"><img src="images/bufslogo.jpg" alt="" /></span>
								</div>
								<h1>The Email has been sent successfully.</h1>
								<p>Please check your email.</p>
							</div>
						</div>
					</header>

				<!-- Main -->
					<div id="main">
					</div>

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Made by 승빈 & @ajlkn. Team : 2gather. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
					</footer>

			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
