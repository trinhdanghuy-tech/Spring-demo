<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Create Product</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp" />
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4 admin-page-shell">
                <div class="admin-page-head">
                    <div>
                        <span class="admin-page-kicker">Create Product</span>
                        <h1>Thêm sản phẩm mới</h1>
                        <p>Bổ sung laptop mới vào hệ thống với đầy đủ mô tả, giá bán, tồn kho và ảnh đại diện.</p>
                    </div>
                    <a class="btn admin-btn-secondary" href="/admin/product">
                        <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách
                    </a>
                </div>

                <div class="admin-form-card">
                    <c:if test="${not empty error}">
                        <div class="alert alert-warning rounded-4">${error}</div>
                    </c:if>

                    <form:form modelAttribute="newProduct" method="post" action="/admin/product/create" class="row g-4" enctype="multipart/form-data">
                        <div class="col-lg-8">
                            <div class="admin-section-head mb-3">
                                <div>
                                    <h2>Thông tin sản phẩm</h2>
                                    <p>Nhập các trường mô tả để sản phẩm hiển thị chuẩn ngoài storefront.</p>
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Tên sản phẩm</label>
                                    <form:input path="name" class="form-control admin-input" />
                                    <form:errors path="name" cssClass="text-danger small mt-2 d-block" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Giá bán</label>
                                    <form:input path="price" type="number" step="0.01" class="form-control admin-input" />
                                    <form:errors path="price" cssClass="text-danger small mt-2 d-block" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Số lượng</label>
                                    <form:input path="quantity" type="number" class="form-control admin-input" />
                                    <form:errors path="quantity" cssClass="text-danger small mt-2 d-block" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Mô tả ngắn</label>
                                    <form:input path="shortDesc" class="form-control admin-input" />
                                    <form:errors path="shortDesc" cssClass="text-danger small mt-2 d-block" />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Mô tả chi tiết</label>
                                    <form:textarea path="detailDesc" class="form-control admin-input admin-textarea" rows="5" />
                                    <form:errors path="detailDesc" cssClass="text-danger small mt-2 d-block" />
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="admin-side-card mb-4">
                                <div class="admin-section-head mb-3">
                                    <div>
                                        <h2>Phân loại</h2>
                                        <p>Gắn nhóm hãng và nhu cầu sử dụng.</p>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Factory</label>
                                    <form:select class="form-select admin-input" path="factory">
                                        <form:option value="Apple">Apple</form:option>
                                        <form:option value="Asus">Asus</form:option>
                                        <form:option value="Dell">Dell</form:option>
                                        <form:option value="HP">HP</form:option>
                                        <form:option value="Lenovo">Lenovo</form:option>
                                        <form:option value="MSI">MSI</form:option>
                                        <form:option value="Acer">Acer</form:option>
                                    </form:select>
                                </div>
                                <div>
                                    <label class="form-label">Target</label>
                                    <form:select class="form-select admin-input" path="target">
                                        <form:option value="Gaming">Gaming</form:option>
                                        <form:option value="Office">Office</form:option>
                                        <form:option value="Student">Student</form:option>
                                    </form:select>
                                </div>
                            </div>

                            <div class="admin-side-card">
                                <div class="admin-section-head mb-3">
                                    <div>
                                        <h2>Ảnh sản phẩm</h2>
                                        <p>Chọn ảnh bìa hiển thị ngoài website.</p>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <input class="form-control admin-input" type="file" id="imageFile" name="imageFile" accept=".jpg, .jpeg, .png">
                                </div>
                                <div class="admin-upload-preview">
                                    <img alt="image preview" id="imagePreview" style="display:none;">
                                    <div id="imagePlaceholder">
                                        <i class="fas fa-image mb-2"></i>
                                        <span>Xem trước ảnh sản phẩm</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="admin-form-actions">
                                <a href="/admin/product" class="btn admin-btn-secondary">Hủy</a>
                                <button type="submit" class="btn admin-btn-primary">
                                    <i class="fas fa-save me-2"></i>Lưu sản phẩm
                                </button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
<script>
    const imageFile = document.getElementById('imageFile');
    const imagePreview = document.getElementById('imagePreview');
    const imagePlaceholder = document.getElementById('imagePlaceholder');
    if (imageFile) {
        imageFile.addEventListener('change', function(event) {
            const file = event.target.files && event.target.files[0];
            if (!file) return;
            imagePreview.src = URL.createObjectURL(file);
            imagePreview.style.display = 'block';
            imagePlaceholder.style.display = 'none';
        });
    }
</script>
</body>
</html>
