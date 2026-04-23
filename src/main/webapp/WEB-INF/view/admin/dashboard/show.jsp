<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Admin Dashboard</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4 admin-dashboard">
                <div class="admin-hero">
                    <div>
                        <span class="admin-hero-kicker">Operations Center</span>
                        <h1>Bức tranh vận hành của LaptopVN</h1>
                        <p>Theo dõi doanh thu, trạng thái đơn hàng, tồn kho và tốc độ bán hàng trong một màn hình duy nhất.</p>
                    </div>
                    <div class="admin-hero-meta">
                        <div>
                            <span class="label">Tổng doanh thu</span>
                            <strong><fmt:formatNumber type="number" value="${totalRevenue}" />₫</strong>
                        </div>
                        <div>
                            <span class="label">Đơn chờ xử lý</span>
                            <strong>${pendingOrders}</strong>
                        </div>
                    </div>
                </div>

                <div class="row g-4 mb-4">
                    <div class="col-xl-3 col-md-6">
                        <div class="metric-card metric-card-blue">
                            <div class="metric-icon"><i class="fas fa-users"></i></div>
                            <div class="metric-copy">
                                <span>Tài khoản</span>
                                <strong>${userCount}</strong>
                                <small>Khách hàng đã đăng ký</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="metric-card metric-card-dark">
                            <div class="metric-icon"><i class="fas fa-laptop"></i></div>
                            <div class="metric-copy">
                                <span>Sản phẩm</span>
                                <strong>${productCount}</strong>
                                <small>Danh mục đang kinh doanh</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="metric-card metric-card-amber">
                            <div class="metric-icon"><i class="fas fa-receipt"></i></div>
                            <div class="metric-copy">
                                <span>Đơn hàng</span>
                                <strong>${orderCount}</strong>
                                <small>Tổng số đơn đã tạo</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="metric-card metric-card-emerald">
                            <div class="metric-icon"><i class="fas fa-box-open"></i></div>
                            <div class="metric-copy">
                                <span>Máy đã bán</span>
                                <strong>${totalUnitsSold}</strong>
                                <small>Số lượng sản phẩm đã xuất kho</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row g-4 mb-4">
                    <div class="col-xl-8">
                        <div class="admin-panel admin-panel-grid">
                            <div class="mini-stat">
                                <span class="label">Đơn chờ xác nhận</span>
                                <strong>${pendingOrders}</strong>
                                <small>Cần xử lý ngay</small>
                            </div>
                            <div class="mini-stat">
                                <span class="label">Sắp hết hàng</span>
                                <strong>${lowStockProducts}</strong>
                                <small>Tồn kho từ 1 đến 5 máy</small>
                            </div>
                            <div class="mini-stat">
                                <span class="label">Hết hàng</span>
                                <strong>${outOfStockProducts}</strong>
                                <small>Cần nhập bổ sung</small>
                            </div>
                            <div class="mini-stat">
                                <span class="label">Giá trị đơn trung bình</span>
                                <strong>
                                    <fmt:formatNumber type="number" value="${orderCount > 0 ? totalRevenue / orderCount : 0}" />
                                    ₫
                                </strong>
                                <small>Trung bình theo mỗi đơn</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="admin-panel quick-actions">
                            <div class="panel-head">
                                <div>
                                    <h2>Hành động nhanh</h2>
                                    <p>Đi tới những khu vực vận hành thường dùng.</p>
                                </div>
                            </div>
                            <a class="quick-action-link" href="/admin/product/create">
                                <span><i class="fas fa-plus-circle"></i>Thêm sản phẩm mới</span>
                                <i class="fas fa-arrow-right"></i>
                            </a>
                            <a class="quick-action-link" href="/admin/oder">
                                <span><i class="fas fa-truck"></i>Xử lý đơn hàng</span>
                                <i class="fas fa-arrow-right"></i>
                            </a>
                            <a class="quick-action-link" href="/admin/product">
                                <span><i class="fas fa-warehouse"></i>Kiểm tra tồn kho</span>
                                <i class="fas fa-arrow-right"></i>
                            </a>
                            <a class="quick-action-link" href="/admin/user">
                                <span><i class="fas fa-user-shield"></i>Quản lý tài khoản</span>
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="row g-4 mb-4">
                    <div class="col-xl-7">
                        <div class="admin-panel h-100">
                            <div class="panel-head">
                                <div>
                                    <h2>Đơn hàng mới nhất</h2>
                                    <p>Danh sách đơn gần đây để theo dõi trạng thái xử lý.</p>
                                </div>
                                <a href="/admin/oder" class="panel-link">Xem tất cả</a>
                            </div>
                            <div class="table-responsive">
                                <table class="table align-middle admin-table mb-0">
                                    <thead>
                                    <tr>
                                        <th>Mã đơn</th>
                                        <th>Khách nhận</th>
                                        <th>Thanh toán</th>
                                        <th>Giá trị</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="order" items="${recentOrders}">
                                        <tr>
                                            <td>#${order.id}</td>
                                            <td>
                                                <div class="fw-semibold">${order.receiverName}</div>
                                                <div class="small text-muted">${order.receiverPhone}</div>
                                            </td>
                                            <td>${order.paymentMethod}</td>
                                            <td><fmt:formatNumber type="number" value="${order.totalPrice}" />₫</td>
                                            <td>
                                                <span class="admin-status admin-status-${order.status}">${order.status}</span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty recentOrders}">
                                        <tr>
                                            <td colspan="5" class="text-center text-muted py-4">Chưa có đơn hàng nào.</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-5">
                        <div class="admin-panel h-100">
                            <div class="panel-head">
                                <div>
                                    <h2>Sản phẩm bán chạy</h2>
                                    <p>Top sản phẩm có lượng bán cao nhất hiện tại.</p>
                                </div>
                                <a href="/admin/product" class="panel-link">Xem kho</a>
                            </div>
                            <div class="rank-list">
                                <c:forEach var="product" items="${topProducts}" varStatus="status">
                                    <div class="rank-item">
                                        <div class="rank-index">0${status.index + 1}</div>
                                        <div class="rank-copy">
                                            <strong>${product.name}</strong>
                                            <span>${product.factory} • Còn ${product.quantity} máy</span>
                                        </div>
                                        <div class="rank-value">${product.sold} bán</div>
                                    </div>
                                </c:forEach>
                                <c:if test="${empty topProducts}">
                                    <div class="text-muted">Chưa có dữ liệu bán hàng để hiển thị.</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row g-4">
                    <div class="col-xl-12">
                        <div class="admin-panel">
                            <div class="panel-head">
                                <div>
                                    <h2>Cảnh báo tồn kho</h2>
                                    <p>Những sản phẩm cần ưu tiên nhập thêm hoặc kiểm tra lại.</p>
                                </div>
                            </div>
                            <div class="row g-3">
                                <c:forEach var="product" items="${inventoryAlerts}">
                                    <div class="col-xl-4 col-md-6">
                                        <div class="inventory-alert ${product.quantity == 0 ? 'inventory-alert-danger' : 'inventory-alert-warning'}">
                                            <div>
                                                <strong>${product.name}</strong>
                                                <span>${product.factory} • ${product.target}</span>
                                            </div>
                                            <div class="inventory-qty">
                                                <span>Tồn kho</span>
                                                <strong>${product.quantity}</strong>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:if test="${empty inventoryAlerts}">
                                    <div class="col-12">
                                        <div class="text-muted">Tồn kho đang ổn định, chưa có sản phẩm cần cảnh báo.</div>
                                    </div>
                                </c:if>
                            </div>
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
