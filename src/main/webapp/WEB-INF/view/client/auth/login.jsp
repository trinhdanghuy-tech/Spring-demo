<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Đăng nhập - LaptopVN</title>
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
            overflow: hidden;
        }
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -30%;
            width: 900px;
            height: 900px;
            background: radial-gradient(circle, rgba(59,130,246,0.15) 0%, transparent 70%);
            border-radius: 50%;
        }
        body::after {
            content: '';
            position: absolute;
            bottom: -40%;
            left: -20%;
            width: 700px;
            height: 700px;
            background: radial-gradient(circle, rgba(59,130,246,0.1) 0%, transparent 70%);
            border-radius: 50%;
        }
        .login-container {
            width: 100%;
            max-width: 460px;
            position: relative;
            z-index: 1;
        }
        .login-card {
            background: rgba(255, 255, 255, 0.97);
            border-radius: 24px;
            padding: 48px 40px;
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
            margin-bottom: 8px;
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
        .btn-login {
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
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(59, 130, 246, 0.4);
            color: white;
        }
        .divider {
            display: flex;
            align-items: center;
            gap: 16px;
            color: var(--text-muted);
            font-size: 0.85rem;
        }
        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #e2e8f0;
        }
        .social-btn {
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 12px;
            background: white;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-weight: 600;
            color: var(--text-main);
            font-size: 0.9rem;
        }
        .social-btn:hover {
            border-color: var(--accent-color);
            background: #f8fafc;
            transform: translateY(-1px);
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
        .error-message {
            color: #ef4444;
            font-size: 0.85rem;
            margin-top: 4px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <!-- Brand -->
            <div class="text-center mb-4">
                <a href="/" class="brand-logo">
                    <span class="icon-box"><i class="bi bi-laptop"></i></span>
                    LaptopVN
                </a>
                <h4 class="fw-bold mt-3 mb-1" style="color: var(--text-main);">Chào mừng trở lại!</h4>
                <p class="text-muted mb-0">Đăng nhập vào tài khoản của bạn</p>
            </div>

            <!-- Login Form -->
            <form action="/login" method="post">
                <div class="mb-3">
                    <div class="form-floating">
                        <input type="email" class="form-control" id="email" name="username" placeholder="Email" required>
                        <label for="email"><i class="bi bi-envelope me-2"></i>Email</label>
                    </div>
                </div>

                <div class="mb-3 position-relative">
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
                        <label for="password"><i class="bi bi-lock me-2"></i>Mật khẩu</label>
                    </div>
                    <div class="position-absolute top-50 end-0 translate-middle-y">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </div>
                    <span class="input-group-text" onclick="togglePassword()">
                        <i class="bi bi-eye" id="toggleIcon"></i>
                    </span>
                </div>

                <!-- Error message -->
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger py-2 px-3 rounded-3 d-flex align-items-center gap-2 mb-3" style="font-size: 0.9rem;">
                        <i class="bi bi-exclamation-circle"></i>
                        Email hoặc mật khẩu không đúng.
                    </div>
                </c:if>

                <!-- Success message (after register) -->
                <c:if test="${param.success != null}">
                    <div class="alert alert-success py-2 px-3 rounded-3 d-flex align-items-center gap-2 mb-3" style="font-size: 0.9rem;">
                        <i class="bi bi-check-circle"></i>
                        Đăng ký thành công! Hãy đăng nhập.
                    </div>
                </c:if>

                <!-- Logout message -->
                <c:if test="${param.logout != null}">
                    <div class="alert alert-info py-2 px-3 rounded-3 d-flex align-items-center gap-2 mb-3" style="font-size: 0.9rem;">
                        <i class="bi bi-info-circle"></i>
                        Bạn đã đăng xuất thành công.
                    </div>
                </c:if>

                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="remember">
                        <label class="form-check-label text-muted small" for="remember">Ghi nhớ đăng nhập</label>
                    </div>
                    <a href="#" class="text-decoration-none small fw-semibold" style="color: var(--accent-color);">Quên mật khẩu?</a>
                </div>

                <button type="submit" class="btn btn-login w-100 mb-4">
                    <i class="bi bi-box-arrow-in-right me-2"></i>Đăng Nhập
                </button>
            </form>

            <!-- Divider -->
            <div class="divider mb-4">hoặc đăng nhập với</div>

            <!-- Social Login -->
            <div class="row g-3 mb-4">
                <div class="col-6">
                    <button class="social-btn w-100">
                        <svg width="18" height="18" viewBox="0 0 24 24"><path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z"/><path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/><path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/><path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/></svg>
                        Google
                    </button>
                </div>
                <div class="col-6">
                    <button class="social-btn w-100">
                        <i class="bi bi-facebook" style="color: #1877f2; font-size: 1.1rem;"></i>
                        Facebook
                    </button>
                </div>
            </div>

            <!-- Register link -->
            <div class="text-center">
                <span class="text-muted">Chưa có tài khoản? </span>
                <a href="/register" class="fw-bold text-decoration-none" style="color: var(--accent-color);">Đăng ký ngay</a>
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
        function togglePassword() {
            const pwd = document.getElementById('password');
            const icon = document.getElementById('toggleIcon');
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
