<%-- 
    Document   : cart.jsp
    Created on : Oct 8, 2024, 9:41:16 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="header.jsp"></jsp:include>
         <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="shop">Trang chủ</a></li>
          <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
        </ol>
      </nav>
            <!-- Shopping Cart Section -->
            <!-- Shopping Cart Section -->
            <div class="container mt-5">
                <h2 class="text-center">Giỏ Hàng Của Bạn</h2>
                <div class="row mt-4">
                <c:forEach items="${sessionScope.cart}" var="p">
                    <form action="removeProduct">
                    <div class="col-md-12">
                        
                        <div class="card mb-3">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="${p.getProduct().getImage()}" class="img-fluid rounded-start" alt="Product Image">
                                </div>
                                
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title">${p.getProduct().getName()}</h5>
                                        <p class="card-text">Giá: <span class="price text-danger" id="price">${p.getProduct().getPrice()}</span></p>
                                        <div class="input-group mb-3">


                                                
                                            <button type="button" class="btn btn-secondary" onclick="decreaseQuantity('${p.getProduct().getId()}')">-</button>
                                            <input type="number" id="num-${p.getProduct().getId()}" class="form-control" value="${p.getNum()}" min="1"  >
                                            <button type="button" class="btn btn-secondary" onclick="increaseQuantity('${p.getProduct().getId()}')">+</button>

                                        </div>


                                        <input type="hidden" id="productId" name="productId" value="${p.getProduct().getId()}">
                                        <input type="submit" class="btn btn-danger btn-lg" value="Xóa">

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </c:forEach>               

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Tóm Tắt Đơn Hàng</h5>
                            <p>Tổng: <span id="totalPrice" class="total-price text-danger"></span></p>
                            <button class="btn btn-success w-100" onclick="checkout()">Thanh Toán</button>
                        </div>
                    </div>
                </div>


            </div>
        </div>

        <!-- Modal (Popup) for Success Message -->
        <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="successModalLabel">Mua Hàng Thành Công</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <p>Chúc mừng! Bạn đã mua hàng thành công.</p>
                       
                    </div>
                    <form action="success">
                    <div class="modal-footer">
    <input type="submit" class="btn btn-secondary" data-bs-dismiss="modal" value="OK">
</div>

                    </form>
                </div>
            </div>
        </div>

        <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Bootstrap JS and Popper.js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

        <!-- JavaScript for Checkout Button -->
        <script>
                                function checkout() {
                                    // Trigger the modal to open
                                    var myModal = new bootstrap.Modal(document.getElementById('successModal'));
                                    myModal.show();
                                }

                                // Cập nhật tổng cho toàn bộ giỏ hàng
                                function updateTotal() {
                                    let total = 0;
                                    // Lặp qua tất cả sản phẩm trong giỏ hàng
                                    var prices = document.querySelectorAll('.price'); // Lấy tất cả các phần tử giá
                                    var quantities = document.querySelectorAll('input[type="number"]'); // Lấy tất cả các input số lượng

                                    for (let i = 0; i < prices.length; i++) {
                                        const productPrice = parseFloat(prices[i].innerText);
                                        const productQuantity = parseInt(quantities[i].value); // Lấy số lượng sản phẩm
                                        total += productPrice * productQuantity; // Cộng dồn tổng giá trị
                                    }

                                    document.getElementById("totalPrice").innerText = total.toFixed(1) + " đ"; // Cập nhật tổng
                                }

                                function increaseQuantity(productId) {
                                    event.preventDefault();
                                    var quantity = document.getElementById("num-" + productId);
                                    quantity.value = parseInt(quantity.value) + 1; // Tăng số lượng lên 1
                                    updateTotal(); // Cập nhật tổng sau khi tăng số lượng
                                }

                                function decreaseQuantity(productId) {
                                    event.preventDefault();
                                    var quantity = document.getElementById("num-" + productId);
                                    if (quantity.value > 1) {
                                        quantity.value = parseInt(quantity.value) - 1; // Giảm số lượng đi 1
                                        updateTotal(); // Cập nhật tổng sau khi giảm số lượng
                                    }
                                }

                                document.addEventListener("DOMContentLoaded", function () {
                                    updateTotal(); // Cập nhật giá ban đầu khi trang được tải
                                });
        </script>




    </body>
</html>

