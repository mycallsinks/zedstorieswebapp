<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Zed Stories Homepage</title>
    <!-- boostrap css link -->

<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> -->

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
    .admin_login{
        display: flex;
        flex-direction: column;
        height: 80dvh;
        justify-content: center;
        align-items: center;
        gap: 20px;
    }

    .admin_login .first{
        display: flex;
        flex-direction: column;
        gap: 20px !important;        
    }
    
    .admin_login .first div{
    display:flex;
    flex-direction:column;
    gap:5px
    }
    

    .admin_login form input{
        height: 30px;
        border-width: 1px;
        border-radius: 7px ;
    }
</style>


<body class="bg-body-tertiary">



    <div class="zed_sotories_holder">

        <div class="admin_login">
            <h2>Zed Stories Admin Login</h2>
            <form action="adminLogin" method="post">
            
            <div class="first">
            
             <div>
            <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div>
            <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
               
                <input type="submit" class="bg-primary text-white" value="Login">
                
            </div>

            </form>
            <c:if test="${not empty errorMessage}">
                <p style="color:red;">${errorMessage}</p>
            </c:if>
        </div>
 
    </div>
    <!-- external js sheet -->
           <!-- External JS -->
			<script src="${pageContext.request.contextPath}/js/script.js"></script>
			<script src="${pageContext.request.contextPath}/js/animate.js"></script>



    <!-- Bootstrap JS Bundle with Popper -->
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script> -->
</body>

</html>
