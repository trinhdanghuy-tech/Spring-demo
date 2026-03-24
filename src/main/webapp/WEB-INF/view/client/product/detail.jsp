<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/header.jsp" />

<!-- Breadcrumb -->
<div class="container py-4 mt-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="/" class="text-decoration-none text-muted">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#" class="text-decoration-none text-muted">Sản phẩm</a></li>
            <li class="breadcrumb-item active fw-medium" aria-current="page" style="color: var(--accent-color);">Chi tiết sản phẩm (Mã SP: ${id})</li>
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
                            <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=800&auto=format&fit=crop" class="img-fluid" alt="MacBook Pro" style="transition: transform 0.3s; cursor: pointer;" onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'">
                        </div>
                    </div>
                    <!-- Product Details -->
                    <div class="col-md-6 d-flex flex-column justify-content-center">
                        <h2 class="fw-bold mb-3" style="color: var(--text-main);">MacBook Pro 14" M2 Pro 2023</h2>
                        <div class="mb-2 text-muted fw-medium">
                            Danh mục: <a href="#" class="text-decoration-none" style="color: var(--accent-color);">Laptop Apple</a>
                        </div>
                        <h3 class="fw-bold mb-3" style="color: var(--accent-color);">48.990.000₫</h3>
                        
                        <!-- Rating -->
                        <div class="mb-4 text-warning">
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-fill"></i>
                            <i class="bi bi-star-half"></i>
                            <span class="text-muted ms-2">(4.8 / 120 đánh giá)</span>
                        </div>
                        
                        <!-- Description -->
                        <p class="text-muted mb-4 lh-base">
                            MacBook Pro 14 inch M2 Pro mang lại sức mạnh vượt trội với cấu hình CPU 10 nhân, GPU 16 nhân. Đem đến hiệu suất xử lý đồ hoạ và lập trình đỉnh cao, kết hợp cùng thời lượng pin lên đến 18 giờ.
                        </p>
                        
                        <!-- Action Area -->
                        <div class="d-flex align-items-center mt-auto mb-3">
                            <!-- Quantity Selector -->
                            <div class="input-group me-4 bg-white border rounded-pill overflow-hidden shadow-sm" style="width: 140px; height: 48px;">
                                <button class="btn btn-light border-0 text-muted px-3 fw-bold bg-transparent" type="button" id="btn-minus"><i class="bi bi-dash fs-5"></i></button>
                                <input type="text" class="form-control text-center border-0 fw-bold bg-transparent" value="1" id="quantity-input" aria-label="Quantity" readonly>
                                <button class="btn btn-light border-0 text-muted px-3 fw-bold bg-transparent" type="button" id="btn-plus"><i class="bi bi-plus fs-5"></i></button>
                            </div>
                            
                            <!-- Add to cart -->
                            <button class="btn btn-primary px-4 rounded-pill fw-semibold shadow-sm d-flex align-items-center gap-2 transition-all" style="height: 48px; background-color: var(--accent-color); border:none;" onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform='none'">
                                <i class="bi bi-bag-plus fs-5"></i> Thêm vào giỏ
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Extra Tabs (Description/Specs) -->
                <div class="row mt-5 pt-3">
                    <div class="col-12">
                        <ul class="nav nav-pills mb-3 border-bottom pb-2" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active rounded-pill fw-semibold me-2 px-4 shadow-sm" id="pills-desc-tab" data-bs-toggle="pill" data-bs-target="#pills-desc" type="button" role="tab" style="background-color: var(--accent-color);">Mô tả chi tiết</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link text-muted fw-semibold rounded-pill px-4" id="pills-specs-tab" data-bs-toggle="pill" data-bs-target="#pills-specs" type="button" role="tab" onmouseover="this.style.backgroundColor='#f1f5f9'" onmouseout="this.style.backgroundColor='transparent'">Thông số kỹ thuật</button>
                            </li>
                        </ul>
                        <div class="tab-content bg-white p-4 rounded-4 shadow-sm" id="pills-tabContent">
                            <div class="tab-pane fade show active text-muted" id="pills-desc" role="tabpanel">
                                <h5 class="fw-bold mb-3" style="color: var(--text-main);">Thiết kế đẳng cấp, màn hình sắc nét</h5>
                                <p class="mb-4">Sản phẩm được thiết kế bằng nhôm nguyên khối, mang lại sự mỏng nhẹ nhưng cực kỳ chắc chắn. Bàn phím Magic Keyboard gõ cực êm ái kết hợp hàng phím function kích thước chuẩn.</p>
                                <h5 class="fw-bold mb-3" style="color: var(--text-main);">Hiệu năng bứt phá</h5>
                                <p>Với chip thế hệ mới nhất, đáp ứng hoàn hảo từ công việc văn phòng đến thiết kế đồ hoạ 3D, dựng video 4K một cách mượt mà và không hề giật lag. Hệ thống tản nhiệt tiên tiến đảm bảo máy luôn hoạt động mát mẻ cả ngày dài.</p>
                            </div>
                            <div class="tab-pane fade text-muted" id="pills-specs" role="tabpanel">
                                <table class="table table-hover mt-2">
                                    <tbody>
                                        <tr><th scope="row" class="ps-3 py-3" style="width: 200px;">CPU</th><td class="py-3">Apple M2 Pro (10 lõi CPU, 16 lõi GPU)</td></tr>
                                        <tr><th scope="row" class="ps-3 py-3">RAM</th><td class="py-3">16GB Unified Memory băng thông cao</td></tr>
                                        <tr><th scope="row" class="ps-3 py-3">Ổ cứng</th><td class="py-3">512GB SSD chuẩn PCIe cho tốc độ siêu tốc</td></tr>
                                        <tr><th scope="row" class="ps-3 py-3">Màn hình</th><td class="py-3">14.2 inch Liquid Retina XDR (3024 x 1964), 120Hz ProMotion</td></tr>
                                        <tr><th scope="row" class="ps-3 py-3">Cổng giao tiếp</th><td class="py-3">3x Thunderbolt 4, HDMI, SDXC Card, MagSafe 3</td></tr>
                                        <tr><th scope="row" class="ps-3 py-3">Trọng lượng</th><td class="py-3 text-secondary">1.6 kg</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Right: Sidebar (Categories) -->
            <div class="col-lg-3">
                <div class="mb-5 bg-white p-4 rounded-4 shadow-sm border-top border-3" style="border-top-color: var(--accent-color) !important;">
                    <h4 class="fw-bold mb-4" style="color: var(--text-main);">Danh mục</h4>
                    <ul class="list-unstyled mb-0">
                        <li class="d-flex justify-content-between mb-3 border-bottom pb-2">
                            <a href="#" class="text-decoration-none text-muted fw-medium category-link d-flex align-items-center gap-2 transition-all">
                                <i class="bi bi-laptop fs-5 text-primary" style="color: var(--accent-color)!important;"></i> Apple
                            </a>
                            <span class="text-muted small align-self-center">(12)</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3 border-bottom pb-2">
                            <a href="#" class="text-decoration-none text-muted fw-medium category-link d-flex align-items-center gap-2 transition-all">
                                <i class="bi bi-laptop fs-5 text-primary" style="color: var(--accent-color)!important;"></i> Dell
                            </a>
                            <span class="text-muted small align-self-center">(24)</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3 border-bottom pb-2">
                            <a href="#" class="text-decoration-none text-muted fw-medium category-link d-flex align-items-center gap-2 transition-all">
                                <i class="bi bi-laptop fs-5 text-primary" style="color: var(--accent-color)!important;"></i> Asus
                            </a>
                            <span class="text-muted small align-self-center">(18)</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3 border-bottom pb-2">
                            <a href="#" class="text-decoration-none text-muted fw-medium category-link d-flex align-items-center gap-2 transition-all">
                                <i class="bi bi-laptop fs-5 text-primary" style="color: var(--accent-color)!important;"></i> Lenovo
                            </a>
                            <span class="text-muted small align-self-center">(15)</span>
                        </li>
                        <li class="d-flex justify-content-between mb-0 pb-0">
                            <a href="#" class="text-decoration-none text-muted fw-medium category-link d-flex align-items-center gap-2 transition-all">
                                <i class="bi bi-laptop fs-5 text-primary" style="color: var(--accent-color)!important;"></i> HP
                            </a>
                            <span class="text-muted small align-self-center">(9)</span>
                        </li>
                    </ul>
                </div>
                
                <!-- Featured Product banner / Call to action sidebar -->
                <div class="bg-primary text-white p-4 rounded-4 shadow-sm mb-5 position-relative overflow-hidden" style="background: linear-gradient(135deg, var(--accent-color) 0%, #1e3a8a 100%);">
                    <div class="position-relative z-1">
                        <h4 class="fw-bold mb-3">Tìm Laptop<br>Giáo Dục?</h4>
                        <p class="small text-white-50 mb-4">Giảm giá lên đến 20% cho học sinh - sinh viên.</p>
                        <a href="#" class="btn btn-light fw-bold rounded-pill shadow-sm px-4">Xem ngay</a>
                    </div>
                    <i class="bi bi-book position-absolute opacity-25" style="font-size: 150px; bottom: -40px; right: -20px;"></i>
                </div>
            </div>
            
        </div>
    </div>
</section>

<!-- Related Products Section (often found at the bottom of these pages) -->
<section class="py-5 mt-3" style="background-color: var(--bg-light);">
    <div class="container pb-5">
        <h3 class="fw-bold mb-4" style="color: var(--text-main);">Sản phẩm liên quan</h3>
        <div class="row g-4">
            <!-- Reuse standard product card structure -->
            <div class="col-xl-3 col-lg-4 col-md-6">
                <div class="product-card">
                    <div class="product-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1593642702821-c823b2816291?q=80&w=600&auto=format&fit=crop" class="product-img" alt="Dell XPS">
                    </div>
                    <div class="product-body">
                         <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class="text-muted small fw-semibold">Dell</span>
                            <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.8</div>
                        </div>
                        <h3 class="product-title">Dell XPS 13 Plus 9320</h3>
                        <hr class="text-muted opacity-25 mt-3 mb-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="product-price">43.590.000₫</div>
                            <button class="cart-btn" title="Thêm vào giỏ">
                                <i class="bi bi-cart-plus fs-5"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
             <div class="col-xl-3 col-lg-4 col-md-6">
                <div class="product-card">
                    <div class="position-absolute top-0 end-0 p-3 z-1">
                        <span class="badge bg-warning text-dark px-3 py-2 rounded-pill shadow-sm">-15%</span>
                    </div>
                    <div class="product-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1600861194942-f883de0dfe96?q=80&w=600&auto=format&fit=crop" class="product-img" alt="Asus ROG">
                    </div>
                    <div class="product-body">
                         <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class="text-muted small fw-semibold">Asus ROG</span>
                            <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.7</div>
                        </div>
                        <h3 class="product-title">Asus ROG Strix G15</h3>
                        <hr class="text-muted opacity-25 mt-3 mb-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="product-price fs-5">27.990.000₫</div>
                            <button class="cart-btn" title="Thêm vào giỏ">
                                <i class="bi bi-cart-plus fs-5"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-xl-3 col-lg-4 col-md-6 d-none d-lg-block">
                <div class="product-card">
                    <div class="product-img-wrapper" style="background: transparent;">
                        <img src="https://images.unsplash.com/photo-1544108182-8810058c3a7d?q=80&w=600&auto=format&fit=crop" class="product-img" alt="Lenovo ThinkPad">
                    </div>
                    <div class="product-body">
                         <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class="text-muted small fw-semibold">Lenovo</span>
                            <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.9</div>
                        </div>
                        <h3 class="product-title">ThinkPad X1 Carbon Gen 10</h3>
                        <hr class="text-muted opacity-25 mt-3 mb-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="product-price">38.990.000₫</div>
                            <button class="cart-btn" title="Thêm vào giỏ">
                                <i class="bi bi-cart-plus fs-5"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-xl-3 col-lg-4 col-md-6 d-none d-xl-block">
                <div class="product-card">
                    <div class="product-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?q=80&w=600&auto=format&fit=crop" class="product-img" alt="HP Spectre">
                    </div>
                    <div class="product-body">
                         <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class="text-muted small fw-semibold">HP</span>
                            <div class="text-warning small"><i class="bi bi-star-fill"></i> 4.8</div>
                        </div>
                        <h3 class="product-title">HP Spectre x360 14"</h3>
                        <hr class="text-muted opacity-25 mt-3 mb-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="product-price">41.990.000₫</div>
                            <button class="cart-btn" title="Thêm vào giỏ">
                                <i class="bi bi-cart-plus fs-5"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

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
