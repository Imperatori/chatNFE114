<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="test.models.*"%>
<%
	User user = (User) request.getSession().getAttribute("user");
	String author = "unknown";
	if (user == null) {
		System.out.println("no session");
		response.sendRedirect("login");
	} else {
		System.out.println("session found ");
		author = user.getPseudo();
	}
%>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Chat</title>
<meta charset="UTF-8">
<link href="./assets/css/bootstrap.min.css" rel="stylesheet">
<link href="./assets/css/styles.css" rel="stylesheet">
</head>
<body class="grey lighten-5">
	<div class="container text-center">
		<h3>
			Oh, Hi
			<%=author%>
			!
		</h3>
		<hr>
		<div id="info">
			<p id="info_start">Click on the microphone icon and begin
				speaking.</p>
			<p id="info_speak_now">Speak now.</p>
			<p id="info_no_speech">
				No speech was detected. You may need to adjust your <a
					href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
					microphone settings</a>.
			</p>
			<p id="info_no_microphone" style="display: none">
				No microphone was found. Ensure that a microphone is installed and
				that <a
					href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
					microphone settings</a> are configured correctly.
			</p>
			<p id="info_allow">Click the "Allow" button above to enable your
				microphone.</p>
			<p id="info_denied">Permission to use microphone was denied.</p>
			<p id="info_blocked">Permission to use microphone is blocked. To
				change, go to chrome://settings/contentExceptions#media-stream</p>
			<p id="info_upgrade">
				Web Speech API is not supported by this browser. Upgrade to <a
					href="//www.google.com/chrome">Chrome</a> version 25 or later.
			</p>
		</div>


		<div class="row">
			<div class="text-center col-md-6 col-md-offset-3 chat-panel">

				<div id="chat" class="chat"></div>

				<div class="right">
					<button id="start_button" onclick="startButton(event)">
						<img id="start_img" src="assets/img/mic.gif" alt="Start">
					</button>
				</div>
				<div id="results">
					<span id="final_span" class="final"></span> <span id="interim_span"
						class="interim"></span>
					<textarea data-author="<%=author%>" id="message"
						class="form-control" name="message" placeholder="..."></textarea>
				</div>
				<br>

				<button class="btn btn-primary btn-block btn-lg" id="submit"
					name="submit">Send</button>

				<div class="center">
					<p>
					<div id="div_language">
						<select id="select_language" onchange="updateCountry()"></select>
						&nbsp;&nbsp; <select id="select_dialect"></select>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="./assets/js/jquery.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/app.js"></script>
	<script src="./assets/js/speech.js"></script>
</body>
</html>