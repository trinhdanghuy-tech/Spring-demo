<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/header.jsp" />

<section class="py-5">
    <div class="container">
        <div class="checkout-success-card mx-auto">
            <div class="checkout-success-icon">
                <i class="bi bi-check2"></i>
            </div>
            <span class="checkout-kicker">Order Confirmed</span>
            <h1 class="checkout-title mt-2 mb-3">Đơn hàng của bạn đã được ghi nhận</h1>
            <p class="text-muted mb-4">LaptopVN sẽ liên hệ với bạn trong thời gian sớm nhất để xác nhận và triển khai giao hàng.</p>

            <div class="checkout-success-grid">
                <div>
                    <span class="label">Mã đơn hàng</span>
                    <strong>#${order.id}</strong>
                </div>
                <div>
                    <span class="label">Khách nhận</span>
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
                <div class="full">
                    <span class="label">Địa chỉ giao hàng</span>
                    <strong>${order.receiverAddress}</strong>
                </div>
                <div>
                    <span class="label">Trạng thái</span>
                    <strong>${order.status}</strong>
                </div>
                <div>
                    <span class="label">Tổng thanh toán</span>
                    <strong><fmt:formatNumber type="number" value="${order.totalPrice}" />₫</strong>
                </div>
            </div>

            <div class="d-flex gap-3 justify-content-center flex-wrap mt-4">
                <a href="/products" class="btn btn-primary rounded-pill px-4 checkout-submit">Tiếp tục mua sắm</a>
                <a href="/cart" class="btn btn-outline-secondary rounded-pill px-4">Quay lại giỏ hàng</a>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../layout/footer.jsp" />
