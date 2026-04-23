<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
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
            <div class="container-fluid px-4">
                <h1 class="mt-4">Order Management</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active">Orders</li>
                </ol>

                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-receipt me-1"></i>
                        Danh sách đơn hàng
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover align-middle">
                                <thead class="table-light">
                                <tr>
                                    <th>Mã đơn</th>
                                    <th>Khách hàng</th>
                                    <th>Liên hệ</th>
                                    <th>Tổng tiền</th>
                                    <th>Thanh toán</th>
                                    <th>Trạng thái</th>
                                    <th>Thời gian</th>
                                    <th>Cập nhật</th>
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
                                        <td>${order.receiverPhone}</td>
                                        <td><fmt:formatNumber type="number" value="${order.totalPrice}" />₫</td>
                                        <td>${order.paymentMethod}</td>
                                        <td><span class="badge bg-warning text-dark">${order.status}</span></td>
                                        <td>${order.createdAt}</td>
                                        <td style="min-width: 220px;">
                                            <form action="/admin/oder/${order.id}/status" method="post" class="d-flex gap-2">
                                                <select name="status" class="form-select form-select-sm">
                                                    <option value="PENDING" ${order.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                                    <option value="CONFIRMED" ${order.status == 'CONFIRMED' ? 'selected' : ''}>CONFIRMED</option>
                                                    <option value="SHIPPING" ${order.status == 'SHIPPING' ? 'selected' : ''}>SHIPPING</option>
                                                    <option value="DONE" ${order.status == 'DONE' ? 'selected' : ''}>DONE</option>
                                                    <option value="CANCELLED" ${order.status == 'CANCELLED' ? 'selected' : ''}>CANCELLED</option>
                                                </select>
                                                <button type="submit" class="btn btn-sm btn-primary">Lưu</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty orders}">
                                    <tr>
                                        <td colspan="8" class="text-center text-muted py-4">Chưa có đơn hàng nào được tạo.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
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
