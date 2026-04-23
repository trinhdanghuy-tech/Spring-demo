<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Update Product</title>
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
                        <span class="admin-page-kicker">Update Product</span>
                        <h1>Cập nhật sản phẩm</h1>
                        <p>Tinh chỉnh giá bán, tồn kho và mô tả để nội dung storefront luôn chính xác.</p>
                    </div>
                    <a class="btn admin-btn-secondary" href="/admin/product">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách
                    </a>
                </div>

                <div class="admin-form-card">
                    <c:if test="${not empty error}">
                        <div class="alert alert-warning rounded-4">${error}</div>
                    </c:if>

                    <form:form modelAttribute="newProduct" method="post" action="/admin/product/edit" class="row g-4">
                        <form:hidden path="id"/>
                        <form:hidden path="name"/>
                        <form:hidden path="image"/>
                        <form:hidden path="sold"/>
                        <form:hidden path="factory"/>
                        <form:hidden path="target"/>

                        <div class="col-lg-8">
                            <div class="admin-section-head mb-3">
                                <div>
                                    <h2>Thông tin có thể chỉnh sửa</h2>
                                    <p>Tên, hãng và nhóm sử dụng hiện được giữ nguyên để bảo toàn dữ liệu liên quan.</p>
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Tên sản phẩm</label>
                                    <input type="text" class="form-control admin-input" value="${newProduct.name}" readonly/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Giá bán</label>
                                    <input type="number" step="0.01" name="price" class="form-control admin-input" value="<fmt:formatNumber value='${newProduct.price}' groupingUsed='false'/>"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số lượng</label>
                                    <form:input path="quantity" type="number" class="form-control admin-input"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Đã bán</label>
                                    <input type="text" class="form-control admin-input" value="${newProduct.sold}" readonly/>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Mô tả chi tiết</label>
                                    <form:textarea path="detailDesc" class="form-control admin-input admin-textarea" rows="5"/>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Mô tả ngắn</label>
                                    <form:textarea path="shortDesc" class="form-control admin-input admin-textarea" rows="3"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="admin-side-card">
                                <div class="admin-section-head mb-3">
                                    <div>
                                        <h2>Tóm tắt sản phẩm</h2>
                                        <p>Thông tin tham chiếu nhanh trước khi lưu.</p>
                                    </div>
                                </div>
                                <div class="admin-product-preview">
                                    <img src="/images/product/${newProduct.image}" alt="${newProduct.name}">
                                    <strong>${newProduct.name}</strong>
                                    <span>${newProduct.factory} • ${newProduct.target}</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="admin-form-actions">
                                <a href="/admin/product" class="btn admin-btn-secondary">Hủy</a>
                                <button type="submit" class="btn admin-btn-primary">
                                    <i class="fas fa-save me-2"></i>Lưu thay đổi
                                </button>
                            </div>
                        </div>
                    </form:form>
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
