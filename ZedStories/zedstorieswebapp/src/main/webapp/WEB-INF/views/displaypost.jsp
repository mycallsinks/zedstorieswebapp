<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%@ page import="com.michaelsinkamba.dao.CommentDAO,com.michaelsinkamba.models.Comment,java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.isEmpty()) {
        out.println("Invalid post ID.");
        return;
    }

    int postId;
    try {
        postId = Integer.parseInt(idParam);
    } catch (NumberFormatException e) {
        out.println("Invalid post ID format.");
        return;
    }

    CommentDAO commentDAO = new CommentDAO();
    List<Comment> comments = commentDAO.getCommentsByPostId(postId);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reading post</title>
    <!-- boostrap css link -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- External CSS -->
     <!-- External CSS -->
				<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
				<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animations.css" />
				
				<!-- favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/favicon/site.webmanifest">
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    <!-- fonts icons start-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <script src="https://kit.fontawesome.com/018d9ba538.js" crossorigin="anonymous"></script>
</head>


<style>
    /* post text on home is not visible */
    .landing_page .post_details .post_text {
        display: block !important;
    }

    .top_trending_post .second_section_post_text {
        display: block !important;
    }
    .category_trending .second_section_post_text {
        display: none !important;
    } 
    
.clear_these .author_location, .clear_these .second_section_post_text, .clear_these .contact_details{
    display: none !important;
    } 
   

    .contact_details,
    .author_location {
        display: block !important;
    }

    .authors_details {
        display: flex impotant;
        justify-content: space-between !important;
    }
    
    
    .comment_options{
    display:flex;
    flex-direction:column;
 	gap:10px
    }
    
    
    .comment_options input{
    height:40px;
    padding:0 3px;
    }
    
    .comment_options textarea{
        padding:0 3px;
    
    }
    
    
    .comment_options .comment_text{
    display:flex;
    flex-direction:column !important;
    gap:5px;
    }
    
    .comment_options .comment_names{
    display:flex;
    flex-direction:column !important;
    gap:5px;
    }
    
    .comment_options button{
    padding:5px 7px;
    width:fit-content;
    border-width:1px;
    border-radius:3px;
    color:#FFFFFF;
    }
    
    
</style>

<body class="bg-body-tertiary">
    <div class="zed_sotories_holder">
        <header class="header_holder">
            <!-- navbar -->
            <nav class="navbar navbar-expand-md bg-body-tertiary">
                <div class="container-fluid pe-2 ps-2">
                    <a class="navbar-brand logo_name" href="${pageContext.request.contextPath}/index">
                        <span class="logo_surname initial_logo_name">Zed</span><span
                            class="logo_surname text-primary">Stories</span>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse navbar_lists" id="navbarSupportedContent">
                            <div class="collapse navbar-collapse navbar_lists" id="navbarSupportedContent">
<ul class="navbar-nav">
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/index">Home</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/confessions">Confessions</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/lifestyle">Lifestyle</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/partner">Partner</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/makeapost">Post</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="/zedstorieswebapp/counsel.jsp">Counsel</a>
    </li>    
        <li class="nav-item">
        <a class="nav-link" href="/zedstorieswebapp/about.jsp">
             About
        </a>
    </li>
</ul>
                    </div>
                </div>
            </nav>
        </header>

<section class="body_holder">





    <c:if test="${not empty post}">
        <!-- Display the post details here -->
        <div class="container-fluid text-center mb-2 body_sections landing_page card ">
        
        
            <div class="row d-flex mb-2 ">
            
            
                <div class="col-12 main_home_poster text-bg-dark p-0 poster mb-2 mb-md-0 orther_pages_landing">
                    <div class="text-bg-dark">
                        <c:if test="${not empty post.image}">
                            <img src="${pageContext.request.contextPath}/uploads/${post.image}" class="card-img img-fluid" alt="...">
                        </c:if>
                        <div class="card-img-overlay testing">
                            <h5 class="card-title text-center">${post.title}</h5>

                    </div>
                    
                    
                </div>
                
            </div>
            <div class="row mb-2">
                <div class="col-12 add_bg">
                    <marquee behavior="" direction="">
                        <!-- Advertise your businesses 0974286888 -->
                    </marquee>
                </div>
            </div>
        </div>

        <!-- Second home section -->
<!--         <div class="container-fluid text-center mb-2 body_sections second_section">
            <div class="row">
                
            
            
            
 -->

 

        <!-- Display the post details here -->
        <div class="container-fluid text-center mb-2 body_sections landing_page">
            <div class="row d-flex mb-2">
            
                <div class="col-12 col-md-8 toTheLeft">
                    <div class="container-fluid text-center m-0 p-0">
                        <div class="row">
                            <div class="col-12 mb-1 section_tittles">
                                Let's Read
                            </div>
                            <div class="col-12 card p-0 border mb-2">
                                <div class="row g-0">
                                    <div class="col-md-12 m-0">
                                        <div class="card-body post_details">
                                            <div class="post_para_details">
                                                <div class="authors_details mb-2">
                                                    <p class="card-text post_author m-0">
                                                        <small>${post.author}</small>
																  
																	

   
                                   </p>
                                                    <p class="card-text post_date">
                                                        <small>${post.formattedDate}</small>
                                                    </p>
                                                </div>
                                                <p class="card-text m-0">${post.text}</p>
                                                <div class="authors_details">
                                                    <p class="author_location">
                                                        <small id="loca">${post.location}</small>
                                                    </p>
                                                    <p class="contact_details">
                                                        <small>${post.contactDetails}</small>
                                                    </p>
                                                    

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                        </div>              
                        <div class="row">
                            <div class="col-12 mb-1 section_tittles">
                                Comments
                            </div>
                            <div class="col-12 card p-0">
                                <div class="row g-0">
                                    <div class="col-md-12 m-0">
                                        <div class="card-body post_details">
                                            <div class="comments_section">
                                                <% for (Comment comment : comments) { %>
                                                    <p><strong><%= comment.getNickname() %></strong>: <%= comment.getCommentText() %></p>
                                                    <!-- date not needed -->
                                                    <%-- <p><em><%= comment.getDate() %></em></p> --%>
                                                    <hr>
                                                <% } %>
                                                
                                                

                                            </div>
                                            
                                            
                                            <div class="border p-2">
                                            
                                                                       <div class="col-12 mb-3 section_tittles p-2">
                               Comment anonymously on this post
                           </div>
                                            
                                            <form action="addComment" method="post" class="comment_options">

                                                
                                                <div class="comment_names">
                                                <input type="hidden" name="postId" value="${post.id}">
                                                <label for="nickname">Nickname:</label>
                                
                                                <input type="text" id="nickname" name="nickname" required>
                                                </div>
                                                
                                                <div class="comment_text">
                                                <label for="commentText">Comment:</label>
                                                <textarea id="commentText" name="commentText" required></textarea>
                                                </div>
                                                
                                               
                                                <button type="submit" class="bg-primary">Add Comment</button>
                                            </form>
                                            
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
  

                <div class="col-12 col-md-4 toTheRight">
                    <div class="container-fluid text-center m-0 p-0 borders">
                        <div class="row">
                            <div class="col-12 section_tittles">
                                From confessions
                            </div>
                            
                            <!-- Trending posts from Confession -->
                            <c:forEach var="post" items="${ConfessiontopOneTrending}">
                                <div class="col-12 card p-0 category_trending post clear_these">
                                    <div class="row g-0 category_trending_posters">
                                        <div class="col-md-5 p-0">
                                            <c:if test="${not empty post.image}">
                                                <img src="${pageContext.request.contextPath}/uploads/${post.image}" class="img-fluid" alt="...">
                                            </c:if>
                                            
                                        </div>
                                        <div class="col-md-7 m-0">
                                            <div class="card-body post_details ps-1 p-0 pe-1">
                                                <h5 class="card-title second_section_post_tittle">
                                                    <a href="displaypost?id=${post.id}">${post.title}</a>
                                                </h5>
                                                <div class="post_para_details">
                                                    <p class="card-text second_section_post_text">${post.text}</p>
                                                    <p class="author_location">${post.location}</p>
                                                    <p class="contact_details">${post.contactDetails}</p>
                                                    <div class="authors_details mb-2">
                                                        <p class="card-text post_author">
                                                            <small>${post.author}</small>
                                                        </p>
                                                        <p class="card-text post_date">
                                                            <small>${post.formattedDate}</small>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            
                            <!-- Trending posts from Partner -->
                            <c:forEach var="post" items="${PartnertopOneTrending}">
                                <div class="col-12 card p-0 category_trending post clear_these">
                                    <div class="row g-0 category_trending_posters">
                                        <div class="col-md-5 p-0">
                                            <c:if test="${not empty post.image}">
                                                <img src="${pageContext.request.contextPath}/uploads/${post.image}" class="img-fluid" alt="...">
                                            </c:if>
                                            <p class="post_category_tittle">Partner</p>
                                        </div>
                                        <div class="col-md-7 m-0">
                                            <div class="card-body post_details ps-1 p-0 pe-1">
                                                <h5 class="card-title second_section_post_tittle">
                                                    <a href="displaypost?id=${post.id}">${post.title}</a>
                                                </h5>
                                                <div class="post_para_details">
                                                    <p class="card-text second_section_post_text">${post.text}</p>
                                                    <p class="author_location">${post.location}</p>
                                                    <p class="contact_details">${post.contactDetails}</p>
                                                    <div class="authors_details mb-2">
                                                        <p class="card-text post_author">
                                                            <small>${post.author}</small>
                                                        </p>
                                                        <p class="card-text post_date">
                                                            <small>${post.formattedDate}</small>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            
                            <!-- Trending posts from Lifestyle -->
                            <c:forEach var="post" items="${LifestyletopOneTrending}">
                                <div class="col-12 card p-0 category_trending post clear_these">
                                    <div class="row g-0 category_trending_posters">
                                        <div class="col-md-5 p-0">
                                            <c:if test="${not empty post.image}">
                                                <img src="${pageContext.request.contextPath}/uploads/${post.image}" class="img-fluid" alt="...">
                                            </c:if>
                                            <p class="post_category_tittle">Lifestyle</p>
                                        </div>
                                        <div class="col-md-7 m-0">
                                            <div class="card-body post_details ps-1 p-0 pe-1">
                                                <h5 class="card-title second_section_post_tittle">
                                                    <a href="displaypost?id=${post.id}">${post.title}</a>
                                                </h5>
                                                <div class="post_para_details">
                                                    <p class="card-text second_section_post_text">${post.text}</p>
                                                    <p class="author_location">${post.location}</p>
                                                    <p class="contact_details">${post.contactDetails}</p>
                                                    <div class="authors_details mb-2">
                                                        <p class="card-text post_author">
                                                            <small>${post.author}</small>
                                                        </p>
                                                        <p class="card-text post_date">
                                                            <small>${post.formattedDate}</small>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </c:if>

    <c:if test="${empty post}">
        <p>Post not found.</p>
    </c:if>

</section>


<!-- for hoin all post and comments -->

    

    <!-- footer -->
    <footer class="footer body_sections">

        <div class="footer_wrapper">
            <div class="first">
                <div class="logo">
                    <h1 class="doc_logo">
                        <!-- Dr.<span id="special">Fiero</span> -->
                        <a class="navbar-brand logo_name" href="${pageContext.request.contextPath}/index">
                            <span class="logo_surname initial_logo_name">Zed</span><span
                                class="logo_surname text-primary">Stories</span>
                        </a>
                    </h1>
                    <p>Anonymously write confessions, find a partner, and encourage someone about life.</p>
                </div>

                <div class="have_questions">
                    <h3>Have Questions?</h3>
                    <ul>

                        <li>
                            <i class="fa-solid fa-phone"></i>
                            +260 974286888
                        </li>
                        <li>
                            <i class="fa-brands fa-whatsapp"></i>
                            <a href="https://wa.me/message/WSQ463DN4ZDRK1" target="_blank">Whatsapp </a>
                        </li>
                        <li>
                            <i class="fa-solid fa-globe"></i>
                            <a href="https://www.michaelsinkamba.com">michaelsinkamba.com</a>
                        </li>
                    </ul>
                </div>


            </div>

            <div class="second">
                <div class="links">
                    <h3>Links</h3>
                    <ul>
 <li>
        <a href="${pageContext.request.contextPath}/index">
            <i class="fa-solid fa-arrow-right"></i> Home
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/about">
            <i class="fa-solid fa-arrow-right"></i> About
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/confessions">
            <i class="fa-solid fa-arrow-right"></i> Confessions
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/lifestyle">
            <i class="fa-solid fa-arrow-right"></i> Lifestyle
        </a>
    </li>
    <li>
        <a href="${pageContext.request.contextPath}/findapartner">
            <i class="fa-solid fa-arrow-right"></i> Partner
        </a>
    </li>
    <li>
        <a href="/zedstorieswebapp/counsel.jsp">
            <i class="fa-solid fa-arrow-right"></i> Counsel
        </a>
    </li>
    <li>
        <a href="/zedstorieswebapp/about.jsp">
            <i class="fa-solid fa-arrow-right"></i> About
        </a>
    </li>
                    </ul>
                </div>
            </div>


            <div class="fourth">
                <div class="sumary_services">
                    <h3>Services</h3>
                    <ul>
                        <li>
                            <a href="#">
                                <i class="fa-solid fa-arrow-right"></i>Get Help
                            </a>
                            <p>
                                Anonymously get advice from experienced Counsellor on relationships, lifestyle, and
                                managing life's challenges.
                            </p>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa-solid fa-arrow-right"></i>Advertise
                            </a>
                            <p>
                                Advertise with ZedStories

                            </p>
                        </li>
                    </ul>
                </div>
                <div class="subscribe">
                    <form action="#" method="post">
                        <input type="email" name="email" id="email" placeholder="Enter email address" required>
                        <button>Subscribe for notifications</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="all_rights">

            <p class="desktop_view">
                Copyright ©2024 All rights reserved
            <p id="tab_break">
                | This template is developed By |
            <p class="phone_break">
                Fiero Technologies
            </p>
            </p>
            </p>

        </div>
    </footer>
    
    
<!--     <script>
    document.addEventListener("DOMContentLoaded", function() {
        document.querySelectorAll(".like-form").forEach(function(form) {
            form.addEventListener("submit", function(event) {
                event.preventDefault(); // Prevent form submission
                
                // Additional logic to handle form submission
                var postId = form.querySelector("input[name='postId']").value;
                
                // Perform your form submission logic here
                // For example:
                fetch(form.action, {
                    method: 'POST',
                    body: new FormData(form)
                }).then(function(response) {
                    if (response.ok) {
                        console.log("Like added successfully.");
                    } else {
                        console.error("Failed to add like.");
                    }
                }).catch(function(error) {
                    console.error("Error adding like:", error);
                });
            });
        });
    });
</script> -->
    

    <!-- external js sheet -->
  			<script src="${pageContext.request.contextPath}/js/script.js"></script>
			<script src="${pageContext.request.contextPath}/js/animate.js"></script>


    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>