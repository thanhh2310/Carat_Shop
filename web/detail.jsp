<%-- 
    Document   : detail.jsp
    Created on : Oct 4, 2024, 1:38:03 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <title>Carat Shop</title>
</head>
<body>
    <c:if test="${not empty message}">
    <div class="alert alert-success" role="alert">
        ${message}
    </div>
</c:if>
    <!-- NAVBAR -->
     <jsp:include page="header.jsp"></jsp:include>
      <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="shop">Home</a></li>
          <li class="breadcrumb-item active" aria-current="page">${pr.getName()}</li>
        </ol>
      </nav>
      <!-- Main Product Section -->
    <div class="container">
        
        <div class="row">
            <div class="col-md-6">
                <div id="carouselExample" class="carousel slide">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="${pr.getImage()}" class="d-block w-100 product-image" alt="...">
                      </div>
                     
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev" >
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden" >Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>

            </div>
                      
            
            <div class="col-md-6">
                <h2>${pr.getName()}</h2>
                <p>${pr.getDescription()}</p>
                <br><p>Lưu ý: Sản phẩm Free Size có thể điều chỉnh kích thước tùy ý</p>
                
               <form action="addProduct" method="post">
                <div class="container mt-5">
                    
                    <!-- Quantity Selector -->
                    <div class="quantity-input">
                        <p class="price">${pr.getPrice()}</p>
                        <button class="btn btn-outline-secondary" onclick="decreaseQuantity()">-</button>
                       
                             <input type="text" id="num" value="1" min="1" name="num" readonly>
                        <button class="btn btn-outline-secondary" onclick="increaseQuantity()">+</button>
                    </div>
                      <input type="hidden" id="productId" name="productId" value="${pr.getId()}">
                 
                </div>
                <p>Đăng ký để nhận ngay hộp trang sức trị giá 224.000đ + tích lũy, giảm giá.</p>
                <div class="d-grid gap-2">
                    
                   
                  <input type="submit" class="btn btn-danger btn-lg" value="Thêm vào giỏ hàng">
                    
                         
                     <input type="hidden" id="productId" name="productId" value="${pr.getId()}">
                   
                </div>    
        </form>         
    </div>

    <div class="container">
        <hr><h2>THÔNG SỐ SẢN PHẨM</h2><hr> 
        <div class="row mt-5">
            <div class="col-6">
                <p>Loại:<span> ${pr.getCategory().getCate()}</span></p>
                <p>Màu sắc:<span> ${pr.getColor()}</span></p>
                <p>Chất liệu<span> ${pr.getMaterial()}</span></p>
            </div> 
            <div class="col-6">
                <p>Đá:<span> ${pr.getStone()}</span></p>
                <p>Giới tính:<span> ${pr.getGender()}</span></p>
                <p>Độ hoàn thiện:<span> ${pr.getPerfection()}</span></p>
            </div>
        </div>
    </div>

    <hr>
    <!-- RATE AND REVIEW -->
    <div class="container mt-5" style="margin-bottom: 20px;">
        <!-- Overall Rating -->
        <div class="row">
            <div class="col-md-6">
                <div class="rating">
                    <h1>5/5</h1>
                    <div class="d-inline-flex">
                        <span class="text-warning h4">★★★★★</span>
                    </div>
                </div>
                <p>Total of 5 reviews</p>
                <div class="rating">
                    <span class="h6">05 reviews liked this product</span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="d-flex flex-column">
                    <div class="rating d-flex align-items-center">
                        <span class="star-text">5 Stars</span>
                        <div class="rating-bar ms-2">
                            <div class="rating-bar-fill"></div>
                        </div>
                        <span class="ms-2">100%</span>
                    </div>
                    <div class="rating d-flex align-items-center">
                        <span class="star-text">4 Stars</span>
                        <div class="rating-bar ms-2"></div>
                        <span class="ms-2">0%</span>
                    </div>
                    <div class="rating d-flex align-items-center">
                        <span class="star-text">3 Stars</span>
                        <div class="rating-bar ms-2"></div>
                        <span class="ms-2">0%</span>
                    </div>
                    <div class="rating d-flex align-items-center">
                        <span class="star-text">2 Stars</span>
                        <div class="rating-bar ms-2"></div>
                        <span class="ms-2">0%</span>
                    </div>
                    <div class="rating d-flex align-items-center">
                        <span class="star-text">1 Star</span>
                        <div class="rating-bar ms-2"></div>
                        <span class="ms-2">0%</span>
                    </div>
                </div>
            </div>
        </div>
    
        <!-- Reviews -->
        <div class="row mt-4">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center">
                    <h5>Reviews</h5>
                    <div>
                        <button class="btn btn-outline-dark dropdown-toggle" type="button" data-bs-toggle="dropdown">Sort by: Latest Reviews</button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Most Relevant</a></li>
                            <li><a class="dropdown-item" href="#">Top Reviews</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    
        <!-- Single Review -->
        <div class="row mt-3">
            <div class="col-12">
                <div class="card p-3">
                    <div class="d-flex">
                        <span class="text-warning h5">★★★★★</span>
                        <div class="ms-3">
                            <h6>Bùi Thị Thu Trang</h6>
                            <p>Sản phẩm tuyệt vời, giao hàng nhanh.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <!-- Another Review -->
        <div class="row mt-3">
            <div class="col-12">
                <div class="card p-3">
                    <div class="d-flex">
                        <span class="text-warning h5">★★★★★</span>
                        <div class="ms-3">
                            <h6>Nguyễn Thúy An</h6>
                            <p>Sản phẩm đóng gói an toàn và giao hàng nhanh chóng.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <!-- Another Review -->
        <div class="row mt-3">
            <div class="col-12">
                <div class="card p-3">
                    <div class="d-flex">
                        <span class="text-warning h5">★★★★★</span>
                        <div class="ms-3">
                            <h6>Đoàn Ngọc Khánh Tuyền</h6>
                            <p>Đánh giá shipper 5 sao! Rất tuyệt vời.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    </div>
        
    <hr>
    <jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    var originalPrice = parseFloat("${pr.getPrice()}");

    function updatePrice() {
        var quantity = document.getElementById("num").value;
        var totalPrice = originalPrice * quantity;
        document.querySelector(".price").innerText = totalPrice.toFixed(2) + " đ"; // Cập nhật giá mới
    }

    function increaseQuantity() {
         event.preventDefault();
        var quantity = document.getElementById("num");
        quantity.value = parseInt(quantity.value) + 1; // Tăng số lượng lên 1
        updatePrice(); // Cập nhật giá sau khi tăng số lượng
    }

    function decreaseQuantity() {
        
         event.preventDefault();
        var quantity = document.getElementById("num");
        if (quantity.value > 1) {
            quantity.value = parseInt(quantity.value) - 1; // Giảm số lượng xuống 1
            updatePrice(); // Cập nhật giá sau khi giảm số lượng
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        updatePrice(); // Cập nhật giá ban đầu khi trang được tải
    });
</script>
</html>
