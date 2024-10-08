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
    <!-- Include Navbar -->
    <jsp:include page="header.jsp"></jsp:include>
     <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="shop">Trang chủ</a></li>
          <li class="breadcrumb-item active" aria-current="page">${category.getCate()}</li>
        </ol>
      </nav>
    <div class="container">
        <h1>SẢN PHẨM ĐỀ XUẤT</h1>
    </div>
    <div class="container">
        <div class="row">
            <c:forEach items="${pro}" var="p">
                <div class="col-md-3 col-sm-6 col-12">
                    <a href="Controllerdetail?id=${p.getId()}" class="text-decoration-none">
                        <div class="card" style="width: 18rem;">
                            <img src="${p.getImage()}" class="card-img-top" alt="${p.getName()}">
                            <div class="card-body">
                                <h5 class="card-title">${p.getName()}</h5>
                                <p class="card-text">${p.getDescription()}</p>
                                <p class="card-text">${p.getPrice()} VND</p>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp"></jsp:include>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>
