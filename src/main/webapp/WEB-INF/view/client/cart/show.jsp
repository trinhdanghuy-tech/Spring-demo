<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../layout/header.jsp" />

<div class="container py-4 mt-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="/" class="text-decoration-none text-muted">Trang chủ</a></li>
            <li class="breadcrumb-item active fw-medium" aria-current="page" style="color: var(--accent-color);">Thanh toán</li>
        </ol>
    </nav>
</div>

<section class="py-4 mb-5">
    <div class="container">
        <div class="checkout-hero mb-4">
            <div>
                <span class="checkout-kicker">Secure Checkout</span>
                <h1 class="checkout-title mb-2">Hoàn tất đơn hàng laptop của bạn</h1>
                <p class="checkout-subtitle mb-0">Kiểm tra giỏ hàng, điền thông tin giao nhận và chọn phương thức thanh toán trong một bước.</p>
            </div>
            <div class="checkout-hero-meta">
                <span><i class="bi bi-shield-check"></i>Bảo mật SSL</span>
                <span><i class="bi bi-lightning-charge"></i>Xử lý nhanh</span>
                <span><i class="bi bi-box-seam"></i>Giữ hàng theo đơn</span>
            </div>
        </div>

        <c:choose>
            <c:when test="${empty cart.items}">
                <div class="text-center py-5 bg-white rounded-4 shadow-sm">
                    <div class="mb-4">
                        <div class="d-inline-flex align-items-center justify-content-center rounded-circle bg-light" style="width: 120px; height: 120px;">
                            <i class="bi bi-cart-x" style="font-size: 3rem; color: var(--accent-color);"></i>
                        </div>
                    </div>
                    <h3 class="fw-bold text-dark mb-3">Giỏ hàng đang trống</h3>
                    <p class="text-muted mb-4 fs-5">Bạn chưa thêm sản phẩm nào để tiến hành thanh toán.</p>
                    <a href="/products" class="btn btn-primary btn-lg rounded-pill px-5 shadow-sm border-0" style="background-color: var(--accent-color);">
                        <i class="bi bi-laptop me-2"></i>Chọn sản phẩm ngay
                    </a>
                </div>
            </c:when>

            <c:otherwise>
                <div class="row g-4 align-items-start">
                    <div class="col-xl-7">
                        <div class="checkout-panel bg-white rounded-4 shadow-sm overflow-hidden">
                            <div class="checkout-panel-head">
                                <div>
                                    <h2 class="mb-1">Giỏ hàng của bạn</h2>
                                    <p class="mb-0">${cart.totalQuantity} sản phẩm đã sẵn sàng để đặt</p>
                                </div>
                                <a href="/products" class="checkout-link">Thêm sản phẩm</a>
                            </div>

                            <c:forEach var="item" items="${cart.items}" varStatus="status">
                                <div class="checkout-item ${!status.last ? 'checkout-item-border' : ''}">
                                    <div class="checkout-item-media">
                                        <img src="/images/product/${item.image}" alt="${item.name}" class="img-fluid">
                                    </div>

                                    <div class="flex-grow-1">
                                        <h6 class="fw-bold mb-1">${item.name}</h6>
                                        <div class="text-muted small mb-3">Đơn giá <fmt:formatNumber type="number" value="${item.price}" />₫</div>
                                        <div class="d-flex align-items-center gap-3 flex-wrap">
                                            <div class="quantity-pill">
                                                <form action="/cart/update-quantity" method="post" class="m-0">
                                                    <input type="hidden" name="productId" value="${item.productId}" />
                                                    <input type="hidden" name="change" value="-1" />
                                                    <button type="submit" class="btn btn-link p-0 border-0 text-dark">
                                                        <i class="bi bi-dash"></i>
                                                    </button>
                                                </form>
                                                <span>${item.quantity}</span>
                                                <form action="/cart/update-quantity" method="post" class="m-0">
                                                    <input type="hidden" name="productId" value="${item.productId}" />
                                                    <input type="hidden" name="change" value="1" />
                                                    <button type="submit" class="btn btn-link p-0 border-0 text-dark">
                                                        <i class="bi bi-plus"></i>
                                                    </button>
                                                </form>
                                            </div>
                                            <form action="/cart/remove" method="post" class="d-inline">
                                                <input type="hidden" name="productId" value="${item.productId}" />
                                                <button type="submit" class="btn btn-sm btn-outline-danger rounded-pill px-3">
                                                    <i class="bi bi-trash3 me-1"></i>Xóa
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="checkout-item-price">
                                        <fmt:formatNumber type="number" value="${item.subTotal}" />₫
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-xl-5">
                        <form:form action="/cart/checkout" method="post" modelAttribute="checkoutForm" cssClass="checkout-form-wrap">
                            <div class="checkout-card checkout-summary-card mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h3 class="mb-0">Tóm tắt đơn hàng</h3>
                                    <span class="badge rounded-pill text-bg-light">${cart.totalQuantity} món</span>
                                </div>

                                <div class="summary-row">
                                    <span>Tạm tính</span>
                                    <strong><fmt:formatNumber type="number" value="${cartTotalPrice}" />₫</strong>
                                </div>
                                <div class="summary-row">
                                    <span>Phí vận chuyển</span>
                                    <strong class="text-success">Miễn phí</strong>
                                </div>
                                <div class="summary-row">
                                    <span>Ưu đãi giao nhanh</span>
                                    <strong>Giao trong 2-4 giờ nội thành</strong>
                                </div>

                                <hr class="my-4">

                                <div class="summary-row total">
                                    <span>Tổng thanh toán</span>
                                    <strong><fmt:formatNumber type="number" value="${cartTotalPrice}" />₫</strong>
                                </div>
                            </div>

                            <div class="checkout-card">
                                <div class="mb-4">
                                    <span class="checkout-kicker">Delivery Info</span>
                                    <h3 class="mb-1">Thông tin nhận hàng</h3>
                                    <p class="text-muted mb-0">Chúng tôi sẽ liên hệ xác nhận đơn ngay sau khi bạn hoàn tất thanh toán.</p>
                                </div>

                                <c:if test="${not empty checkoutError}">
                                    <div class="alert alert-danger rounded-4">${checkoutError}</div>
                                </c:if>

                                <div class="mb-3">
                                    <label for="fullName" class="form-label fw-semibold">Họ và tên</label>
                                    <form:input path="fullName" id="fullName" cssClass="form-control checkout-input" placeholder="Nguyễn Văn A" />
                                    <form:errors path="fullName" cssClass="text-danger small mt-2 d-block" />
                                </div>

                                <div class="mb-3">
                                    <label for="phone" class="form-label fw-semibold">Số điện thoại</label>
                                    <form:input path="phone" id="phone" cssClass="form-control checkout-input" placeholder="0901234567" />
                                    <form:errors path="phone" cssClass="text-danger small mt-2 d-block" />
                                </div>

                                <div class="mb-3">
                                    <label for="address" class="form-label fw-semibold">Địa chỉ giao hàng</label>
                                    <form:textarea path="address" id="address" cssClass="form-control checkout-input checkout-textarea" placeholder="Số nhà, đường, phường/xã, quận/huyện, tỉnh/thành phố" />
                                    <form:errors path="address" cssClass="text-danger small mt-2 d-block" />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-semibold">Phương thức thanh toán</label>
                                    <div class="payment-grid">
                                        <label class="payment-option">
                                            <form:radiobutton path="paymentMethod" value="Thanh toán khi nhận hàng" />
                                            <span>
                                                <strong>Thanh toán khi nhận hàng</strong>
                                                <small>Phù hợp cho đơn giao nhanh nội thành</small>
                                            </span>
                                        </label>
                                        <label class="payment-option">
                                            <form:radiobutton path="paymentMethod" value="Chuyển khoản ngân hàng" />
                                            <span>
                                                <strong>Chuyển khoản ngân hàng</strong>
                                                <small>Nhận xác nhận tự động từ nhân viên</small>
                                            </span>
                                        </label>
                                        <label class="payment-option">
                                            <form:radiobutton path="paymentMethod" value="Thanh toán tại cửa hàng" />
                                            <span>
                                                <strong>Thanh toán tại cửa hàng</strong>
                                                <small>Giữ hàng trước, nhận máy tại showroom</small>
                                            </span>
                                        </label>
                                    </div>
                                    <form:errors path="paymentMethod" cssClass="text-danger small mt-2 d-block" />
                                </div>

                                <div class="mb-4">
                                    <label for="note" class="form-label fw-semibold">Ghi chú thêm</label>
                                    <form:textarea path="note" id="note" cssClass="form-control checkout-input checkout-textarea checkout-note" placeholder="Ví dụ: gọi trước khi giao, xuất hóa đơn công ty..." />
                                    <form:errors path="note" cssClass="text-danger small mt-2 d-block" />
                                </div>

                                <button type="submit" class="btn btn-primary w-100 checkout-submit">
                                    <i class="bi bi-credit-card-2-front me-2"></i>Xác nhận đặt hàng
                                </button>

                                <div class="checkout-assurances">
                                    <span><i class="bi bi-patch-check"></i>Chính hãng 100%</span>
                                    <span><i class="bi bi-arrow-repeat"></i>Đổi trả rõ ràng</span>
                                    <span><i class="bi bi-headset"></i>Hỗ trợ sau bán hàng</span>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<jsp:include page="../layout/footer.jsp" />
