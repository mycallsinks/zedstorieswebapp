<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>About</title>
            <!-- boostrap css link -->

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">

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
.author_location , .contact_details {
display:none;

}
.contact_details{

}


.author_location {
float:right;
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
            <!-- home section  landing page-->
            <div class="container-fluid text-center mb-2 body_sections landing_page card ">
                <div class="row d-flex mb-2 ">
                    <!-- home landing page poster -->
                    <!-- home landing page poster -->
                    <div class="col-12 main_home_poster  text-bg-dark p-0 poster mb-2 mb-md-0 orther_pages_landing">
                        <div class=" text-bg-dark  ">

                            <img src="./images/aboutusimage.jpeg" class="card-img img-fluid" alt="...">
                            <div class="card-img-overlay testing ">
                                <h5 class="card-title text-center">ABOUT</h5>
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
                <div class="col-12 col-md-8 px-0 mb-3">
                    <div class="d-flex p-2 main_color text-white mb-2 section_tittles">About zedStories</div>
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button " type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    What is ZedStories
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>ZedStories</strong> is a platform where individuals can share their
                                    confessions, seek partners, and discuss various lifestyle-related topics. From
                                    heartfelt revelations to finding companionship and exploring life's intricacies,
                                    ZedStories offers a space for genuine connections and meaningful conversations. Join
                                    us as we delve into the depths of
                                    <code>human experiences, forge new relationships, and navigate life's journey together.</code>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Terms and Conditions
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <ul>
                                        <li>
                                            <strong>User Conduct:</strong> Users are expected to conduct themselves with
                                            respect and courtesy towards others at all times. Any form of harassment,
                                            hate speech, or inappropriate behavior will not be tolerated.
                                        </li>
                                        <li>

                                        </li>
                                        <li>
                                            <strong>Confidentiality:</strong>
                                            Users are encouraged to share their stories and experiences openly, but they
                                            should refrain from disclosing personal information that could compromise
                                            their safety or the safety of others. Real names and identifiable images
                                            should not be used unless expressly permitted by the individual.
                                        </li>
                                        <li>
                                            <strong>
                                                Intellectual Property:
                                            </strong>
                                            Users retain ownership of the content they post on ZedStories. However, by
                                            posting content, users grant ZedStories the right to use, modify, and
                                            distribute their content for promotional purposes.


                                        </li>
                                        <li>
                                            <strong>
                                                Images:
                                            </strong>
                                            The use of images on ZedStories is optional. Users are responsible for
                                            ensuring they have the necessary rights and permissions to use any images
                                            they upload. ZedStories is not liable for any copyright infringement or
                                            misuse of images by users.
                                        </li>
                                        <li>
                                            <strong>Moderation:</strong>
                                            ZedStories reserves the right to moderate and remove any content that
                                            violates community guidelines or is deemed inappropriate. Users who
                                            repeatedly violate these guidelines may be banned from the platform.


                                        </li>
                                        <li>
                                            <strong>Third-Party Links: </strong>
                                            ZedStories may contain links to third-party websites or services. ZedStories
                                            is not responsible for the content or privacy practices of these third-party
                                            sites and encourages users to review their terms and policies.
                                        </li>

                                        <li>
                                            <strong>
                                                Disclaimer of Liability:
                                            </strong>
                                            ZedStories is not liable for any damages or losses incurred as a result of
                                            using the platform. Users engage with ZedStories at their own risk and are
                                            responsible for their actions and interactions on the platform.


                                        </li>

                                        <li>
                                            <strong>
                                                Updates to Terms:
                                            </strong>
                                            ZedStories reserves the right to update these terms and conditions at any
                                            time. Users will be notified of any changes, and continued use of the
                                            platform constitutes acceptance of the revised terms.


                                        </li>
                                        <li>
                                            <strong>
                                                Contact Information:
                                            </strong>
                                            Users can contact <a class="link" href="https://www.michaelsinkamba.com" target="_blank"> Michael Sinkamba</a> with any questions, concerns, or feedback
                                            regarding these terms and conditions or the platform itself.
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    ZedStories Mission
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    The <strong> mission of ZedStories</strong> is to provide a safe, inclusive, and
                                    supportive platform where individuals can share their stories, connect with others,
                                    and find solace, companionship, and understanding. We believe in the power of
                                    storytelling to foster empathy, build connections, and inspire positive change. By
                                    creating a space where users can express themselves authentically, engage in
                                    meaningful conversations, and offer support to one another, ZedStories aims to
                                    empower individuals to navigate life's challenges, celebrate their triumphs, and
                                    cultivate a sense of belonging within a vibrant and diverse community.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
                                    About the Founder
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <strong>Michael Sinkamba </strong> is a dedicated student at Mulungushi University,
                                    currently in his 4th year studying Computer Science. Alongside his academic
                                    pursuits, Michael is the founder and CEO of Fiero Technologies, a burgeoning tech
                                    company focused on innovation and digital solutions. With a passion for web
                                    development, Michael showcases his expertise through his personal portfolio website,
                                    michaelsinkamba.com. Through his leadership and commitment, Michael aims to create
                                    impactful digital experiences and empower individuals and businesses with
                                    cutting-edge technology solutions.
                                </div>
                            </div>
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
                                            <img src="./images/fierobanner.JPG" class="d-block w-100" alt="...">
                                        </div>
<!--                                         <div class="carousel-item">
                                            <img src="./images/fierobanner3.JPG" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./images/fierobanner2.JPG" class="d-block w-100" alt="...">
                                        </div> -->
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
             <!-- about from here -->
        </section>
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
                                        Anonymously get advice from experienced Counsellor on relationships, lifestyle,
                                        and
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