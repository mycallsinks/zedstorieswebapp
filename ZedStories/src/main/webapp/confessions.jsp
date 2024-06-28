<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Zed Stories Homepage</title>
    <!-- boostrap css link -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- External CSS -->
    <link rel="stylesheet" href="./css/style.css" />
    <link rel="stylesheet" href="./css/animations.css">

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
                    <a class="navbar-brand logo_name" href="#">
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
                                <a class="nav-link" href="./index.html">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./conffessions.html">Confessions</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./lifestyle.html">Lifestyle</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./partner.html">Partner</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./makeapost.html">Post</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./counsel.html">Counsel </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./about.html">About</a>
                            </li>
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

                            <img src="./images/lover.jpg" class="card-img img-fluid" alt="...">
                            <div class="card-img-overlay testing ">
                                <h5 class="card-title text-center">CONFFESSIONS</h5>
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



                                <!-- this is repeating 3 times -->
                               <c:forEach var="post" items="${confessions}" varStatus="status">
    <c:if test="${status.index < 3}">
        <div class="col-12 card p-0 post">
            <!-- col-4 -->
            <div class="row g-0">
                <div class="col-md-5 normal_poster p-0">
                    <c:if test="${not empty post.image}">
                        <img src="uploads/${post.image}" class="img-fluid" alt="post image">
                    </c:if>
                    <p class="post_category_tittle">Confessions</p>
                </div>
                <div class="col-md-7 m-0">
                    <div class="card-body post_details ps-1 p-0 pe-1">
                        <h5 class="card-title second_section_post_tittle">${post.title}</h5>
                        <div class="post_para_details">
                            <p class="card-text second_section_post_text m-0">${post.text}</p>
                            <p class="author_location">${post.location}</p>
                            <p class="contact_details">${post.contactDetails}</p>
                            <div class="authors_details mb-2">
                                <p class="card-text post_author m-0">
                                    <small>${post.author}</small>
                                </p>
                                <p class="card-text post_date">
                                    <small>${post.date}</small>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</c:forEach>
                               
                                <!-- repeadting 3 times end -->


                            </div>



                        </div>
                    </div>

                    <div class="col-12 col-md-4 ">
                        <div class="container-fluid text-center m-0 p-0 borders">
                            <div class="row">
                                <div class="col-12 mb-1  section_tittles">
                                    Top trending Story
                                </div>


                                <!-- div repeating one -->
<c:forEach var="post" items="${confessions}" varStatus="status">
    <c:if test="${status.index == 0}">
        <div class="col-12 card top_trending p-0 post">
            <!-- col-7 -->
            <div class="row g-0 top_trending_post">
                <div class="col-md-12 normal_poster p-0">
                    <c:if test="${not empty post.image}">
                        <img src="uploads/${post.image}" class="img-fluid" alt="Post Image">
                    </c:if>
                    <p class="post_category_tittle">Post Category Title</p>
                </div>
                <div class="col-md-12 m-0">
                    <div class="card-body post_details ps-1 p-0 pe-1">
                        <!-- title -->
                        <h5 class="card-title second_section_post_tittle">${post.title}</h5>
                        <!-- paragraph -->
                        <div class="post_para_details">
                            <p class="card-text second_section_post_text m-0">${post.text}</p>
                            <p class="author_location">${post.location}</p>
                            <p class="contact_details">${post.contactDetails}</p>
                            <div class="authors_details mb-2">
                                <p class="card-text post_author m-0">
                                    <small>${post.author}</small>
                                </p>
                                <p class="card-text post_date">
                                    <small>${post.date}</small>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</c:forEach>
<!-- div end repeating once -->
                                




                                <!-- we start here -->
                                <div class="col-12  section_tittles">
                                    Whats trending in
                                </div>

                               <!-- Show Only Three Posts: -->
<c:forEach var="post" items="${confessions}" varStatus="status">
    <c:if test="${status.index < 3}">
        <div class="col-12 card p-0 category_trending post">
            <!-- col-8 -->
            <div class="row g-0 category_trending_posters">
                <div class="col-md-5 p-0">
                    <c:if test="${not empty post.image}">
                        <img src="uploads/${post.image}" class="img-fluid" alt="Post Image">
                    </c:if>
                    <p class="post_category_tittle">Post Category Title</p>
                </div>
                <div class="col-md-7 m-0">
                    <div class="card-body post_details ps-1 p-0 pe-1">
                        <!-- title -->
                        <h5 class="card-title second_section_post_tittle">${post.title}</h5>
                        <!-- paragraph -->
                        <div class="post_para_details">
                            <p class="card-text second_section_post_text m-0">${post.text}</p>
                            <p class="author_location">${post.location}</p>
                            <p class="contact_details">${post.contactDetails}</p>
                            <div class="authors_details mb-2">
                                <p class="card-text post_author m-0">
                                    <small>${post.author}</small>
                                </p>
                                <p class="card-text post_date">
                                    <small>${post.date}</small>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</c:forEach>
<!-- Show Only Three Posts end -->
                               

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
                                <!-- this is repeating 3 times -->
                               <!-- This is repeating 3 times -->
<c:forEach var="post" items="${confessions}" varStatus="status">
    <c:if test="${status.index < 3}">
        <div class="col-12 card p-0 post">
            <!-- col-4 -->
            <div class="row g-0">
                <div class="col-md-5 normal_poster p-0">
                    <img src="uploads/${post.image}" class="img-fluid" alt="post image">
                    <p class="post_category_tittle">Confessions</p>
                </div>
                <div class="col-md-7 m-0">
                    <div class="card-body post_details ps-1 p-0 pe-1">
                        <!-- title -->
                        <h5 class="card-title second_section_post_tittle">${post.title}</h5>
                        <!-- paragraph -->
                        <div class="post_para_details">
                            <p class="card-text second_section_post_text m-0">${post.text}</p>
                            <p class="author_location">${post.location}</p>
                            <p class="contact_details">${post.contactDetails}</p>
                            <div class="authors_details mb-2">
                                <p class="card-text post_author m-0">
                                    <small>${post.author}</small>
                                </p>
                                <p class="card-text post_date">
                                    <small>${post.date}</small>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <c:if test="${status.index == 2}">
        <c:set var="breakLoop" value="true" />
    </c:if>

</c:forEach>
<!-- Repeating 3 times end -->
                               
                                  <!-- repeadting 3 times end -->
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
                                    <div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
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


                                    <div class="card-body p-0">
                                        <p class="card-text">Some quick example text to build on the card title and make
                                            up the bulk of the card's content.</p>
                                        <p class="card-text add_links">
                                            <a href="#">link one</a>
                                            <a href="#">link two</a>
                                            <a href="#">link three</a>
                                        </p>
                                    </div>
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
                        <a class="navbar-brand logo_name" href="#">
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
                            <a href="./index.html">
                                <i class="fa-solid fa-arrow-right">
                                </i> Home
                            </a>
                        </li>
                        <li>
                            <a href="./about.html"><i class="fa-solid fa-arrow-right"></i>About
                            </a>
                        <li>
                            <a href="./conffessions.html"><i class="fa-solid fa-arrow-right"></i>Confessions
                            </a>
                        <li>
                            <a href="./lifestyle.html"><i class="fa-solid fa-arrow-right"></i>Lifestyle
                            </a>
                        <li>
                            <a href="./findapartner.html"><i class="fa-solid fa-arrow-right"></i>Partner
                            </a>
                        </li>
                        <li>
                            <a href="./counsel.html"><i class="fa-solid fa-arrow-right"></i>Counsel
                            </a>
                        </li>
                        <li>
                            <a href="./about.html"><i class="fa-solid fa-arrow-right"></i>About
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
    <script src="./js/script.js"></script>
    <script src="./js/animate.js"></script>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>