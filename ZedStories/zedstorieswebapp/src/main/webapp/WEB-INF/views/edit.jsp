<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Edit post</title>
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
img {
	height: 250px !important;
	width: 100% !important;
	border-radius:7px !important;
}

.author_location{
display: flex;
justify-content:space-between;
}

form{
display: flex;
flex-direction:column;
gap:15px;

}

.post_id {
color: #ff8000;
}


label {
color:#4390f5;
}
</style>
<body>
	<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="text-center">Edit Post <span class="post_id">${post.id}</span>  </h2>
            <form action="<c:url value='/edit'/>" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${post.id}">
    <input type="hidden" id="existingImage" name="existingImage" value="${post.image}">
                
                <div class="form-group">
                    <label>Current Image:</label>
                    <br>
                    <img src="${pageContext.request.contextPath}/uploads/${post.image}" class="img-fluid" width="200" height="150">
                </div>
                <div class="form-group">
                    <label>Title:</label>
                    <input type="text" class="form-control" name="title" value="${post.title}">
                </div>

                
                <div class="form-group  author_location">
 

                    <div class="one">
                                        <label>Author:</label>
                    <input type=text class="form-control" name="author" value="${post.author}">
                    
                    </div>
                    
                    <div class="two">
                                       <label>Location:</label>
                    <input type="text" class="form-control" name="location" value="${post.location}">
                    
                    </div>
                </div>
                
                <div class="form-group">
                    <label>Text:</label>
                    <textarea class="form-control" name="text">${post.text}</textarea>
                </div>
                
                <div class="form-group">
                    <label>Upload New Image:</label>
                    <input type="file" class="form-control-file" name="newimage">
                </div>
                
                <div class="form-group">
                    <label>Status:(can write short notes)</label>
                    <input type="text" class="form-control" name="status" value="${post.status}">
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
