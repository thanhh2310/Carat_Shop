<%-- 
    Document   : index
    Created on : Oct 3, 2024, 11:07:43 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carat Shop</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <!-- Navbar -->
    
    <jsp:include page="header.jsp"></jsp:include>
      <!-- BANNER -->
      <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active" data-bs-interval="10000">
            <img src="source/banner.jpg" class="d-block w-100 banner" alt="...">
          </div>
          <div class="carousel-item" data-bs-interval="2000">
            <img src="source/banner 2.jpg" class="d-block w-100 banner" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <!-- palele test -->
      <div class="container">
        <hr><h1>SẢN PHẨM YÊU THÍCH</h1><hr>
      </div>
      <!-- DETAIL PRODUCTS -->
      <div class="container">
        <div class="row">
           <c:forEach items="${product}" var="p">
    <div class="col-3">
        <a href="Controllerdetail?id=${p.getId()}" class="text-decoration-none">
            <div class="card" style="width: 18rem;">
                <img src="${p.getImage()}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">${p.getName()}</h5>
                    <p class="card-text">${p.getDescription()}</p>
                    <p class="card-text">${p.getPrice()}</p>
                </div>
            </div>
        </a>
    </div>
</c:forEach>
        
        </div>
      </div>    
      <hr><h1>SẢN PHẨM MỚI</h1><hr>
      <div class="container">
        <div class="row">
            <c:forEach items="${product1}" var="p_1">
    <div class="col-3">
        <a href="Controllerdetail?id=${p_1.getId()}" class="text-decoration-none">
            <div class="card" style="width: 18rem;">
                <img src="${p_1.getImage()}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">${p_1.getName()}</h5>
                    <p class="card-text">${p_1.getDescription()}</p>
                    <p class="card-text">${p_1.getPrice()}</p>
                </div>
            </div>
        </a>
    </div>
</c:forEach>

            </div>
        </div>
       
      <!-- footer -->
    <jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>
