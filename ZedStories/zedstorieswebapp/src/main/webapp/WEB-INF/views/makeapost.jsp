<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>make a post</title>
<!-- boostrap css link -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<!-- External CSS -->
<!-- External CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animations.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/makeapost.css">

<!-- favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/favicon/favicon-16x16.png">
<link rel="manifest"
	href="${pageContext.request.contextPath}/favicon/site.webmanifest">


<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- fonts icons start-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<script src="https://kit.fontawesome.com/018d9ba538.js"
	crossorigin="anonymous"></script>
</head>

<style>
.share_withUs {
	display: block;
	text-align: left;
	padding: 5px 8px;
	font-size: 1rem !important;
}
/* Popup container styles */
</style>

<script>
	$(document).ready(function() {
		$('#category').change(function() {
			var category = $(this).val();
			$('.category-form').hide();
			$('#' + category + '-form').show();
		});
	});
</script>


<body class="bg-body-tertiary">


	<div class="zed_sotories_holder mb-2">
		<header class="header_holder">
			<!-- navbar -->
			<nav class="navbar navbar-expand-md bg-body-tertiary">
				<div class="container-fluid pe-2 ps-2">
					<a class="navbar-brand logo_name"
						href="${pageContext.request.contextPath}/index"> <span
						class="logo_surname initial_logo_name">Zed</span><span
						class="logo_surname text-primary">Stories</span>
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse navbar_lists"
						id="navbarSupportedContent">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/index">Home</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/confessions">Confessions</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/lifestyle">Lifestyle</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/partner">Partner</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/makeapost">Post</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/zedstorieswebapp/counsel.jsp">Counsel</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/zedstorieswebapp/about.jsp"> About </a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>

		<section class="body_holder">
			<!-- home section  landing page-->
			<div
				class="container-fluid text-center mb-2 body_sections landing_page card ">
				<div class="row d-flex mb-2 ">
					<!-- home landing page poster -->
					<!-- home landing page poster -->
					<div
						class="col-12 main_home_poster  text-bg-dark p-0 poster mb-2 mb-md-0 orther_pages_landing">
						<div class=" text-bg-dark  ">

							<img
								src="${pageContext.request.contextPath}/images/makeapostlangindpage.jpg"
								class="card-img img-fluid" alt="...">
							<div class="card-img-overlay testing ">
								<h5 class="card-title text-center">Make an anonymous post</h5>
							</div>
						</div>
					</div>
					<!-- aside home landing page -->
				</div>

				<div class="row mb-2">
					<div class="col-12 add_bg">
						<marquee behavior="" direction="">
							<!-- Advertise your businesses 0974286888 -->
						</marquee>
					</div>
				</div>
			</div>

			<!-- second home section -->

			<!-- about from here -->
			<div class="row killer ">
				<div class="col-12 col-md-8 px-0 mb-3 posting_cate">
					<div class="d-flex p-2 main_color text-white mb-2 section_tittles">Create
						a Post zedStories</div>
					<div class="accordion border card p-2" id="accordionExample">
						<!-- inserting new div here -->
						<form action="makeapost" method="post"
							enctype="multipart/form-data">
							<div class="category_selecting">
								<label for="category">Select Category:</label> <select
									id="category" name="category">
									<option value="">--Select Category--</option>
									<option value="confessions">Confessions</option>
									<option value="partner">Partner</option>
									<option value="lifestyle">Lifestyle</option>
								</select>
							</div>

							<div class="catergories">

								<!-- Partner Form -->
								<div id="partner-form" class="category-form "
									style="display: none;">
									<h2 class="category_tittle">Find a Partner</h2>
									<div>
										<label for="partner-title">Looking for?:</label> <input
											type="text" id="partner-title" name="partner-title">
									</div>
									<div>
										<label for="partner-author">Nickname(or names):</label> <input
											type="text" id="partner-author" name="partner-author">
									</div>
									<div>
										<label for="partner-location">Where youre based:</label> <input
											type="text" id="partner-location" name="partner-location">
									</div>
									<div>
										<label for="partner-text">Description:</label>
										<textarea id="partner-text" name="partner-text"></textarea>
									</div>

									<div>
										<label for="partner-image">Your Image (optional):</label> <input
											type="file" id="partner-image" name="partner-image">
									</div>

								</div>

								<!-- Confessions Form -->
								<div id="confessions-form" class="category-form "
									style="display: none;">
									<h2 class="category_tittle">Confess About Something</h2>
									<div>
										<label for="confessions-title">Title:</label> <input
											type="text" id="confessions-title" name="confessions-title">
									</div>
									<div>
										<label for="confessions-author">Nickname:</label> <input
											type="text" id="confessions-author" name="confessions-author">
									</div>
									<div>
										<label for="confessions-location">Posting from:</label> <input
											type="text" id="confessions-location"
											name="confessions-location">
									</div>
									<div>
										<label for="confessions-text">Confession Text:</label>
										<textarea id="confessions-text" name="confessions-text"></textarea>
									</div>

									<div>
										<label for="confession-image">Image (optional):</label> <input
											type="file" id="confession-image" name="confession-image">
									</div>

								</div>



								<!-- Lifestyle Form -->
								<div id="lifestyle-form" class="category-form"
									style="display: block;">
									<h2 class="category_tittle">Tell us a Lifestyle Story</h2>
									<div>
										<label for="lifestyle-title">Title:</label> <input type="text"
											id="lifestyle-title" name="lifestyle-title">
									</div>
									<div>
										<label for="lifestyle-author">Nicnkame/Names:</label> <input
											type="text" id="lifestyle-author" name="lifestyle-author">
									</div>
									<div>
										<label for="lifestyle-location">Location:</label> <input
											type="text" id="lifestyle-location" name="lifestyle-location">
									</div>
									<div>
										<label for="lifestyle-text">Lifestyle Story Text:</label>
										<textarea id="lifestyle-text" name="lifestyle-text"></textarea>
									</div>
									<div>
										<label for="lifestyle-image">Image:(optional)</label> <input
											type="file" id="lifestyle-image" name="lifestyle-image">
									</div>
								</div>

								<div>
									<button type="submit">Submit</button>
								</div>

							</div>
						</form>

						<!-- inserting ends -->

					</div>
				</div>


				<div class="col-12 col-md-4 advertisements">
					<div class="container-fluid text-center m-0 p-0 ps-md-1">
						<div class="row">
							<div class="col-12 mb-1 section_tittles">Hello there</div>
							<div class="col-12  add_poster card p-0">
								<!-- col-14 -->

								<!-- <div class="card"> -->
								<!--    <div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="./images/one.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./images/two.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./images/one.jpg" class="d-block w-100" alt="...">
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button"
                                        data-bs-target="#carouselExampleRide" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button"
                                        data-bs-target="#carouselExampleRide" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
 -->

								<div class="card-body p-0">
									<small class="text-left share_withUs"> Share
										confessions anonymously 💬, seek partners 💑, and discuss
										various lifestyle-related topics 🌟 <br>From heartfelt
										revelations ❤️ to finding companionship and exploring life's
										intricacies 🌍, ZedStories offers a space for genuine
										connections and meaningful conversations 💬💖. <a href="#">Share
											with us</a>
									</small>


								</div>
								<!-- </div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- about from here -->
		</section>
	</div>



	<!-- footer -->
	<footer class="footer body_sections">

		<div class="footer_wrapper">
			<div class="first">
				<div class="logo">
					<h1 class="doc_logo">
						<!-- Dr.<span id="special">Fiero</span> -->
						<a class="navbar-brand logo_name"
							href="${pageContext.request.contextPath}/index"> <span
							class="logo_surname initial_logo_name">Zed</span><span
							class="logo_surname text-primary">Stories</span>
						</a>
					</h1>
					<p>Anonymously write confessions, find a partner, and encourage
						someone about life.</p>
				</div>

				<div class="have_questions">
					<h3>Have Questions?</h3>
					<ul>

						<li><i class="fa-solid fa-phone"></i> +260 974286888</li>
						<li><i class="fa-brands fa-whatsapp"></i> <a
							href="https://wa.me/message/WSQ463DN4ZDRK1" target="_blank">Whatsapp
						</a></li>
						<li><i class="fa-solid fa-globe"></i> <a
							href="https://www.michaelsinkamba.com">michaelsinkamba.com</a></li>
					</ul>
				</div>


			</div>

			<div class="second">
				<div class="links">
					<h3>Links</h3>
					<ul>
						<li><a href="${pageContext.request.contextPath}/index"> <i
								class="fa-solid fa-arrow-right"></i> Home
						</a></li>
						<li><a href="${pageContext.request.contextPath}/about"> <i
								class="fa-solid fa-arrow-right"></i> About
						</a></li>
						<li><a href="${pageContext.request.contextPath}/confessions">
								<i class="fa-solid fa-arrow-right"></i> Confessions
						</a></li>
						<li><a href="${pageContext.request.contextPath}/lifestyle">
								<i class="fa-solid fa-arrow-right"></i> Lifestyle
						</a></li>
						<li><a href="${pageContext.request.contextPath}/findapartner">
								<i class="fa-solid fa-arrow-right"></i> Partner
						</a></li>
						<li><a href="/zedstorieswebapp/counsel.jsp"> <i
								class="fa-solid fa-arrow-right"></i> Counsel
						</a></li>
						<li><a href="/zedstorieswebapp/about.jsp"> <i
								class="fa-solid fa-arrow-right"></i> About
						</a></li>
					</ul>

				</div>
			</div>


			<div class="fourth">
				<div class="sumary_services">
					<h3>Services</h3>
					<ul>
						<li><a href="#"> <i class="fa-solid fa-arrow-right"></i>Get
								Help
						</a>
							<p>Anonymously get advice from experienced Counsellor on
								relationships, lifestyle, and managing life's challenges.</p></li>
						<li><a href="#"> <i class="fa-solid fa-arrow-right"></i>Advertise
						</a>
							<p>Advertise with ZedStories</p></li>
					</ul>
				</div>
				<div class="subscribe makepost_footer">
					<form action="#" method="post">
						<input type="email" name="email" id="email"
							placeholder="Enter email address" required>
						<button>Subscribe for notifications</button>
					</form>
				</div>
			</div>
		</div>

		<div class="all_rights">

			<p class="desktop_view">Copyright ©2024 All rights reserved
			<p id="tab_break">| This template is developed By |
			<p class="phone_break">Fiero Technologies</p>
			</p>
			</p>

		</div>
	</footer>

	<%--  <c:if test="${not empty successMessage}">
    <script>
        alert('${successMessage}');
    </script>
</c:if>
  --%>
	<c:if test="${not empty successMessage}">
		<script>
			var successMessage = '${successMessage}';
			// Function to create and display the pop-up
			function showAlert(message) {
				// Create a new div element for the alert box
				var alertBox = document.createElement('div');
				alertBox.className = 'alert-box'; // Apply CSS class for styling

				// Create a span for the mark icon with animation
				var markIcon = document.createElement('span');
				markIcon.className = 'mark-icon';
				markIcon.innerHTML = '&#10003;'; // Check mark symbol

				// Create a paragraph element for the message
				var messageParagraph = document.createElement('p');
				messageParagraph.textContent = message;
				alertBox.appendChild(markIcon); // Append mark icon to alert box
				alertBox.appendChild(messageParagraph); // Append message to alert box

				// Create OK button
				var okButton = document.createElement('button');
				okButton.textContent = 'OK';
				okButton.className = 'ok-btn';
				okButton.onclick = function() {
					removeAlert();
				};
				alertBox.appendChild(okButton); // Append OK button to alert box

				// Append the alert box to the body of the document
				document.body.appendChild(alertBox);

				// Function to remove the alert after clicking OK
				function removeAlert() {
					document.body.removeChild(alertBox);
				}

				// Function to animate the mark icon
				function animateMark() {
					markIcon.style.animation = 'markAnimation 1s ease-in-out';
				}

				// Call animateMark function to start the animation
				animateMark();

				// Close the alert box after 5 seconds if not clicked
				setTimeout(removeAlert, 3000);
			}

			// Call showAlert function with the successMessage
			showAlert(successMessage);
		</script>
	</c:if>

	<style>
/* CSS for the alert box */
.alert-box {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	border: 1px solid #ccc;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	z-index: 1000;
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 220px;
	width: 220px;
	border-radius: 50%;
}

.mark-icon {
	font-size: 40px;
	margin-bottom: 7px;
	color: #4390f5; /* Green color for success */
}

.ok-btn {
	padding: 5px 10px;
	background-color: #27ae60; /* Green color for button */
	color: #fff;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-top: 15px;
	border-radius: 5px;
}

.ok-btn:hover {
	background-color: #1066d7; /* Darker shade of green on hover */
}

.alert-box p {
	margin: 0;
}

/* Keyframes for markIcon animation */
@
keyframes markAnimation { 0% {
	transform: scale(0);
}
50


%
{
transform


:


scale
(


1
.2


)
;


}
100


%
{
transform


:


scale
(


1


)
;


}
}
</style>



	<!-- external js sheet -->
	<!-- External JS -->
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/js/animate.js"></script>


	<!-- Bootstrap JS Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>

</html>