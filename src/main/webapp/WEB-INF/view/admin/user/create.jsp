<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Create User</title>
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
                        <span class="admin-page-kicker">Create User</span>
                        <h1>Tạo tài khoản mới</h1>
                        <p>Thiết lập thông tin cơ bản, quyền truy cập và ảnh đại diện cho tài khoản quản trị hoặc khách hàng.</p>
                    </div>
                    <a class="btn admin-btn-secondary" href="/admin/user">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách
                    </a>
                </div>

                <div class="admin-form-card">
                    <c:if test="${not empty error}">
                        <div class="alert alert-warning rounded-4">${error}</div>
                    </c:if>

                    <form:form modelAttribute="newUser" method="post" action="/admin/user/create" class="row g-4" enctype="multipart/form-data">
                        <div class="col-lg-8">
                            <div class="admin-section-head mb-3">
                                <div>
                                    <h2>Thông tin tài khoản</h2>
                                    <p>Các trường quan trọng để đăng nhập và quản lý hồ sơ.</p>
                                </div>
                            </div>

                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Email</label>
                                    <form:input path="email" type="email" class="form-control admin-input" placeholder="admin@laptopvn.vn"/>
                                    <form:errors path="email" cssClass="text-danger small mt-2 d-block" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Mật khẩu</label>
                                    <form:password path="password" class="form-control admin-input" placeholder="Tối thiểu 6 ký tự"/>
                                    <form:errors path="password" cssClass="text-danger small mt-2 d-block" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Họ và tên</label>
                                    <form:input path="fullName" class="form-control admin-input" placeholder="Nguyễn Văn A"/>
                                    <form:errors path="fullName" cssClass="text-danger small mt-2 d-block" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số điện thoại</label>
                                    <form:input path="phone" class="form-control admin-input" placeholder="0901234567"/>
                                    <form:errors path="phone" cssClass="text-danger small mt-2 d-block" />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Địa chỉ</label>
                                    <form:input path="address" class="form-control admin-input" placeholder="Số nhà, đường, quận/huyện, tỉnh/thành phố"/>
                                    <form:errors path="address" cssClass="text-danger small mt-2 d-block" />
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="admin-side-card">
                                <div class="admin-section-head mb-3">
                                    <div>
                                        <h2>Thiết lập thêm</h2>
                                        <p>Phân quyền và ảnh đại diện.</p>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Vai trò</label>
                                    <form:select class="form-select admin-input" path="role.name">
                                        <form:option value="ADMIN">Admin</form:option>
                                        <form:option value="USER">User</form:option>
                                    </form:select>
                                </div>

                                <div class="mb-3">
                                    <label for="avatarFile" class="form-label">Avatar</label>
                                    <input class="form-control admin-input" type="file" id="avatarFile" name="huyhuyFile" accept=".jpg, .jpeg, .png">
                                </div>

                                <div class="admin-upload-preview">
                                    <img alt="avatar preview" id="avatarPreview" style="display:none;">
                                    <div id="avatarPlaceholder">
                                        <i class="fas fa-image mb-2"></i>
                                        <span>Xem trước ảnh đại diện</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="admin-form-actions">
                                <a href="/admin/user" class="btn admin-btn-secondary">Hủy</a>
                                <button type="submit" class="btn admin-btn-primary">
                                    <i class="fas fa-save me-2"></i>Lưu tài khoản
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
<script>
    const avatarFile = document.getElementById('avatarFile');
    const avatarPreview = document.getElementById('avatarPreview');
    const avatarPlaceholder = document.getElementById('avatarPlaceholder');
    if (avatarFile) {
        avatarFile.addEventListener('change', function(event) {
            const file = event.target.files && event.target.files[0];
            if (!file) return;
            avatarPreview.src = URL.createObjectURL(file);
            avatarPreview.style.display = 'block';
            avatarPlaceholder.style.display = 'none';
        });
    }
</script>
</body>
</html>
