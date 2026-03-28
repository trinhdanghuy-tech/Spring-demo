<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Truy cập bị từ chối - LaptopVN</title>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    
    <style>
        :root {
            --primary-color: #0f172a;
            --accent-color: #3b82f6;
            --glass-bg: rgba(255, 255, 255, 0.03);
            --glass-border: rgba(255, 255, 255, 0.1);
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: white;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            overflow: hidden;
        }

        .error-container {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 2rem;
            max-width: 600px;
            width: 90%;
            animation: fadeInUp 0.8s ease-out;
        }

        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid var(--glass-border);
            border-radius: 32px;
            padding: 3rem 2rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }

        .error-code {
            font-size: 8rem;
            font-weight: 800;
            line-height: 1;
            margin-bottom: 1rem;
            background: linear-gradient(to bottom, #fff 30%, rgba(255,255,255,0.1));
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
            opacity: 0.15;
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%) translateY(-20%);
            z-index: -1;
            user-select: none;
        }

        .icon-wrapper {
            width: 100px;
            height: 100px;
            background: rgba(59, 130, 246, 0.1);
            border: 1px solid rgba(59, 130, 246, 0.2);
            border-radius: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            color: var(--accent-color);
            font-size: 3rem;
            box-shadow: 0 0 30px rgba(59, 130, 246, 0.2);
        }

        h1 {
            font-weight: 700;
            font-size: 2rem;
            margin-bottom: 1rem;
            letter-spacing: -0.5px;
        }

        p {
            color: #94a3b8;
            font-size: 1.1rem;
            margin-bottom: 2.5rem;
            line-height: 1.6;
        }

        .btn-group {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn-custom {
            padding: 0.8rem 2rem;
            border-radius: 16px;
            font-weight: 600;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary-custom {
            background-color: var(--accent-color);
            color: white;
            border: none;
            box-shadow: 0 10px 15px -3px rgba(59, 130, 246, 0.3);
        }

        .btn-primary-custom:hover {
            background-color: #2563eb;
            transform: translateY(-2px);
            box-shadow: 0 20px 25px -5px rgba(59, 130, 246, 0.4);
            color: white;
        }

        .btn-outline-custom {
            background-color: transparent;
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn-outline-custom:hover {
            background-color: rgba(255, 255, 255, 0.05);
            border-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
            color: white;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Decorative blobs */
        .blob {
            position: absolute;
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(59, 130, 246, 0.1) 0%, rgba(59, 130, 246, 0) 70%);
            border-radius: 50%;
            z-index: 0;
            filter: blur(40px);
        }

        .blob-1 { top: -100px; right: -100px; }
        .blob-2 { bottom: -100px; left: -100px; }

        @media (max-width: 576px) {
            .error-code { font-size: 6rem; }
            h1 { font-size: 1.5rem; }
            .glass-card { padding: 2.5rem 1.5rem; }
            .btn-group { flex-direction: column; width: 100%; }
            .btn-custom { width: 100%; justify-content: center; }
        }
    </style>
</head>
<body>
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>

    <div class="error-container">
        <div class="error-code">403</div>
        <div class="glass-card">
            <div class="icon-wrapper">
                <i class="bi bi-shield-lock-fill"></i>
            </div>
            <h1>Truy cập bị từ chối</h1>
            <p>Rất tiếc, bạn không có quyền truy cập vào trang này. Vui lòng kiểm tra lại quyền hạn của tài khoản hoặc đăng nhập với tư cách khác.</p>
            
            <div class="btn-group">
                <a href="/" class="btn-custom btn-primary-custom">
                    <i class="bi bi-house-door-fill"></i>
                    Về trang chủ
                </a>
                <a href="/login" class="btn-custom btn-outline-custom">
                    <i class="bi bi-person-badge-fill"></i>
                    Đăng nhập lại
                </a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>