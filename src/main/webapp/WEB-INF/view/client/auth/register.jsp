<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Đăng ký - LaptopVN</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <style>
        :root {
            --primary-color: #0f172a;
            --accent-color: #3b82f6;
            --text-main: #1e293b;
            --text-muted: #64748b;
        }
        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #0f172a 0%, #1e3a5f 50%, #1e293b 100%);
            position: relative;
            overflow-x: hidden;
            padding: 40px 0;
        }
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -30%;
            width: 900px;
            height: 900px;
            background: radial-gradient(circle, rgba(59,130,246,0.15) 0%, transparent 70%);
            border-radius: 50%;
        }
        body::after {
            content: '';
            position: absolute;
            bottom: -40%;
            right: -20%;
            width: 700px;
            height: 700px;
            background: radial-gradient(circle, rgba(59,130,246,0.1) 0%, transparent 70%);
            border-radius: 50%;
        }
        .register-container {
            width: 100%;
            max-width: 520px;
            position: relative;
            z-index: 1;
        }
        .register-card {
            background: rgba(255, 255, 255, 0.97);
            border-radius: 24px;
            padding: 44px 40px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(20px);
        }
        .brand-logo {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            font-weight: 800;
            font-size: 1.5rem;
            color: var(--primary-color);
            text-decoration: none;
        }
        .brand-logo .icon-box {
            background-color: var(--accent-color);
            color: white;
            border-radius: 10px;
            padding: 8px 10px;
            font-size: 1.1rem;
        }
        .form-floating > .form-control {
            border-radius: 12px;
            border: 2px solid #e2e8f0;
            padding: 16px;
            height: 56px;
            font-size: 0.95rem;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-floating > .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
        }
        .form-floating > label {
            padding: 16px;
            color: var(--text-muted);
        }
        .btn-register {
            background: linear-gradient(135deg, var(--accent-color) 0%, #2563eb 100%);
            border: none;
            border-radius: 12px;
            padding: 14px;
            font-weight: 700;
            font-size: 1rem;
            color: white;
            transition: transform 0.3s, box-shadow 0.3s;
            letter-spacing: 0.5px;
        }
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(59, 130, 246, 0.4);
            color: white;
        }
        .step-indicator {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-bottom: 24px;
        }
        .step-dot {
            width: 32px;
            height: 4px;
            border-radius: 4px;
            background: #e2e8f0;
            transition: all 0.3s;
        }
        .step-dot.active {
            background: var(--accent-color);
            width: 48px;
        }
        .input-group-text {
            background: transparent;
            border: none;
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 5;
            cursor: pointer;
            color: var(--text-muted);
        }
        .text-danger {
            font-size: 0.82rem;
            margin-top: 4px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-card">
            <!-- Brand -->
            <div class="text-center mb-4">
                <a href="/" class="brand-logo">
                    <span class="icon-box"><i class="bi bi-laptop"></i></span>
                    LaptopVN
                </a>
                <h4 class="fw-bold mt-3 mb-1" style="color: var(--text-main);">Tạo tài khoản mới</h4>
                <p class="text-muted mb-0">Tham gia LaptopVN để nhận ưu đãi độc quyền</p>
            </div>

            <!-- Step indicator -->
            <div class="step-indicator">
                <div class="step-dot active"></div>
                <div class="step-dot"></div>
                <div class="step-dot"></div>
            </div>

            <!-- Register Form -->
            <form:form action="/register" method="post" modelAttribute="registerUser">
                <div class="mb-3">
                    <div class="form-floating">
                        <form:input type="text" cssClass="form-control" path="fullName" id="fullName" placeholder="Họ và tên" />
                        <label for="fullName"><i class="bi bi-person me-2"></i>Họ và tên</label>
                    </div>
                    <form:errors path="fullName" cssClass="text-danger d-block mt-1" />
                </div>

                <div class="mb-3">
                    <div class="form-floating">
                        <form:input type="email" cssClass="form-control" path="email" id="email" placeholder="Email" />
                        <label for="email"><i class="bi bi-envelope me-2"></i>Email</label>
                    </div>
                    <form:errors path="email" cssClass="text-danger d-block mt-1" />
                </div>

                <div class="mb-3 position-relative">
                    <div class="form-floating">
                        <form:password cssClass="form-control" path="password" id="password" placeholder="Mật khẩu" />
                        <label for="password"><i class="bi bi-lock me-2"></i>Mật khẩu</label>
                    </div>
                    <span class="input-group-text" onclick="togglePassword('password', 'toggleIcon1')">
                        <i class="bi bi-eye" id="toggleIcon1"></i>
                    </span>
                    <form:errors path="password" cssClass="text-danger d-block mt-1" />
                </div>

                <div class="mb-4 position-relative">
                    <div class="form-floating">
                        <form:password cssClass="form-control" path="confirmPassword" id="confirmPassword" placeholder="Xác nhận mật khẩu" />
                        <label for="confirmPassword"><i class="bi bi-lock-fill me-2"></i>Xác nhận mật khẩu</label>
                    </div>
                    <span class="input-group-text" onclick="togglePassword('confirmPassword', 'toggleIcon2')">
                        <i class="bi bi-eye" id="toggleIcon2"></i>
                    </span>
                    <form:errors path="confirmPassword" cssClass="text-danger d-block mt-1" />
                </div>

                <!-- Terms -->
                <div class="form-check mb-4">
                    <input class="form-check-input" type="checkbox" id="terms" required>
                    <label class="form-check-label text-muted small" for="terms">
                        Tôi đồng ý với <a href="#" class="text-decoration-none" style="color: var(--accent-color);">Điều khoản sử dụng</a>
                        và <a href="#" class="text-decoration-none" style="color: var(--accent-color);">Chính sách bảo mật</a>
                    </label>
                </div>

                <button type="submit" class="btn btn-register w-100 mb-4">
                    <i class="bi bi-person-plus me-2"></i>Đăng Ký
                </button>
            </form:form>

            <!-- Login link -->
            <div class="text-center">
                <span class="text-muted">Đã có tài khoản? </span>
                <a href="/login" class="fw-bold text-decoration-none" style="color: var(--accent-color);">Đăng nhập</a>
            </div>
        </div>

        <!-- Back to home -->
        <div class="text-center mt-4">
            <a href="/" class="text-white-50 text-decoration-none small">
                <i class="bi bi-arrow-left me-1"></i>Quay về trang chủ
            </a>
        </div>
    </div>

    <script>
        function togglePassword(inputId, iconId) {
            const pwd = document.getElementById(inputId);
            const icon = document.getElementById(iconId);
            if (pwd.type === 'password') {
                pwd.type = 'text';
                icon.classList.replace('bi-eye', 'bi-eye-slash');
            } else {
                pwd.type = 'password';
                icon.classList.replace('bi-eye-slash', 'bi-eye');
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
