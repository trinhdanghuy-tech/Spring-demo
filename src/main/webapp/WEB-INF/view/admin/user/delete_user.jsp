<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xóa User ${id}</title>
    <link href="/css/styles.css" rel="stylesheet">
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4 admin-page-shell">
                <div class="admin-confirm-card">
                    <div class="admin-confirm-icon admin-confirm-danger">
                        <i class="fas fa-user-times"></i>
                    </div>
                    <span class="admin-page-kicker">Danger Zone</span>
                    <h1>Xóa tài khoản #${id}</h1>
                    <p>Hành động này sẽ xóa người dùng khỏi hệ thống. Chỉ tiếp tục nếu bạn chắc chắn tài khoản này không còn cần thiết.</p>

                    <form:form action="/admin/user/delete_user" method="post" modelAttribute="newUser">
                        <form:hidden path="id" value="${id}"/>
                        <div class="admin-form-actions justify-content-center mt-4">
                            <a href="/admin/user" class="btn admin-btn-secondary">Hủy</a>
                            <button type="submit" class="btn admin-btn-danger">
                                <i class="fas fa-trash-alt me-2"></i>Xóa tài khoản
                            </button>
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
