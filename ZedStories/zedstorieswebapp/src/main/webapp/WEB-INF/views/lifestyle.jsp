<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.michaelsinkamba.models.Ad" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lifestyle</title>
    <!-- boostrap css link -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


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
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <section class="body_holder">
            <!-- home section  landing page-->
            <div class="container-fluid text-center mb-2 body_sections landing_page card ">
                <div class="row d-flex mb-2 ">

                    <div class="col-12 main_home_poster  text-bg-dark p-0 poster mb-2 mb-md-0 orther_pages_landing">
                        <div class=" text-bg-dark  ">

                            <img src="./images/lifestylelandingpage.jpg" class="card-img img-fluid" alt="...">
                            <div class="card-img-overlay testing ">
                                <h5 class="card-title text-center">Lifestyle Stories</h5>
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

            <div class="container-fluid text-center mb-2 body_sections second_section">
                <div class="row">
                    <div class="col-12 col-md-8">
                        <div class="container-fluid text-center m-0 p-0">
                            <div class="row">
                                <div class="col-12 mb-1 section_tittles">
                                    Trending stories
                                </div>


                                <!-- frist three trending posts -->
                                <c:forEach var="post" items="${LifestylefirstThreeLatest}">
                                
                                    <div class="col-12  card p-0 post">
                                        <!-- col-4 -->
                                        <div class="row g-0">
                                            <div class="col-md-5 normal_poster p-0">
                                                <c:if test="${not empty post.image}">
                                                    <img src="${pageContext.request.contextPath}/uploads/${post.image}" class="img-fluid" alt="Post Image">
                                                    
                                                </c:if>
                                                <p class="post_category_tittle">Lifestyle</p>
                                            </div>
                                            <div class="col-md-7 m-0">
                                                <div class="card-body post_details ps-1 p-0 pe-1">
                                                    <!-- tittle  -->
                                                    <h5 class="card-title second_section_post_tittle">
                                                    <a href="displaypost?id=${post.id}">${post.title}</a>
                                                    
                                                    </h5>
                                                    <!-- paragrapgh -->

                                                    <div class="post_para_details">
                                                        <p class="card-text second_section_post_text m-0">${post.text}
                                                        </p>
                                                        <p class="author_location">${post.location}</p>
                                                        <p class="contact_details">${post.contactDetails}</p>
                                                        <div class="authors_details mb-2">
                                                            <p class="card-text post_author m-0">
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

                    <div class="col-12 col-md-4 ">
                        <div class="container-fluid text-center m-0 p-0 borders">
                            <div class="row">
                                <div class="col-12 mb-1  section_tittles">
                                    Top trending Story
                                </div>
                                <!-- top one trending -->
                                <c:forEach var="post" items="${LfestyletopOneTrending}">
                                    <div class="col-12  card top_trending p-0 post">
                                        <!-- col-7 -->
                                        <div class="row g-0 top_trending_post">
                                            <div class="col-md-12 normal_poster p-0">

                                                <c:if test="${not empty post.image}">
                                                    <img src="${pageContext.request.contextPath}/uploads/${post.image}" class="img-fluid" alt="...">
                                                </c:if>
                                                <p class="post_category_tittle">lifestyle</p>

                                            </div>
                                            <div class="col-md-12 m-0">
                                                <div class="card-body post_details ps-1 p-0 pe-1">
                                                    <!-- tittle  -->
                                                    
                                                    <h5 class="card-title second_section_post_tittle">
                                                    <a href="displaypost?id=${post.id}">${post.title}</a>
                                                    </h5>
                                                    <!-- paragrapgh -->

                                                    <div class="post_para_details">
                                                        <p class="card-text second_section_post_text m-0">${post.text}
                                                        </p>
                                                        <p class="author_location">${post.location}</p>
                                                        <p class="contact_details">${post.contactDetails}</p>
                                                        <div class="authors_details mb-2">
                                                            <p class="card-text post_author m-0">
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



                                <!-- we start here -->
                                <div class="col-12  section_tittles">
                                    Whats trending in
                                </div>
                                <!-- orther three latest -->

                                <c:forEach var="post" items="${LifestylefortherThreeLatest}">
                                    <div class="col-12  card p-0 category_trending post">
                                        <!-- col-8 -->
                                        <div class="row g-0 category_trending_posters">
                                            <div class="col-md-5 p-0">
                                                <c:if test="${not empty post.image}">
                                                    <img src="${pageContext.request.contextPath}/uploads/${post.image}" class="img-fluid" alt="...">
                                                </c:if>
                                                <p class="post_category_tittle">lifestyle</p>
                                            </div>
                                            <div class="col-md-7 m-0">
                                                <div class="card-body post_details ps-1 p-0 pe-1">
                                                    <!-- tittle  -->
                                                    <h5 class="card-title second_section_post_tittle">
                                                    <a href="displaypost?id=${post.id}">${post.title}</a>
                                                    </h5>
                                                    <!-- paragrapgh -->

                                                    <div class="post_para_details">
                                                        <p class="card-text second_section_post_text m-0">${post.text}
                                                        </p>
                                                        <p class="author_location">${post.location}</p>
                                                        <p class="contact_details">${post.contactDetails}</p>
                                                        <div class="authors_details mb-2">
                                                            <p class="card-text post_author m-0">
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

            <!-- third home sections -->
            <div class="container-fluid text-center mb-2  body_sections second_section">
                <div class="row">
                    <div class="col-12 col-md-8">
                        <div class="container-fluid text-center m-0 p-0">
                            <div class="row">
                                <div class="col-12 mb-1  section_tittles">
                                    Latest posts
                                </div>

                                <!-- second latest posts -->
                                <c:forEach var="post" items="${LifestylesecondThreeLatest}">
                                    <div class="col-12  card p-0 post">
                                        <!-- col-11 -->
                                        <div class="row g-0">
                                            <div class="col-md-5 normal_poster p-0">

                                                <c:if test="${not empty post.image}">
                                                    <img src="${pageContext.request.contextPath}/uploads/${post.image}" class="img-fluid" alt="Post Image">
                                                </c:if>
                                                <p class="post_category_tittle">Lifestyle</p>

                                            </div>
                                            <div class="col-md-7 m-0">
                                                <div class="card-body post_details ps-1 p-0 pe-1">
                                                    <!-- tittle  -->
                                                    <h5 class="card-title second_section_post_tittle">
                                                    <a href="displaypost?id=${post.id}">${post.title}</a>
                                                    </h5>
                                                    <!-- paragrapgh -->

                                                    <div class="post_para_details">
                                                        <p class="card-text second_section_post_text m-0">${post.text}
                                                        </p>

                                                        <p class="author_location">${post.location}</p>
                                                        <p class="contact_details">${post.contactDetails}</p>
                                                        <div class="authors_details mb-2">
                                                            <p class="card-text post_author m-0">
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

                    <div class="col-12 col-md-4 advertisements">
                        <div class="container-fluid text-center m-0 p-0 ps-md-1">
                            <div class="row">
                                <div class="col-12 mb-1 section_tittles">
                                    Adverts
                                </div>
                                <div class="col-12  add_poster card p-0">
                                    <!-- col-14 -->

                                    <!-- <div class="card"> -->
                                    
<c:if test="${not empty lifestyleAd}">
    <div class="ad_portion card p-0 m-0">
        <img src="${pageContext.request.contextPath}/${lifestyleAd.image}" class="img-fluid" alt="Ad Image" width="100">
        <p>Text: ${lifestyleAd.text}</p>
        <div class="ad_links">
            <a href="${lifestyleAd.link1}">${lifestyleAd.link1}</a>
            <a href="${lifestyleAd.link2}">${lifestyleAd.link2}</a>
        </div>
    </div>
</c:if>



                                    
                                    <!-- </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>



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
    <!-- external js sheet -->
    <!-- External JS -->
			<script src="${pageContext.request.contextPath}/js/script.js"></script>
			<script src="${pageContext.request.contextPath}/js/animate.js"></script>


    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>