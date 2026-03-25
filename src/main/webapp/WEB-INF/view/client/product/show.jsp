<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/header.jsp" />

<!-- Breadcrumb -->
<div class="container py-4 mt-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="/" class="text-decoration-none text-muted">Trang chủ</a></li>
            <li class="breadcrumb-item active fw-medium" aria-current="page" style="color: var(--accent-color);">Tất cả sản phẩm</li>
        </ol>
    </nav>
</div>

<!-- All Products Section -->
<section class="py-4 mb-5">
    <div class="container">
        <div class="d-flex justify-content-between align-items-end mb-5">
            <div>
                <h6 class="fw-bold text-uppercase mb-2"
                    style="color: var(--accent-color); letter-spacing: 1px; font-size: 0.85rem;">Bộ sưu tập</h6>
                <h2 class="fw-bold mb-0" style="letter-spacing: -0.5px;">Tất Cả Sản Phẩm</h2>
            </div>
            <span class="text-muted fw-medium">${products.size()} sản phẩm</span>
        </div>

        <div class="row g-4">
            <c:forEach var="product" items="${products}">
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="product-card">
                        <div class="product-img-wrapper">
                            <img src="/images/product/${product.image}"
                                class="product-img" alt="${product.name}">
                        </div>
                        <div class="product-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted small fw-semibold">${product.factory}</span>
                                <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.9</div>
                            </div>
                            <h3 class="product-title"><a href="/product/${product.id}"
                                    class="text-decoration-none text-dark">${product.name}</a></h3>
                            <p class="text-muted small mb-2" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; line-clamp: 2;">${product.shortDesc}</p>
                            <hr class="text-muted opacity-25">
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <div class="product-price"><fmt:formatNumber type="number" value="${product.price}" />₫</div>
                                <form action="/cart/add" method="post">
                                    <input type="hidden" name="productId" value="${product.id}" />
                                    <input type="hidden" name="quantity" value="1" />
                                    <button type="submit" class="cart-btn" title="Thêm vào giỏ">
                                        <i class="bi bi-cart-plus fs-5"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Empty state -->
        <c:if test="${empty products}">
            <div class="text-center py-5">
                <i class="bi bi-box-seam fs-1 text-muted mb-3 d-block"></i>
                <h4 class="text-muted">Chưa có sản phẩm nào</h4>
                <p class="text-muted">Hãy quay lại sau nhé!</p>
            </div>
        </c:if>
    </div>
</section>

<jsp:include page="../layout/footer.jsp" />
