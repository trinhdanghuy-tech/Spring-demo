<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/header.jsp" />

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container position-relative z-1">
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="badge bg-white text-primary mb-4 py-2 px-3 rounded-pill shadow-sm" style="color: var(--accent-color)!important; font-weight: 600;">
                        <i class="bi bi-star-fill text-warning me-1"></i> Siêu ưu đãi tháng - Giảm tới 30%
                    </div>
                    <h1 class="hero-title">Định Nghĩa Lại<br><span style="color: #60a5fa;">Sức Mạnh</span> Công Nghệ.</h1>
                    <p class="hero-subtitle">Khám phá bộ sưu tập laptop cao cấp với hiệu năng vượt trội. Trải nghiệm làm việc và giải trí đỉnh cao ở mọi nơi.</p>
                    <div class="d-flex gap-3 flex-wrap">
                        <a href="#" class="btn btn-custom">Mua Ngay <i class="bi bi-arrow-right ms-2"></i></a>
                        <a href="#" class="btn btn-outline-custom">Khám phá dòng sản phẩm</a>
                    </div>
                </div>
                <div class="col-lg-5 text-center">
                    <div class="hero-img-container">
                        <img src="https://images.unsplash.com/photo-1531297122539-5692b6982abc?q=80&w=1000&auto=format&fit=crop" class="img-fluid rounded-4 shadow-lg" alt="Premium Laptop" style="border: 1px solid rgba(255,255,255,0.1);">
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
                    <div class="p-4 bg-white rounded-4 shadow-sm h-100 d-flex flex-column align-items-center justify-content-center transition-all" style="border: 0.5px solid rgba(0,0,0,0.15); transition: transform 0.3s; cursor:pointer;" onmouseover="this.style.transform='translateY(-5px)'" onmouseout="this.style.transform='none'">
                        <div class="bg-light rounded-circle p-3 mb-3 d-inline-flex" style="color: var(--accent-color);">
                            <i class="bi bi-truck fs-3"></i>
                        </div>
                        <h6 class="fw-bold mb-2">Giao hàng miễn phí</h6>
                        <p class="text-muted small mb-0">Áp dụng cho mọi đơn hàng</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="p-4 bg-white rounded-4 shadow-sm h-100 d-flex flex-column align-items-center justify-content-center transition-all" style="border: 0.5px solid rgba(0,0,0,0.15); transition: transform 0.3s; cursor:pointer;" onmouseover="this.style.transform='translateY(-5px)'" onmouseout="this.style.transform='none'">
                        <div class="bg-light rounded-circle p-3 mb-3 d-inline-flex" style="color: var(--accent-color);">
                            <i class="bi bi-shield-check fs-3"></i>
                        </div>
                        <h6 class="fw-bold mb-2">Bảo hành chính hãng</h6>
                        <p class="text-muted small mb-0">Cam kết 100% chính hãng</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="p-4 bg-white rounded-4 shadow-sm h-100 d-flex flex-column align-items-center justify-content-center transition-all" style="border: 0.5px solid rgba(0,0,0,0.15); transition: transform 0.3s; cursor:pointer;" onmouseover="this.style.transform='translateY(-5px)'" onmouseout="this.style.transform='none'">
                        <div class="bg-light rounded-circle p-3 mb-3 d-inline-flex" style="color: var(--accent-color);">
                            <i class="bi bi-arrow-counterclockwise fs-3"></i>
                        </div>
                        <h6 class="fw-bold mb-2">Đổi trả 30 ngày</h6>
                        <p class="text-muted small mb-0">Lỗi 1 đổi 1 nhanh chóng</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="p-4 bg-white rounded-4 shadow-sm h-100 d-flex flex-column align-items-center justify-content-center transition-all" style="border: 0.5px solid rgba(0,0,0,0.15); transition: transform 0.3s; cursor:pointer;" onmouseover="this.style.transform='translateY(-5px)'" onmouseout="this.style.transform='none'">
                        <div class="bg-light rounded-circle p-3 mb-3 d-inline-flex" style="color: var(--accent-color);">
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
                    <h6 class="fw-bold text-uppercase mb-2" style="color: var(--accent-color); letter-spacing: 1px; font-size: 0.85rem;">Sản phẩm nổi bật</h6>
                    <h2 class="fw-bold mb-0" style="letter-spacing: -0.5px;">Laptop Bán Chạy Nhất</h2>
                </div>
                <a href="#" class="text-decoration-none fw-semibold d-none d-md-block" style="color: var(--primary-color);">Xem tất cả <i class="bi bi-arrow-right ms-1"></i></a>
            </div>

            <div class="row g-4 mb-5">
                <!-- Data from backend: c:forEach logic -->
                <!-- <c:forEach var="product" items="\${products}"> ... </c:forEach> -->
                
                <!-- Example Product 1 -->
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="product-card">
                        <div class="position-absolute top-0 end-0 p-3 z-1">
                            <span class="badge bg-danger px-3 py-2 rounded-pill shadow-sm">Mới nhất</span>
                        </div>
                        <div class="product-img-wrapper">
                            <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=600&auto=format&fit=crop" class="product-img" alt="MacBook">
                        </div>
                        <div class="product-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted small fw-semibold">Apple</span>
                                <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.9 (120)</div>
                            </div>
                            <h3 class="product-title"><a href="/product/1" class="text-decoration-none text-dark">MacBook Pro 14" M2 Pro 2023 (10-core CPU, 16-core GPU)</a></h3>
                            <div class="product-specs">
                                <span><i class="bi bi-cpu"></i>M2 Pro</span>
                                <span><i class="bi bi-memory"></i>16GB RAM</span>
                                <span><i class="bi bi-device-hdd"></i>512GB SSD</span>
                            </div>
                            <hr class="text-muted opacity-25">
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <div class="product-price">48.990.000₫</div>
                                <button class="cart-btn" title="Thêm vào giỏ">
                                    <i class="bi bi-cart-plus fs-5"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Example Product 2 -->
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="product-card">
                        <div class="product-img-wrapper">
                            <img src="https://images.unsplash.com/photo-1593642702821-c823b2816291?q=80&w=600&auto=format&fit=crop" class="product-img" alt="Dell XPS">
                        </div>
                        <div class="product-body">
                             <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted small fw-semibold">Dell</span>
                                <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.8 (85)</div>
                            </div>
                            <h3 class="product-title"><a href="/product/2" class="text-decoration-none text-dark">Dell XPS 13 Plus 9320 Màn OLED Siêu Phẩm</a></h3>
                            <div class="product-specs">
                                <span><i class="bi bi-cpu"></i>Core i7 1260P</span>
                                <span><i class="bi bi-memory"></i>16GB RAM</span>
                                <span><i class="bi bi-device-hdd"></i>1TB SSD</span>
                            </div>
                            <hr class="text-muted opacity-25">
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <div class="product-price">43.590.000₫</div>
                                <button class="cart-btn" title="Thêm vào giỏ">
                                    <i class="bi bi-cart-plus fs-5"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Example Product 3 -->
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="product-card">
                        <div class="position-absolute top-0 end-0 p-3 z-1">
                            <span class="badge bg-warning text-dark px-3 py-2 rounded-pill shadow-sm">-15% SALE</span>
                        </div>
                        <div class="product-img-wrapper">
                            <img src="https://images.unsplash.com/photo-1600861194942-f883de0dfe96?q=80&w=600&auto=format&fit=crop" class="product-img" alt="Asus ROG">
                        </div>
                        <div class="product-body">
                             <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted small fw-semibold">Asus ROG</span>
                                <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.7 (200)</div>
                            </div>
                            <h3 class="product-title"><a href="/product/3" class="text-decoration-none text-dark">Asus ROG Strix G15 Gaming Edition Cực Đỉnh</a></h3>
                            <div class="product-specs">
                                <span><i class="bi bi-cpu"></i>Ryzen 7 6800H</span>
                                <span><i class="bi bi-gpu-card"></i>RTX 3060</span>
                                <span><i class="bi bi-device-hdd"></i>512GB SSD</span>
                            </div>
                            <hr class="text-muted opacity-25">
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <div>
                                    <div class="text-decoration-line-through text-muted small">32.990.000₫</div>
                                    <div class="product-price fs-5">27.990.000₫</div>
                                </div>
                                <button class="cart-btn" title="Thêm vào giỏ">
                                    <i class="bi bi-cart-plus fs-5"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Example Product 4 -->
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="product-card">
                        <div class="product-img-wrapper" style="background: transparent;">
                            <img src="https://images.unsplash.com/photo-1544108182-8810058c3a7d?q=80&w=600&auto=format&fit=crop" class="product-img" alt="Lenovo ThinkPad">
                        </div>
                        <div class="product-body">
                             <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="text-muted small fw-semibold">Lenovo</span>
                                <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.9 (45)</div>
                            </div>
                            <h3 class="product-title"><a href="/product/4" class="text-decoration-none text-dark">ThinkPad X1 Carbon Gen 10 Dành Cho Doanh Nhân</a></h3>
                            <div class="product-specs">
                                <span><i class="bi bi-cpu"></i>Core i5 1240P</span>
                                <span><i class="bi bi-memory"></i>16GB RAM</span>
                                <span><i class="bi bi-device-hdd"></i>512GB SSD</span>
                            </div>
                            <hr class="text-muted opacity-25">
                            <div class="d-flex justify-content-between align-items-center mt-3">
                                <div class="product-price">38.990.000₫</div>
                                <button class="cart-btn" title="Thêm vào giỏ">
                                    <i class="bi bi-cart-plus fs-5"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="text-center d-md-none mt-4">
                <a href="#" class="btn btn-outline-primary rounded-pill px-4">Xem tất cả sản phẩm</a>
            </div>
        </div>
    </section>

<jsp:include page="../layout/footer.jsp" />
