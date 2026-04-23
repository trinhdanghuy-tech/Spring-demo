<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xóa Product ${id}</title>
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
                        <i class="fas fa-trash-alt"></i>
                    </div>
                    <span class="admin-page-kicker">Danger Zone</span>
                    <h1>Xóa sản phẩm #${id}</h1>
                    <p>Hành động này sẽ loại sản phẩm khỏi danh mục quản trị. Hãy chắc chắn bạn không còn cần sử dụng sản phẩm này.</p>

                    <form:form action="/admin/product/delete" method="post" modelAttribute="newProduct">
                        <form:hidden path="id" value="${id}"/>
                        <div class="admin-form-actions justify-content-center mt-4">
                            <a href="/admin/product" class="btn admin-btn-secondary">Hủy</a>
                            <button type="submit" class="btn admin-btn-danger">
                                <i class="fas fa-trash-alt me-2"></i>Xóa sản phẩm
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
