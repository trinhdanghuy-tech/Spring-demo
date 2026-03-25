<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <jsp:include page="../layout/header.jsp" />

        <!-- Hero Section -->
        <section class="hero-section pt-3">
            <div class="position-relative d-flex align-items-center" style="margin: 0 5px; border-radius: 24px; overflow: hidden; background: url('/images/product/hero_section.png') no-repeat center center; background-size: cover; min-height: 80vh; box-shadow: 0 8px 30px rgba(0,0,0,0.15);">
                <div class="position-absolute top-0 start-0 w-100 h-100" style="background: linear-gradient(to right, rgba(15, 23, 42, 0.95) 0%, rgba(15, 23, 42, 0.7) 40%, rgba(15, 23, 42, 0.1) 100%);"></div>
                <div class="container position-relative z-1 py-5">
                    <div class="row align-items-center">
                        <div class="col-lg-7 col-xl-6 text-white text-start">
                            <div class="badge mb-4 py-2 px-3 rounded-pill shadow-sm"
                                style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); color: #bfdbfe!important; font-weight: 600; border: 1px solid rgba(255,255,255,0.2);">
                                <i class="bi bi-star-fill text-warning me-1"></i> Siêu ưu đãi tháng - Giảm tới 30%
                            </div>
                            <h1 class="hero-title fw-bold text-white mb-4" style="font-size: 3.5rem; letter-spacing: -1px; line-height: 1.2;">Định Nghĩa Lại<br><span style="color: #60a5fa;">Sức Mạnh</span> Công Nghệ.</h1>
                            <p class="hero-subtitle mb-4 text-light opacity-75 fs-5">Khám phá bộ sưu tập laptop cao cấp với hiệu năng vượt trội. Trải nghiệm làm việc và giải trí đỉnh cao ở mọi nơi.</p>
                            <div class="d-flex gap-3 flex-wrap">
                                <a href="#" class="btn btn-primary btn-lg rounded-pill px-5 shadow-lg border-0" style="background-color: var(--accent-color);">Mua Ngay <i class="bi bi-arrow-right ms-2"></i></a>
                                <a href="#" class="btn btn-outline-light btn-lg rounded-pill px-4">Khám phá dòng sản phẩm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features -->
        <section class="py-2 mb-5">
            <div class="container">
                <div class="row g-4 text-center justify-content-center">
                    <div class="col-lg-3 col-md-6">
                        <div class="p-4 bg-white rounded-4 shadow-sm h-100 d-flex flex-column align-items-center justify-content-center transition-all"
                            style="border: 0.5px solid rgba(0,0,0,0.15); transition: transform 0.3s; cursor:pointer;"
                            onmouseover="this.style.transform='translateY(-5px)'"
                            onmouseout="this.style.transform='none'">
                            <div class="bg-light rounded-circle p-3 mb-3 d-inline-flex"
                                style="color: var(--accent-color);">
                                <i class="bi bi-truck fs-3"></i>
                            </div>
                            <h6 class="fw-bold mb-2">Giao hàng miễn phí</h6>
                            <p class="text-muted small mb-0">Áp dụng cho mọi đơn hàng</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="p-4 bg-white rounded-4 shadow-sm h-100 d-flex flex-column align-items-center justify-content-center transition-all"
                            style="border: 0.5px solid rgba(0,0,0,0.15); transition: transform 0.3s; cursor:pointer;"
                            onmouseover="this.style.transform='translateY(-5px)'"
                            onmouseout="this.style.transform='none'">
                            <div class="bg-light rounded-circle p-3 mb-3 d-inline-flex"
                                style="color: var(--accent-color);">
                                <i class="bi bi-shield-check fs-3"></i>
                            </div>
                            <h6 class="fw-bold mb-2">Bảo hành chính hãng</h6>
                            <p class="text-muted small mb-0">Cam kết 100% chính hãng</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="p-4 bg-white rounded-4 shadow-sm h-100 d-flex flex-column align-items-center justify-content-center transition-all"
                            style="border: 0.5px solid rgba(0,0,0,0.15); transition: transform 0.3s; cursor:pointer;"
                            onmouseover="this.style.transform='translateY(-5px)'"
                            onmouseout="this.style.transform='none'">
                            <div class="bg-light rounded-circle p-3 mb-3 d-inline-flex"
                                style="color: var(--accent-color);">
                                <i class="bi bi-arrow-counterclockwise fs-3"></i>
                            </div>
                            <h6 class="fw-bold mb-2">Đổi trả 30 ngày</h6>
                            <p class="text-muted small mb-0">Lỗi 1 đổi 1 nhanh chóng</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="p-4 bg-white rounded-4 shadow-sm h-100 d-flex flex-column align-items-center justify-content-center transition-all"
                            style="border: 0.5px solid rgba(0,0,0,0.15); transition: transform 0.3s; cursor:pointer;"
                            onmouseover="this.style.transform='translateY(-5px)'"
                            onmouseout="this.style.transform='none'">
                            <div class="bg-light rounded-circle p-3 mb-3 d-inline-flex"
                                style="color: var(--accent-color);">
                                <i class="bi bi-headset fs-3"></i>
                            </div>
                            <h6 class="fw-bold mb-2">Hỗ trợ 24/7</h6>
                            <p class="text-muted small mb-0">Luôn đồng hành cùng bạn</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Product Grid -->
        <section class="py-5" style="background-color: #f8fafc;">
            <div class="container">
                <div class="d-flex justify-content-between align-items-end mb-5">
                    <div>
                        <h6 class="fw-bold text-uppercase mb-2"
                            style="color: var(--accent-color); letter-spacing: 1px; font-size: 0.85rem;">Sản phẩm nổi
                            bật</h6>
                        <h2 class="fw-bold mb-0" style="letter-spacing: -0.5px;">Laptop Bán Chạy Nhất</h2>
                    </div>
                    <a href="/products" class="text-decoration-none fw-semibold d-none d-md-block"
                        style="color: var(--primary-color);">Xem tất cả <i class="bi bi-arrow-right ms-1"></i></a>
                </div>

                <div class="row g-4 mb-5">
                    <c:forEach var="product" items="${products}" varStatus="status">
                        <c:if test="${status.index < 4}">
                            <div class="col-xl-3 col-lg-4 col-md-6">
                                <div class="product-card">
                                    <c:if test="${status.index == 0}">
                                        <div class="position-absolute top-0 end-0 p-3 z-1">
                                            <span class="badge bg-danger px-3 py-2 rounded-pill shadow-sm">Mới nhất</span>
                                        </div>
                                    </c:if>
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
                                        <p class="text-muted small mb-2" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">${product.shortDesc}</p>
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
                        </c:if>
                    </c:forEach>
                </div>

                <div class="text-center d-md-none mt-4">
                    <a href="/products" class="btn btn-outline-primary rounded-pill px-4">Xem tất cả sản phẩm</a>
                </div>
            </div>
        </section>

        <jsp:include page="../layout/footer.jsp" />