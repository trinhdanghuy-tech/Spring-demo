<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Product Management</title>
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
                        <span class="admin-page-kicker">Product Management</span>
                        <h1>Quản lý sản phẩm</h1>
                        <p>Kiểm soát danh mục, giá bán, tồn kho và hiệu suất bán hàng từ một bảng điều hành thống nhất.</p>
                    </div>
                    <a class="btn admin-btn-primary" href="/admin/product/create">
                        <i class="fas fa-plus-circle me-2"></i>Thêm sản phẩm
                    </a>
                </div>

                <div class="admin-content-card">
                    <div class="admin-section-head">
                        <div>
                            <h2>Danh sách sản phẩm</h2>
                            <p>${products.size()} sản phẩm đang được quản lý.</p>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table align-middle admin-table admin-table-rich mb-0">
                            <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Factory</th>
                                <th>Target</th>
                                <th>Giá</th>
                                <th>Tồn kho</th>
                                <th>Đã bán</th>
                                <th class="text-end">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td>
                                        <div class="admin-product-cell">
                                            <div class="admin-thumb">
                                                <img src="/images/product/${product.image}" alt="${product.name}">
                                            </div>
                                            <div>
                                                <div class="fw-semibold">${product.name}</div>
                                                <div class="small text-muted">${product.shortDesc}</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>${product.factory}</td>
                                    <td>${product.target}</td>
                                    <td><fmt:formatNumber type="number" value="${product.price}" />₫</td>
                                    <td>
                                        <span class="admin-badge ${product.quantity == 0 ? 'admin-badge-red' : (product.quantity <= 5 ? 'admin-badge-amber' : 'admin-badge-blue')}">
                                            ${product.quantity}
                                        </span>
                                    </td>
                                    <td>${product.sold}</td>
                                    <td class="text-end">
                                        <div class="admin-action-group justify-content-end">
                                            <a class="btn admin-btn-soft" href="/admin/product/edit/${product.id}">
                                                <i class="fas fa-pen me-2"></i>Sửa
                                            </a>
                                            <a class="btn admin-btn-danger-soft" href="/admin/product/delete/${product.id}">
                                                <i class="fas fa-trash-alt me-2"></i>Xóa
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty products}">
                                <tr>
                                    <td colspan="7" class="text-center text-muted py-5">Chưa có sản phẩm nào.</td>
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
