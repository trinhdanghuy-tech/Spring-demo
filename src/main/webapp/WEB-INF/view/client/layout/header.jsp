<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>LaptopVN - Cửa hàng Laptop chính hãng</title>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    
    <!-- Custom CSS -->
    <link href="/client/css/style.css" rel="stylesheet" />
</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-custom sticky-top">
        <div class="container py-2">
            <a class="navbar-brand d-flex align-items-center" href="/home">
                <div class="bg-primary text-white rounded p-2 me-2 shadow-sm" style="background-color: var(--accent-color)!important;">
                    <i class="bi bi-laptop"></i>
                </div>
                LaptopVN
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarMain">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="/">Trang chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="/products">Sản phẩm</a></li>
                </ul>
                <div class="d-flex align-items-center gap-4">
                    <a href="/cart" class="text-dark position-relative text-decoration-none">
                        <i class="bi bi-cart3 fs-5"></i>
                        <c:if test="${sessionScope.cartTotal != null && sessionScope.cartTotal > 0}">
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger shadow-sm border border-2 border-white">
                                ${sessionScope.cartTotal}
                                <span class="visually-hidden">Sản phẩm trong giỏ</span>
                            </span>
                        </c:if>
                    </a>
                    <c:choose>
                        <c:when test="${not empty pageContext.request.userPrincipal}">
                            <div class="dropdown">
                                <a class="btn btn-outline-secondary rounded-pill px-4 dropdown-toggle shadow-sm" href="#" role="button" data-bs-toggle="dropdown">
                                    <i class="bi bi-person-circle me-1"></i>${pageContext.request.userPrincipal.name}
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end shadow border-0 rounded-3">
                                    <li class="d-flex align-items-center flex-column" style="min-width: 30px;">
                                        <img src="https://ui-avatars.com/api/?name=${pageContext.request.userPrincipal.name}&background=random&color=fff" alt="" class="rounded-circle" style="width: 30px; height: 30px;">
                                    </li>
                                    <div class="text-center my-3">
                                        <p class="mb-0"> Xin chào, <b>${pageContext.request.userPrincipal.name}</b></p>
                                    </div>
                                    <li><a class="dropdown-item py-2" href="#"><i class="bi bi-person me-2"></i>Tài khoản</a></li>
                                    <li><a class="dropdown-item py-2" href="#"><i class="bi bi-bag me-2"></i>Đơn hàng</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li>
                                        <form action="/logout" method="post">
                                            <button type="submit" class="dropdown-item py-2 text-danger"><i class="bi bi-box-arrow-right me-2"></i>Đăng xuất</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="/login" class="btn btn-primary rounded-pill px-4 text-white hover-up shadow-sm" style="background-color: var(--primary-color); border:none;">Đăng nhập</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>
