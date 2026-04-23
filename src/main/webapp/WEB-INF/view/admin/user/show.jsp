<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>User Management</title>
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
                        <span class="admin-page-kicker">User Management</span>
                        <h1>Quản lý tài khoản</h1>
                        <p>Theo dõi danh sách người dùng, phân quyền nhanh và cập nhật thông tin khách hàng tập trung.</p>
                    </div>
                    <a class="btn admin-btn-primary" href="/admin/user/create">
                        <i class="fas fa-user-plus me-2"></i>Tạo tài khoản
                    </a>
                </div>

                <div class="admin-content-card">
                    <div class="admin-section-head">
                        <div>
                            <h2>Danh sách người dùng</h2>
                            <p>${users1.size()} tài khoản hiện có trong hệ thống.</p>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table align-middle admin-table admin-table-rich mb-0">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Người dùng</th>
                                <th>Liên hệ</th>
                                <th>Vai trò</th>
                                <th>Địa chỉ</th>
                                <th class="text-end">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${users1}" var="user">
                                <tr>
                                    <td>#${user.id}</td>
                                    <td>
                                        <div class="admin-person-cell">
                                            <div class="admin-avatar-mini">
                                                <c:choose>
                                                    <c:when test="${not empty user.avatar}">
                                                        <img src="/images/avatar/${user.avatar}" alt="${user.fullName}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>${fn:substring(user.fullName, 0, 1)}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div>
                                                <div class="fw-semibold">${user.fullName}</div>
                                                <div class="small text-muted">Mã user #${user.id}</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>${user.email}</div>
                                        <div class="small text-muted">${empty user.phone ? 'Chưa có số điện thoại' : user.phone}</div>
                                    </td>
                                    <td>
                                        <span class="admin-badge ${user.role.name == 'ADMIN' ? 'admin-badge-dark' : 'admin-badge-blue'}">
                                            ${user.role.name}
                                        </span>
                                    </td>
                                    <td>${empty user.address ? 'Chưa cập nhật' : user.address}</td>
                                    <td class="text-end">
                                        <div class="admin-action-group justify-content-end">
                                            <a href="/admin/user/update_user/${user.id}" class="btn admin-btn-soft">
                                                <i class="fas fa-pen me-2"></i>Sửa
                                            </a>
                                            <a href="/admin/user/delete_user/${user.id}" class="btn admin-btn-danger-soft">
                                                <i class="fas fa-trash-alt me-2"></i>Xóa
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty users1}">
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-5">Chưa có người dùng nào trong hệ thống.</td>
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
