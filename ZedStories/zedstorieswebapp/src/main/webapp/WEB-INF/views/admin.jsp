<%@ page session="true"%>
<%
HttpSession currentSession = request.getSession(false);
if (currentSession == null || currentSession.getAttribute("admin") == null) {
	response.sendRedirect("adminLogin");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ZedStories Admin</title>
<!-- boostrap css link -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/favicon/favicon-16x16.png">
<link rel="manifest"
	href="${pageContext.request.contextPath}/favicon/site.webmanifest">


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animations.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">

<!-- fonts icons start-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<script src="https://kit.fontawesome.com/018d9ba538.js"
	crossorigin="anonymous"></script>
</head>

<style>
.limit_thi {
	height: 20px;
	border: 1px solid red
}

.img_admin img {
	width: 50px !important;
	margin: 0;
	max-height: 50px;
}

.img_admin td {
	padding: 5px 0 !important;
	text-align: center;
	max-width: 180px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.form_ads {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.set_max_height {
	max-height: 400px;
	overflow-x: scroll;
}

.table_rows img {
	height: 30px !important;
	width: 30px important;
	align-self: center;
}

.table_rows, .thead-dark tr {
	display: flex;
	width: 100%;
}

.table_rows td {
	place-items: center;
	align-items: center;
	align-self: center;
}

.set_max_height table td, .set_max_height th {
	width: 123.7px;
}

.set_max_height .first_id {
	width: 50px;
}

.set_max_height .actions_text {
	width: fit-content;
	width: 200px !important;
}

.set_max_height .actions {
	width: 100%;
	width: 200px !important;
}
</style>

<body class="bg-body-tertiary m-0">
	<div class="zed_sotories_holder">
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
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/adminLogout">Logout</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/aboutus">AboutUs</a>
							</li>

						</ul>
					</div>
				</div>
			</nav>
		</header>
		

		
	


		<section class="body_holder">
		
		
		
			<!-- admin panel section -->
			<div class="container mt-3">
				<div class="dropdown text-center mb-2">
					<button class="btn btn-primary dropdown-toggle text-center"
						type="button" id="manageDropdown" data-bs-toggle="dropdown"
						aria-expanded="false">Select What to manage</button>
					<ul class="dropdown-menu" aria-labelledby="manageDropdown">
						<li><a class="dropdown-item" href="#"
							onclick="toggleSection('manage_posts')">Manage Posts</a></li>
						<li><a class="dropdown-item" href="#"
							onclick="toggleSection('manage_ads')">Manage Ads</a></li>
					</ul>
				</div>

				<h1 class="text-center">
					<a class="navbar-brand logo_name" href="#"> <span
						class="logo_surname initial_logo_name">Zed</span><span
						class="logo_surname text-primary">Stories</span>
					</a> <a class="navbar-brand logo_name" href="#"> <span
						class="logo_surname initial_logo_name">Admin</span><span
						class="logo_surname text-primary">Panel</span>
					</a>
				</h1>

				<div id="manage_posts" class="mt-4 mb-4 border">

					<div class="border">
						<div class="container mt-4">

							



							<h2 class="mb-4">Confessions</h2>
							<div class="table-responsive set_max_height">
								<table class="table table-bordered table-striped table-hover">
									<thead class="thead-dark">
										<tr>
											<th class="first_id">ID</th>
											<th>Title</th>
											<th>Author</th>
											<th>Location</th>
											<th>Text</th>
											<th>Image</th>

											<th>Status</th>
											<th class="actions_text">Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="post" items="${confessions}">
											<tr class="table_rows">
												<td class="first_id">${post.id}</td>
												<td>${post.title}</td>
												<td>${post.author}</td>
												<td>${post.location}</td>
												<td>${post.text}</td>
												<td><img
													src="${pageContext.request.contextPath}/uploads/${post.image}"></td>
												<td>${post.status}</td>
												<td class="actions">
													<!-- Open edit modal on button click -->

													<button class="btn btn-primary btn-sm"
														onclick="window.open('${pageContext.request.contextPath}/edit?id=${post.id}', '_self')">Edit</button>

													<form action="admin" method="post" style="display: inline;">
														<input type="hidden" name="postId" value="${post.id}">
														<button type="submit" name="action" value="approve"
															class="btn btn-success btn-sm">Approve</button>
														<button type="submit" name="action" value="delete"
															class="btn btn-danger btn-sm">Delete</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							
							
							
							<h2 class="mb-4">Partners</h2>
							<div class="table-responsive set_max_height">
								<table class="table table-bordered table-striped table-hover">
									<thead class="thead-dark">
										<tr>
											<th class="first_id">ID</th>
											<th>Title</th>
											<th>Author</th>
											<th>Location</th>
											<th>Text</th>
											<th>Image</th>
											<th>Status</th>
											<th class="actions_text">Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="post" items="${partners}">
											<tr class="table_rows">
												<td class="first_id">${post.id}</td>
												<td>${post.title}</td>
												<td>${post.author}</td>
												<td>${post.location}</td>
												<td>${post.text}</td>
												<td><img
													src="${pageContext.request.contextPath}/uploads/${post.image}"></td>
												<td>${post.status}</td>
												<td class="actions">
													<button class="btn btn-primary btn-sm"
														onclick="window.open('${pageContext.request.contextPath}/edit?id=${post.id}', '_self')">Edit</button>
													<form action="admin" method="post" style="display: inline;">
														<input type="hidden" name="postId" value="${post.id}">
														<button type="submit" name="action" value="approve"
															class="btn btn-success btn-sm">Approve</button>
														<button type="submit" name="action" value="delete"
															class="btn btn-danger btn-sm">Delete</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- dublicating lifestyle to confession -->

							<!-- dublicating lifestyle to confession ends  -->
							<h2 class="mb-4">Lifestyle</h2>
							<div class="table-responsive set_max_height">
								<table class="table table-bordered table-striped table-hover">
									<thead class="thead-dark">
										<tr>
											<th class="first_id">ID</th>
											<th>Title</th>
											<th>Author</th>
											<th>Location</th>
											<th>Text</th>
											<th>Image</th>
											<th>Status</th>
											<th class="actions_text">Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="post" items="${lifestyles}">
											<tr class="table_rows">
												<td class="first_id">${post.id}</td>
												<td>${post.title}</td>
												<td>${post.author}</td>
												<td>${post.location}</td>
												<td>${post.text}</td>
												<%-- <td>${post.image}</td> --%>
												<td><img
													src="${pageContext.request.contextPath}/uploads/${post.image}"></td>

												<td>${post.status}</td>
												<td class="actions">
													<!-- Open edit modal on button click -->
													<button class="btn btn-primary btn-sm"
														onclick="window.open('${pageContext.request.contextPath}/edit?id=${post.id}', '_self')">Edit</button>
													<form action="admin" method="post" style="display: inline;">
														<input type="hidden" name="postId" value="${post.id}">
														<button type="submit" name="action" value="approve"
															class="btn btn-success btn-sm">Approve</button>
														<button type="submit" name="action" value="delete"
															class="btn btn-danger btn-sm">Delete</button>
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>

					</div>
				</div>

				<div id="manage_ads" style="display: none;">

					<div class="manage_ads">


						<div class="container mb-5">
							<h2>Add New Ad</h2>
							<form action="AddAdServlet" method="post"
								enctype="multipart/form-data" class="needs-validation form_ads"
								novalidate>
								<div class="form-group">
									<label for="category">Ad Page Name:</label> <select
										class="form-control" id="category" name="category" required>
										<option value="home">Home</option>
										<option value="confession">Confessions</option>
										<option value="lifestyle">Lifestyle</option>
										<option value="partner">Partner</option>
									</select>
									<div class="invalid-feedback">Please select a category.</div>
								</div>
								<div class="form-group">
									<label for="image">Ad Image:</label> <input type="file"
										class="form-control-file" id="image" name="image" required>
									<div class="invalid-feedback">Please choose an image.</div>
								</div>
								<div class="form-group">
									<label for="text">Text:</label>
									<textarea class="form-control" id="text" name="text" rows="3"
										required></textarea>
									<div class="invalid-feedback">Please enter text for the
										ad.</div>
								</div>
								<div class="form-group">
									<label for="link1">Link 1:</label> <input type="text"
										class="form-control" id="link1" name="link1">
								</div>
								<div class="form-group">
									<label for="link2">Link 2:</label> <input type="text"
										class="form-control" id="link2" name="link2">
								</div>
								<button type="submit" class="btn btn-primary mt-2">Add
									Ad</button>
							</form>
						</div>



						<h2 class="text-center text-primary fs-4">Zed Stories
							Existing Ads</h2>
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Ad Number</th>
										<th>Category</th>
										<th>Ad Image</th>
										<th>Ad Text</th>
										<th>Links</th>
										<th>Links</th>
										<th>Time Added</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ad" items="${ads}">
										<tr class="img_admin mb-2">
											<td>${ad.id}</td>
											<td>${ad.page}</td>
											<td class="limit_this"><img
												src="${pageContext.request.contextPath}/${ad.image}"
												class="img-fluid" alt="Ad Image"></td>
											<td>${ad.text}</td>
											<td><a href="${ad.link1}">${ad.link1}</a></td>
											<td><a href="${ad.link2}">${ad.link2}</a></td>
											<td>${ad.timestamp}</td>
											<td>
												<form
													action="${pageContext.request.contextPath}/admin/deleteAd"
													method="post">
													<input type="hidden" name="adId" value="${ad.id}" />
													<button type="submit" class="btn btn-danger btn-sm">Delete</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>


					</div>
				</div>

			</div>

			<!--  -->


		</section>
	</div>

	<!-- admin panel end -->
	<!-- footer -->
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
				<div class="subscribe">
					<form action="#" method="post">
						<input type="email" name="email" id="email"
							placeholder="Enter email address" required>
						<button>Subscribe for notifications</button>
					</form>
				</div>
			</div>
		</div>

		<div class="all_rights">
			<p class="copyright">Copyright &copy; 2024 All rights reserved</p>
			<p class="separator">| This template is developed By |</p>
			<p class="developer">Fiero Technologies</p>
		</div>

	</footer>
	<script>
		
	</script>

	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- bootsrtap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script src="${pageContext.request.contextPath}/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/js/animate.js"></script>

	<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>

</html>