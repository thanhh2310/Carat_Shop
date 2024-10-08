<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">

<div class="container">
    <header class="border-bottom lh-1 py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-2 pt-1">
                <a class="link-secondary" href="shop"><img class="logo" src="source/logo_real.jpg" alt=""></a>
            </div>
           <div class="col-8 text-center">
               <form action="search">       
    <div class="input-group">
        <input type="search" class="form-control" placeholder="Search..." aria-label="Search" name='search_input'>
        <button class="btn btn-outline-secondary" type="submit">
            <i class="bi bi-search"></i>
        </button>
    </div>
           </form>
</div>

            <div class="col-2 d-flex justify-content-end align-items-center">
                <a class="btn btn-sm btn-outline-secondary" href="cart.jsp">Giỏ hàng</a>
                
            </div>
        </div>
        
        <nav class="nav nav-underline justify-content-between">
            <c:forEach items="${cate}" var="p">
                <a class="nav-item nav-link link-body-emphasis" href="ControllerCategory?idcate=${p.getId()}">${p.getCate()}</a>
            </c:forEach>
        </nav>
    </header>
</div>
