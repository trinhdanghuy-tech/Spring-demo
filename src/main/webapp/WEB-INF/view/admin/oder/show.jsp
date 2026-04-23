<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Order Management</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4 admin-page-shell">
                <div class="admin-page-head">
                    <div>
                        <span class="admin-page-kicker">Order Management</span>
                        <h1>Quản lý đơn hàng</h1>
                        <p>Theo dõi tiến độ xử lý, phương thức thanh toán và thông tin nhận hàng để vận hành trơn tru.</p>
                    </div>
                    <a class="btn admin-btn-secondary" href="/admin">
                        <i class="fas fa-chart-line me-2"></i>Về dashboard
                    </a>
                </div>

                <div class="admin-content-card">
                    <div class="admin-section-head">
                        <div>
                            <h2>Danh sách đơn hàng</h2>
                            <p>${orders.size()} đơn hàng hiện có trong hệ thống.</p>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table align-middle admin-table admin-table-rich mb-0">
                            <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Khách nhận</th>
                                <th>Liên hệ</th>
                                <th>Tổng tiền</th>
                                <th>Thanh toán</th>
                                <th>Trạng thái</th>
                                <th>Thời gian</th>
                                <th class="text-end">Cập nhật</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>#${order.id}</td>
                                    <td>
                                        <div class="fw-semibold">${order.receiverName}</div>
                                        <div class="small text-muted">${order.receiverAddress}</div>
                                    </td>
                                    <td>
                                        <div>${order.receiverPhone}</div>
                                        <div class="small text-muted">${empty order.note ? 'Không có ghi chú' : order.note}</div>
                                    </td>
                                    <td><fmt:formatNumber type="number" value="${order.totalPrice}" />₫</td>
                                    <td>${order.paymentMethod}</td>
                                    <td><span class="admin-status admin-status-${order.status}">${order.status}</span></td>
                                    <td>${order.createdAt}</td>
                                    <td class="text-end" style="min-width: 250px;">
                                        <form action="/admin/oder/${order.id}/status" method="post" class="admin-inline-form justify-content-end">
                                            <select name="status" class="form-select admin-input admin-select-sm">
                                                <option value="PENDING" ${order.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                                <option value="CONFIRMED" ${order.status == 'CONFIRMED' ? 'selected' : ''}>CONFIRMED</option>
                                                <option value="SHIPPING" ${order.status == 'SHIPPING' ? 'selected' : ''}>SHIPPING</option>
                                                <option value="DONE" ${order.status == 'DONE' ? 'selected' : ''}>DONE</option>
                                                <option value="CANCELLED" ${order.status == 'CANCELLED' ? 'selected' : ''}>CANCELLED</option>
                                            </select>
                                            <button type="submit" class="btn admin-btn-soft">
                                                <i class="fas fa-check me-2"></i>Lưu
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty orders}">
                                <tr>
                                    <td colspan="8" class="text-center text-muted py-5">Chưa có đơn hàng nào được tạo.</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>
</html>
