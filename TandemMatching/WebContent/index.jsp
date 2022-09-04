<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "userlist.userDTO" %>
<%@ page import = "userlist.userDAO" %>
<%@ page import = "util.SHA256" %>
<%@ page import = "java.io.PrintWriter" %>

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
	<%
		String userId = null;
		if(session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		
	%>

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
								<h1>Project : Tandem Matching</h1>
								<p>We made this website for BUFS students.<br> 
								   We hope our website can help your Study and your Friendship with your Friends</p>
							</div>
						</div>
						<nav>
							<ul>
								<li><a href="#intro">Intro</a></li>
								<li><a href="#about">About</a></li>
								<!-- <li><a href="#work">Work</a></li> -->
						<%
							if(userId == null) {
						%>
								<li><a href="#login">LogIn</a></li>
								<li><a href="#register">Register</a></li> <!-- Login 하면 안 보이게 만들기-->
						<%
							} else {
						%>
								<li><a href="./userLogout.jsp">LogOut</a></li> <!-- Login 해야 볼 수 있게 만들기-->
								<li><a href="#profil">Profil</a></li> <!-- Login 해야 볼 수 있게 만들기-->
						<%
							}
						%>
								<!-- <li><a href="#contact">Contact</a></li> --> <!-- report 구현할 때 쓸 가능성 있음 -->
								<li><a href="#elements">Elements</a></li>
								<li><a href="./ReviewBoard.jsp">Review</a></li>
							</ul>
						</nav>
					</header>

				<!-- Main -->
					<div id="main">

						<!-- Intro -->
							<article id="intro">
								<h2 class="major">Intro</h2>
								<span class="image main"><img src="images/pic01.jpg" alt="" /></span>
								<p>이 웹사이트는 외성 창업동아리 활동의 일환으로 제작되었으며, 외국인 유학생과의 교류 및 외국어 학습 능력 향상을 목표로 제작된 사이트 입니다.</p>
								<p>현재까지 구현된 기능은 존재하지 않으면 아직 미완성인 웹사이트입니다. 참고바랍니다.</p>
							</article>

						<!-- About -->
							<article id="about">
								<h2 class="major">About</h2>
								<span class="image main"><img src="images/pic03.jpg" alt="" /></span>
								<p>이 웹사이트는 외성 창업동아리 활동의 일환으로 제작되었으며, 외국인 유학생과의 교류 및 외국어 학습 능력 향상을 목표로 제작된 사이트 입니다.</p>
								<p>현재까지 구현된 기능은 존재하지 않으면 아직 미완성인 웹사이트입니다. 참고바랍니다.</p>
							</article>

						<!-- LogIn -->
							<article id="login">
								<h2 class="login">Login</h2>
								<span class="image main"><img src="images/pic03.jpg" alt="" /></span>
								<form method="post" action="./userLoginAction.jsp" autocomplete="off">
									<div class="fields">
										<div class="field">
											<label for="demo-name">ID</label>
											<input type="text" name="userId"/>
										</div>
										<div class="field">
											<label for="demo-password">Password</label>
											<input type="password" name="userPW"/>
										</div>
										<div class="field">
											<div class="usingbtn">
												<input type="submit" value="Login">
											</div>
										</div>
									</div>
								</form>
							</article>
							
						<!-- Profil -->
							<article id="profil">
								<h2 class="profil">Profil</h2>
								<form method="post" action="#" autocomplete="off">
									<div class="fields">
										<div class="field">
										<div id="profilupload" style="background-color:#ffffff;"></div>
										<input type="file" class="real-upload" accept="image/*" required multiple style="display: none;">
										<div class="field">
											<div class="usingbtn">
												<div id="uploadbtn" class="button small">Upload</div>
											</div>
										</div>
										<script>
											const realUpload = document.querySelector('.real-upload');
											const upload = document.querySelector('#uploadbtn');

											upload.addEventListener('click', () => realUpload.click());
										</script>
											<label for="demo-name">Name</label>
											<input type="text" name="demo-name" id="demo-name" value="" placeholder="" />
										</div>
										
										<div class="field third">
											<label for="demo-year">Year</label>
											<input type="text" name="demo-birth" id="demo-birth" value="" placeholder="YYYY"  maxlength="4" 
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
										</div>
										<div class="field third">
											<label for="demo-month">Month</label>									
											<select name="demo-month" id="demo-month">
												<option value="1">01</option>
												<option value="1">02</option>
												<option value="1">03</option>
												<option value="1">04</option>
												<option value="1">05</option>
												<option value="1">06</option>
												<option value="1">07</option>
												<option value="1">08</option>
												<option value="1">09</option>
												<option value="1">10</option>
												<option value="1">11</option>
												<option value="1">12</option>
											</select>
										</div>
										<div class="field third">
											<label for="demo-day">Day</label>
											<input type="text" name="demo-day" id="demo-day" value="" placeholder="DD"  maxlength="2" 
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
										</div>

										<div class="field">
											<label for="demo-hobby">Hobby</label>
											<input type="text" name="demo-hobby" id="demo-hobby" value="" placeholder="" />
										</div>

										<div class="field">
											<label for="demo-category">Language</label>
											<select name="demo-category" id="demo-category">
												<option value="">-</option>
												<option value="1">Korean</option>
												<option value="1">English</option>
												<option value="1">Japanese</option>
												<option value="1">Chinese</option>
												<option value="1">Vietnamese</option>
												<option value="1">French</option>
											</select>
										</div>

										<div class="field">
											<label for="demo-Introduce">Introduce</label>
											<textarea placeholder="" rows="6"></textarea>
										</div>

										<div class="field">
											<div class="usingbtn">
												<a href="#" class="button primary">Apply</a>
											</div>
										</div>
									</div>
								</form>
							</article>

						<!-- Register -->		
							<article id="register">
								<h2 class="register">Register</h2>
								<span class="image main"><img src="images/pic03.jpg" alt="" /></span>
								<form method="post" action="./userRegisterAction.jsp" autocomplete="off">
									<div class="fields">
										<div class="field half">
											<label for="userId">ID</label>
											<input type="text" name="userId" placeholder="" />
										</div>
										
										<div class="field half">
											<label for="userEmail">Email</label>
											<input type="email" name="userEmail" placeholder="example@example.com" />
										</div>
										
										<div class="field">
											<label for="userPW">Password</label>
											<input type="password" name="userPW" placeholder="" />
										</div>

										<div class="field">
											<label for="userPwChecked">Password Check</label>
											<input type="password" name="userPwChecked" placeholder="" />
										</div>

										<div class="field">
											<label for="userNationality">Nationality</label>
											<select name="userNationality">
												<option value="Republic of Korea">Republic of Korea</option>
												<option value="Japan">Japan</option>
												<option value="China">China</option>
												<option value="Vietnam">Vietnam</option>
												<option value="USA">USA</option>
												<option value="France">France</option>
											</select>
										</div>
										
										<div class="field">
											<label for="userInstaAccount" class="icon brands fa-instagram">&nbsp;Instagram Account</label>
											<input type="text" name="userInstaAccount" id="userInstaAccount" class="form-control" />
										</div>

										<div class="field">
											<label for="userFbAccount" class="icon brands fa-facebook-f">&nbsp;Facebook Account</label>
											<input type="text" name="userFbAccount" id="userFbAccount" class="form-control" />
										</div>
										
										<div class="field half">
											<label for="userName">Name</label>
											<input type="text" name="userName" id="userName" class="form-control"/>
										</div>
										
										<div class="field half">
											<label for="userPhoneNum">Phone Number</label>
											<input type="text" name="userPhoneNum" id="userPhoneNum" maxLength="11" class="form-control"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
										</div>
										
										<div class="field">
											<label for="userLanguage">Language</label>
											<select name="userLanguage" id="userLanguage" class="form-control">
												<option value="">-</option>
												<option value="Korean">Korean</option>
												<option value="English">English</option>
												<option value="Japanese">Japanese</option>
												<option value="Chinese">Chinese</option>
												<option value="Vietnamese">Vietnamese</option>
												<option value="French">French</option>
											</select>
										</div>
										

										<div class="field">
											<div class="usingbtn">
												<input type="submit" value="Regist">
											</div>
										</div>
									</div>
								</form>
							</article>

							
							</article>

							
							
					
						<!-- Contact 
							<article id="contact">
								<h2 class="major">Contact</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<label for="name">Name</label>
											<input type="text" name="name" id="name" />
										</div>
										<div class="field half">
											<label for="email">Email</label>
											<input type="text" name="email" id="email" />
										</div>
										<div class="field">
											<label for="message">Message</label>
											<textarea name="message" id="message" rows="4"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send Message" class="primary" /></li>
										<li><input type="reset" value="Reset" /></li>
									</ul>
								</form>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
								</ul>
							</article>
						-->

						<!-- Elements -->
							<article id="elements">
								<h2 class="major">Elements</h2>

								<section>
									<h3 class="major">Text</h3>
									<p>This is <b>bold</b> and this is <strong>strong</strong>. This is <i>italic</i> and this is <em>emphasized</em>.
									This is <sup>superscript</sup> text and this is <sub>subscript</sub> text.
									This is <u>underlined</u> and this is code: <code>for (;;) { ... }</code>. Finally, <a href="#">this is a link</a>.</p>
									<hr />
									<h2>Heading Level 2</h2>
									<h3>Heading Level 3</h3>
									<h4>Heading Level 4</h4>
									<h5>Heading Level 5</h5>
									<h6>Heading Level 6</h6>
									<hr />
									<h4>Blockquote</h4>
									<blockquote>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan faucibus. Vestibulum ante ipsum primis in faucibus lorem ipsum dolor sit amet nullam adipiscing eu felis.</blockquote>
									<h4>Preformatted</h4>
									<pre><code>i = 0;

while (!deck.isInOrder()) {
    print 'Iteration ' + i;
    deck.shuffle();
    i++;
}

print 'It took ' + i + ' iterations to sort the deck.';</code></pre>
								</section>

								<!--미구현 기능-->

								<section>
									<h3 class="major">Lists</h3>

									<h4>Unordered</h4>
									<ul>
										<li>Dolor pulvinar etiam.</li>
										<li>Sagittis adipiscing.</li>
										<li>Felis enim feugiat.</li>
									</ul>

									<h4>Alternate</h4>
									<ul class="alt">
										<li>Dolor pulvinar etiam.</li>
										<li>Sagittis adipiscing.</li>
										<li>Felis enim feugiat.</li>
									</ul>

									<h4>Ordered</h4>
									<ol>
										<li>Dolor pulvinar etiam.</li>
										<li>Etiam vel felis viverra.</li>
										<li>Felis enim feugiat.</li>
										<li>Dolor pulvinar etiam.</li>
										<li>Etiam vel felis lorem.</li>
										<li>Felis enim et feugiat.</li>
									</ol>
									<h4>Icons</h4>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
									</ul>

									<h4>Actions</h4>
									<ul class="actions">
										<li><a href="#" class="button primary">Default</a></li>
										<li><a href="#" class="button">Default</a></li>
									</ul>
									<ul class="actions stacked">
										<li><a href="#" class="button primary">Default</a></li>
										<li><a href="#" class="button">Default</a></li>
									</ul>
								</section>

								<section>
									<h3 class="major">Table</h3>
									<h4>Default</h4>
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th>Name</th>
													<th>Description</th>
													<th>Price</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Item One</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Two</td>
													<td>Vis ac commodo adipiscing arcu aliquet.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Three</td>
													<td> Morbi faucibus arcu accumsan lorem.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Four</td>
													<td>Vitae integer tempus condimentum.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Five</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td>100.00</td>
												</tr>
											</tfoot>
										</table>
									</div>

									<h4>Alternate</h4>
									<div class="table-wrapper">
										<table class="alt">
											<thead>
												<tr>
													<th>Name</th>
													<th>Description</th>
													<th>Price</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Item One</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Two</td>
													<td>Vis ac commodo adipiscing arcu aliquet.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Three</td>
													<td> Morbi faucibus arcu accumsan lorem.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Four</td>
													<td>Vitae integer tempus condimentum.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Five</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td>100.00</td>
												</tr>
											</tfoot>
										</table>
									</div>
								</section>

								<section>
									<h3 class="major">Buttons</h3>
									<ul class="actions">
										<li><a href="#" class="button primary">Primary</a></li>
										<li><a href="#" class="button">Default</a></li>
									</ul>
									<ul class="actions">
										<li><a href="#" class="button">Default</a></li>
										<li><a href="#" class="button small">Small</a></li>
									</ul>
									<ul class="actions">
										<li><a href="#" class="button primary icon solid fa-download">Icon</a></li>
										<li><a href="#" class="button icon solid fa-download">Icon</a></li>
									</ul>
									<ul class="actions">
										<li><span class="button primary disabled">Disabled</span></li>
										<li><span class="button disabled">Disabled</span></li>
									</ul>
								</section>

								<section>
									<h3 class="major">Form</h3>
									<form method="post" action="#">
										<div class="fields">
											<div class="field half">
												<label for="demo-name">Name</label>
												<input type="text" name="demo-name" id="demo-name" value="" placeholder="Jane Doe" />
											</div>
											<div class="field half">
												<label for="demo-email">Email</label>
												<input type="email" name="demo-email" id="demo-email" value="" placeholder="jane@untitled.tld" />
											</div>
											<div class="field">
												<label for="demo-category">Category</label>
												<select name="demo-category" id="demo-category">
													<option value="">-</option>
													<option value="1">Manufacturing</option>
													<option value="1">Shipping</option>
													<option value="1">Administration</option>
													<option value="1">Human Resources</option>
												</select>
											</div>
											<div class="field half">
												<input type="radio" id="demo-priority-low" name="demo-priority" checked>
												<label for="demo-priority-low">Low</label>
											</div>
											<div class="field half">
												<input type="radio" id="demo-priority-high" name="demo-priority">
												<label for="demo-priority-high">High</label>
											</div>
											<div class="field half">
												<input type="checkbox" id="demo-copy" name="demo-copy">
												<label for="demo-copy">Email me a copy</label>
											</div>
											<div class="field half">
												<input type="checkbox" id="demo-human" name="demo-human" checked>
												<label for="demo-human">Not a robot</label>
											</div>
											<div class="field">
												<label for="demo-message">Message</label>
												<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
											</div>
										</div>
										<ul class="actions">
											<li><input type="submit" value="Send Message" class="primary" /></li>
											<li><input type="reset" value="Reset" /></li>
										</ul>
									</form>
								</section>

							</article>

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
