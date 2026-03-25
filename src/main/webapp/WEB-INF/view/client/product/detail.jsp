<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/header.jsp" />

<!-- Breadcrumb -->
<div class="container py-4 mt-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="/" class="text-decoration-none text-muted">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="/products" class="text-decoration-none text-muted">Sản phẩm</a></li>
            <li class="breadcrumb-item active fw-medium" aria-current="page" style="color: var(--accent-color);">${product.name}</li>
        </ol>
    </nav>
</div>

<!-- Single Product Section -->
<section class="py-4">
    <div class="container">
        <div class="row g-5">
            <!-- Left & Center: Product Form (Image & Info) -->
            <div class="col-lg-9">
                <div class="row g-5">
                    <!-- Product Image -->
                    <div class="col-md-6">
                        <div class="border rounded-4 p-4 text-center d-flex align-items-center justify-content-center bg-white shadow-sm" style="height: 100%; min-height: 450px;">
                            <img src="/images/product/${product.image}" class="img-fluid" alt="${product.name}" style="max-height: 380px; object-fit: contain; transition: transform 0.3s; cursor: pointer;" onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'">
                        </div>
                    </div>
                    <!-- Product Details -->
                    <div class="col-md-6 d-flex flex-column justify-content-center">
                        <h2 class="fw-bold mb-3" style="color: var(--text-main);">${product.name}</h2>
                        <div class="mb-2 text-muted fw-medium">
                            Hãng: <a href="/products" class="text-decoration-none" style="color: var(--accent-color);">${product.factory}</a>
                            <span class="mx-2">|</span>
                            Đối tượng: <span class="fw-semibold" style="color: var(--accent-color);">${product.target}</span>
                        </div>
                        <h3 class="fw-bold mb-3" style="color: var(--accent-color);"><fmt:formatNumber type="number" value="${product.price}" />₫</h3>
                        
                        <!-- Stock Info -->
                        <div class="mb-3 d-flex gap-3">
                            <span class="badge rounded-pill px-3 py-2 bg-light text-muted border">
                                <i class="bi bi-box-seam me-1"></i>Kho: ${product.quantity}
                            </span>
                            <span class="badge rounded-pill px-3 py-2 bg-light text-muted border">
                                <i class="bi bi-bag-check me-1"></i>Đã bán: ${product.sold}
                            </span>
                        </div>

                        <!-- Rating -->
                        <div class="mb-4 text-warning">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-half"></i>
                            <span class="text-muted ms-2">(4.8 / 120 đánh giá)</span>
                        </div>
                        
                        <!-- Short Description -->
                        <p class="text-muted mb-4 lh-base">${product.shortDesc}</p>
                        
                        <!-- Action Area -->
                        <form action="/cart/add" method="post" id="add-to-cart-form">
                            <input type="hidden" name="productId" value="${product.id}" />
                            <div class="d-flex align-items-center mt-auto mb-3">
                                <!-- Quantity Selector -->
                                <div class="input-group me-4 bg-white border rounded-pill overflow-hidden shadow-sm" style="width: 140px; height: 48px;">
                                    <button class="btn btn-light border-0 text-muted px-3 fw-bold bg-transparent" type="button" id="btn-minus"><i class="bi bi-dash fs-5"></i></button>
                                    <input type="text" class="form-control text-center border-0 fw-bold bg-transparent" value="1" name="quantity" id="quantity-input" aria-label="Quantity" readonly>
                                    <button class="btn btn-light border-0 text-muted px-3 fw-bold bg-transparent" type="button" id="btn-plus"><i class="bi bi-plus fs-5"></i></button>
                                </div>
                                
                                <!-- Add to cart -->
                                <button type="submit" class="btn btn-primary px-4 rounded-pill fw-semibold shadow-sm d-flex align-items-center gap-2 transition-all" style="height: 48px; background-color: var(--accent-color); border:none;" onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform='none'">
                                    <i class="bi bi-bag-plus fs-5"></i> Thêm vào giỏ
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <!-- Extra Tabs (Description/Specs) -->
                <div class="row mt-5 pt-3">
                    <div class="col-12">
                        <ul class="nav nav-pills mb-3 border-bottom pb-2" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active rounded-pill fw-semibold me-2 px-4 shadow-sm" id="pills-desc-tab" data-bs-toggle="pill" data-bs-target="#pills-desc" type="button" role="tab" style="background-color: var(--accent-color);">Mô tả chi tiết</button>
                            </li>
                        </ul>
                        <div class="tab-content bg-white p-4 rounded-4 shadow-sm" id="pills-tabContent">
                            <div class="tab-pane fade show active text-muted" id="pills-desc" role="tabpanel">
                                <p class="lh-lg">${product.detailDesc}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Right: Sidebar -->
            <div class="col-lg-3">
                <!-- Product Info Card -->
                <div class="mb-4 bg-white p-4 rounded-4 shadow-sm border-top border-3" style="border-top-color: var(--accent-color) !important;">
                    <h5 class="fw-bold mb-4" style="color: var(--text-main);"><i class="bi bi-info-circle me-2" style="color: var(--accent-color);"></i>Thông tin</h5>
                    <ul class="list-unstyled mb-0">
                        <li class="d-flex justify-content-between mb-3 pb-2 border-bottom">
                            <span class="text-muted"><i class="bi bi-building me-2"></i>Hãng</span>
                            <span class="fw-semibold">${product.factory}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3 pb-2 border-bottom">
                            <span class="text-muted"><i class="bi bi-people me-2"></i>Đối tượng</span>
                            <span class="fw-semibold">${product.target}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3 pb-2 border-bottom">
                            <span class="text-muted"><i class="bi bi-box-seam me-2"></i>Còn lại</span>
                            <span class="fw-semibold">${product.quantity} sp</span>
                        </li>
                        <li class="d-flex justify-content-between mb-0">
                            <span class="text-muted"><i class="bi bi-bag-check me-2"></i>Đã bán</span>
                            <span class="fw-semibold">${product.sold} sp</span>
                        </li>
                    </ul>
                </div>
                
                <!-- CTA banner -->
                <div class="bg-primary text-white p-4 rounded-4 shadow-sm mb-5 position-relative overflow-hidden" style="background: linear-gradient(135deg, var(--accent-color) 0%, #1e3a8a 100%);">
                    <div class="position-relative z-1">
                        <h4 class="fw-bold mb-3">Tìm Laptop<br>Giáo Dục?</h4>
                        <p class="small text-white-50 mb-4">Giảm giá lên đến 20% cho học sinh - sinh viên.</p>
                        <a href="/products" class="btn btn-light fw-bold rounded-pill shadow-sm px-4">Xem ngay</a>
                    </div>
                    <i class="bi bi-book position-absolute opacity-25" style="font-size: 150px; bottom: -40px; right: -20px;"></i>
                </div>
            </div>
            
        </div>
    </div>
</section>

<!-- Related Products Section -->
<c:if test="${not empty relatedProducts}">
<section class="py-5 mt-3" style="background-color: var(--bg-light);">
    <div class="container pb-5">
        <h3 class="fw-bold mb-4" style="color: var(--text-main);">Sản phẩm cùng hãng ${product.factory}</h3>
        <div class="row g-4">
            <c:forEach var="related" items="${relatedProducts}" varStatus="status">
                <c:if test="${status.index < 4}">
                    <div class="col-xl-3 col-lg-4 col-md-6">
                        <div class="product-card">
                            <div class="product-img-wrapper">
                                <img src="/images/product/${related.image}" class="product-img" alt="${related.name}">
                            </div>
                            <div class="product-body">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="text-muted small fw-semibold">${related.factory}</span>
                                    <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.9</div>
                                </div>
                                <h3 class="product-title"><a href="/product/${related.id}" class="text-decoration-none text-dark">${related.name}</a></h3>
                                <hr class="text-muted opacity-25 mt-3 mb-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="product-price"><fmt:formatNumber type="number" value="${related.price}" />₫</div>
                                    <form action="/cart/add" method="post">
                                        <input type="hidden" name="productId" value="${related.id}" />
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
    </div>
</section>
</c:if>

<!-- CSS & JS specific to detail page -->
<style>
    .category-link:hover {
        color: var(--accent-color) !important;
        transform: translateX(5px);
    }
    .nav-pills .nav-link:not(.active) {
        color: var(--text-muted);
    }
    input[type=text]:focus {
        outline: none !important;
        box-shadow: none !important;
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const btnMinus = document.getElementById("btn-minus");
        const btnPlus = document.getElementById("btn-plus");
        const quantityInput = document.getElementById("quantity-input");

        if (btnMinus && btnPlus && quantityInput) {
            btnMinus.addEventListener("click", () => {
                let val = parseInt(quantityInput.value) || 1;
                if (val > 1) {
                    quantityInput.value = val - 1;
                }
            });
            btnPlus.addEventListener("click", () => {
                let val = parseInt(quantityInput.value) || 1;
                quantityInput.value = val + 1;
            });
        }
    });
</script>

<jsp:include page="../layout/footer.jsp" />
