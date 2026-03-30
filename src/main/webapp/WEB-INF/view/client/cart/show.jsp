<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/header.jsp" />

<!-- Breadcrumb -->
<div class="container py-4 mt-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="/" class="text-decoration-none text-muted">Trang chủ</a></li>
            <li class="breadcrumb-item active fw-medium" aria-current="page" style="color: var(--accent-color);">Giỏ hàng</li>
        </ol>
    </nav>
</div>

<!-- Cart Section -->
<section class="py-4 mb-5">
    <div class="container">
        <h2 class="fw-bold mb-4" style="letter-spacing: -0.5px;">
            <i class="bi bi-cart3 me-2" style="color: var(--accent-color);"></i>Giỏ Hàng Của Bạn
        </h2>

        <c:choose>
            <c:when test="${empty cart.items}">
                <!-- Empty Cart -->
                <div class="text-center py-5">
                    <div class="mb-4">
                        <div class="d-inline-flex align-items-center justify-content-center rounded-circle bg-light" style="width: 120px; height: 120px;">
                            <i class="bi bi-cart-x" style="font-size: 3rem; color: var(--accent-color);"></i>
                        </div>
                    </div>
                    <h3 class="fw-bold text-dark mb-3">Giỏ hàng trống</h3>
                    <p class="text-muted mb-4 fs-5">Bạn chưa thêm sản phẩm nào vào giỏ hàng.</p>
                    <a href="/products" class="btn btn-primary btn-lg rounded-pill px-5 shadow-sm border-0" style="background-color: var(--accent-color);">
                        <i class="bi bi-laptop me-2"></i>Khám phá sản phẩm
                    </a>
                </div>
            </c:when>

            <c:otherwise>
                <div class="row g-4">
                    <!-- Cart Items -->
                    <div class="col-lg-8">
                        <div class="bg-white rounded-4 shadow-sm overflow-hidden">
                            <!-- Header -->
                            <div class="d-flex align-items-center px-4 py-3" style="background: linear-gradient(135deg, var(--accent-color) 0%, #1e3a8a 100%);">
                                <span class="text-white fw-semibold"><i class="bi bi-bag-check me-2"></i>${cart.totalQuantity} sản phẩm trong giỏ</span>
                            </div>

                            <!-- Items -->
                            <c:forEach var="item" items="${cart.items}" varStatus="status">
                                <div class="d-flex align-items-center p-4 ${!status.last ? 'border-bottom' : ''}">
                                    <!-- Product Image -->
                                    <div class="flex-shrink-0 me-4">
                                        <div class="rounded-3 overflow-hidden bg-light d-flex align-items-center justify-content-center" style="width: 100px; height: 100px;">
                                            <img src="/images/product/${item.image}" alt="${item.name}"
                                                class="img-fluid" style="max-height: 80px; object-fit: contain;">
                                        </div>
                                    </div>

                                    <!-- Product Info -->
                                    <div class="flex-grow-1">
                                        <h6 class="fw-bold mb-1" style="color: var(--text-main);">${item.name}</h6>
                                        <div class="d-flex align-items-center mb-3">
                                            <span class="text-muted small me-3">Số lượng:</span>
                                            <div class="d-flex align-items-center bg-light rounded-pill px-2 py-1 border shadow-sm">
                                                <form action="/cart/update-quantity" method="post" class="m-0 d-inline">
                                                    <input type="hidden" name="productId" value="${item.productId}" />
                                                    <input type="hidden" name="change" value="-1" />
                                                    <button type="submit" class="btn btn-sm btn-link text-dark p-0 border-0" 
                                                        style="text-decoration: none; width: 24px; height: 24px;"
                                                        title="Giảm số lượng">
                                                        <i class="bi bi-dash"></i>
                                                    </button>
                                                </form>
                                                <span class="px-3 fw-bold text-dark" style="min-width: 40px; text-align: center;">${item.quantity}</span>
                                                <form action="/cart/update-quantity" method="post" class="m-0 d-inline">
                                                    <input type="hidden" name="productId" value="${item.productId}" />
                                                    <input type="hidden" name="change" value="1" />
                                                    <button type="submit" class="btn btn-sm btn-link text-dark p-0 border-0" 
                                                        style="text-decoration: none; width: 24px; height: 24px;"
                                                        title="Tăng số lượng">
                                                        <i class="bi bi-plus"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="fw-bold" style="color: var(--accent-color); font-size: 1.1rem;">
                                            <fmt:formatNumber type="number" value="${item.subTotal}" />₫
                                        </div>
                                    </div>

                                    <!-- Price per unit + Remove -->
                                    <div class="text-end ms-3">
                                        <div class="text-muted small mb-2"><fmt:formatNumber type="number" value="${item.price}" />₫ / sp</div>
                                        <form action="/cart/remove" method="post" class="d-inline">
                                            <input type="hidden" name="productId" value="${item.productId}" />
                                            <button type="submit" class="btn btn-sm btn-outline-danger rounded-pill px-3"
                                                title="Xóa khỏi giỏ">
                                                <i class="bi bi-trash3 me-1"></i>Xóa
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Continue Shopping -->
                        <div class="mt-4">
                            <a href="/products" class="text-decoration-none fw-semibold" style="color: var(--accent-color);">
                                <i class="bi bi-arrow-left me-2"></i>Tiếp tục mua sắm
                            </a>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="col-lg-4">
                        <div class="bg-white rounded-4 shadow-sm p-4 sticky-top" style="top: 100px;">
                            <h5 class="fw-bold mb-4" style="color: var(--text-main);">
                                <i class="bi bi-receipt me-2" style="color: var(--accent-color);"></i>Tóm Tắt Đơn Hàng
                            </h5>

                            <div class="d-flex justify-content-between mb-3">
                                <span class="text-muted">Tạm tính</span>
                                <span class="fw-semibold"><fmt:formatNumber type="number" value="${cartTotalPrice}" />₫</span>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <span class="text-muted">Phí vận chuyển</span>
                                <span class="fw-semibold text-success">Miễn phí</span>
                            </div>

                            <hr class="my-3">

                            <div class="d-flex justify-content-between mb-4">
                                <span class="fw-bold fs-5">Tổng cộng</span>
                                <span class="fw-bold fs-5" style="color: var(--accent-color);">
                                    <fmt:formatNumber type="number" value="${cartTotalPrice}" />₫
                                </span>
                            </div>

                            <button class="btn btn-primary w-100 btn-lg rounded-pill fw-semibold shadow-sm border-0 mb-3"
                                style="background-color: var(--accent-color);"
                                onmouseover="this.style.transform='translateY(-2px)'"
                                onmouseout="this.style.transform='none'">
                                <i class="bi bi-credit-card me-2"></i>Thanh Toán
                            </button>

                            <!-- Trust badges -->
                            <div class="text-center mt-3">
                                <div class="d-flex justify-content-center gap-3 text-muted small">
                                    <span><i class="bi bi-shield-check text-success me-1"></i>Bảo mật</span>
                                    <span><i class="bi bi-truck text-primary me-1"></i>Giao nhanh</span>
                                    <span><i class="bi bi-arrow-counterclockwise text-warning me-1"></i>Đổi trả</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<jsp:include page="../layout/footer.jsp" />
