<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Update User</title>
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
                        <span class="admin-page-kicker">Update User</span>
                        <h1>Cập nhật người dùng</h1>
                        <p>Điều chỉnh thông tin hồ sơ để giữ dữ liệu khách hàng và quản trị viên luôn chính xác.</p>
                    </div>
                    <a class="btn admin-btn-secondary" href="/admin/user">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách
                    </a>
                </div>

                <div class="admin-form-card">
                    <c:if test="${not empty error}">
                        <div class="alert alert-warning rounded-4">${error}</div>
                    </c:if>

                    <form:form modelAttribute="newUser" method="post" action="/admin/user/update_user" class="row g-4">
                        <form:hidden path="id"/>
                        <input type="hidden" name="password" value="${newUser.password}" />

                        <div class="col-lg-8">
                            <div class="admin-section-head mb-3">
                                <div>
                                    <h2>Thông tin hồ sơ</h2>
                                    <p>Email được giữ cố định để tránh xung đột đăng nhập.</p>
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Email</label>
                                    <form:input path="email" class="form-control admin-input" readonly="true"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Họ và tên</label>
                                    <form:input path="fullName" class="form-control admin-input"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số điện thoại</label>
                                    <form:input path="phone" class="form-control admin-input"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Địa chỉ</label>
                                    <form:input path="address" class="form-control admin-input"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="admin-side-card">
                                <div class="admin-section-head mb-3">
                                    <div>
                                        <h2>Thông tin hiện tại</h2>
                                        <p>Tóm tắt nhanh hồ sơ đang chỉnh sửa.</p>
                                    </div>
                                </div>
                                <div class="admin-summary-list">
                                    <div><span>ID</span><strong>#${newUser.id}</strong></div>
                                    <div><span>Role</span><strong>${newUser.role.name}</strong></div>
                                    <div><span>Email</span><strong>${newUser.email}</strong></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="admin-form-actions">
                                <a href="/admin/user" class="btn admin-btn-secondary">Hủy</a>
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
