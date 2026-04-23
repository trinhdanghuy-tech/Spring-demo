<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/header.jsp" />

<section class="py-5">
    <div class="container">
        <div class="checkout-hero mb-4">
            <div>
                <span class="checkout-kicker">My Orders</span>
                <h1 class="checkout-title mb-2">Theo dõi đơn hàng của bạn</h1>
                <p class="checkout-subtitle mb-0">Xem lại thông tin giao hàng, trạng thái xử lý và các sản phẩm đã đặt.</p>
            </div>
            <div class="checkout-hero-meta">
                <span><i class="bi bi-clock-history"></i>Cập nhật theo trạng thái</span>
                <span><i class="bi bi-receipt"></i>Lưu toàn bộ lịch sử mua hàng</span>
                <span><i class="bi bi-headset"></i>Dễ hỗ trợ sau bán hàng</span>
            </div>
        </div>

        <c:choose>
            <c:when test="${empty orders}">
                <div class="text-center py-5 bg-white rounded-4 shadow-sm">
                    <div class="mb-4">
                        <div class="d-inline-flex align-items-center justify-content-center rounded-circle bg-light" style="width: 120px; height: 120px;">
                            <i class="bi bi-bag-x" style="font-size: 3rem; color: var(--accent-color);"></i>
                        </div>
                    </div>
                    <h3 class="fw-bold text-dark mb-3">Bạn chưa có đơn hàng nào</h3>
                    <p class="text-muted mb-4 fs-5">Hãy chọn một chiếc laptop phù hợp và hoàn tất thanh toán để đơn hàng xuất hiện tại đây.</p>
                    <a href="/products" class="btn btn-primary btn-lg rounded-pill px-5 shadow-sm border-0" style="background-color: var(--accent-color);">
                        <i class="bi bi-laptop me-2"></i>Mua sắm ngay
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row g-4">
                    <c:forEach var="order" items="${orders}">
                        <div class="col-12">
                            <div class="my-order-card">
                                <div class="my-order-head">
                                    <div>
                                        <div class="my-order-id">Đơn hàng #${order.id}</div>
                                        <div class="text-muted small">${order.createdAt}</div>
                                    </div>
                                    <div class="d-flex align-items-center gap-3 flex-wrap justify-content-end">
                                        <span class="my-order-total"><fmt:formatNumber type="number" value="${order.totalPrice}" />₫</span>
                                        <span class="order-status-badge status-${order.status}">${order.status}</span>
                                    </div>
                                </div>

                                <div class="my-order-meta">
                                    <div>
                                        <span class="label">Người nhận</span>
                                        <strong>${order.receiverName}</strong>
                                    </div>
                                    <div>
                                        <span class="label">Điện thoại</span>
                                        <strong>${order.receiverPhone}</strong>
                                    </div>
                                    <div>
                                        <span class="label">Thanh toán</span>
                                        <strong>${order.paymentMethod}</strong>
                                    </div>
                                    <div>
                                        <span class="label">Địa chỉ</span>
                                        <strong>${order.receiverAddress}</strong>
                                    </div>
                                </div>

                                <c:if test="${not empty order.note}">
                                    <div class="my-order-note">
                                        <span class="label">Ghi chú</span>
                                        <strong>${order.note}</strong>
                                    </div>
                                </c:if>

                                <div class="my-order-items">
                                    <c:forEach var="detail" items="${order.oderDetails}">
                                        <div class="my-order-item">
                                            <div class="my-order-item-name">
                                                <strong>${detail.product.name}</strong>
                                                <span>${detail.quantity} x <fmt:formatNumber type="number" value="${detail.price}" />₫</span>
                                            </div>
                                            <div class="my-order-item-price">
                                                <fmt:formatNumber type="number" value="${detail.quantity * detail.price}" />₫
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<jsp:include page="../layout/footer.jsp" />
