<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Loi he thong - LaptopVN</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        :root {
            --bg-start: #f8fafc;
            --bg-end: #e2e8f0;
            --primary: #0f172a;
            --accent: #dc2626;
        }
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            font-family: 'Inter', sans-serif;
            background: radial-gradient(circle at top, #ffffff 0%, var(--bg-start) 45%, var(--bg-end) 100%);
            color: var(--primary);
        }
        .error-card {
            width: 100%;
            max-width: 760px;
            border-radius: 28px;
            background: rgba(255,255,255,0.95);
            box-shadow: 0 25px 80px rgba(15, 23, 42, 0.12);
            overflow: hidden;
        }
        .status-pill {
            display: inline-block;
            padding: 8px 14px;
            border-radius: 999px;
            font-weight: 700;
            letter-spacing: .04em;
            background: rgba(220, 38, 38, 0.1);
            color: var(--accent);
        }
        .error-box {
            border-radius: 18px;
            background: #fff5f5;
            border: 1px solid #fecaca;
            color: #991b1b;
        }
        code {
            color: #334155;
            background: #f8fafc;
            padding: 2px 6px;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <div class="error-card p-4 p-md-5">
        <span class="status-pill mb-3">ERROR <c:out value="${status}" /></span>
        <h1 class="fw-bold mt-3 mb-3">Ung dung da gap loi khi xu ly yeu cau</h1>
        <p class="text-secondary fs-5 mb-4">Trang fallback mac dinh cua Spring da duoc thay bang man hinh loi ro rang hon de nguoi dung tiep tuc thao tac.</p>

        <div class="error-box p-4 mb-4">
            <div class="fw-semibold mb-2">Chi tiet loi</div>
            <div class="mb-2"><strong>Duong dan:</strong> <code><c:out value="${requestUri}" /></code></div>
            <div class="mb-0"><strong>Thong diep:</strong> <c:out value="${errorMessage}" /></div>
        </div>

        <div class="d-flex gap-3 flex-wrap">
            <a href="/" class="btn btn-dark rounded-pill px-4">Ve trang chu</a>
            <a href="/products" class="btn btn-outline-secondary rounded-pill px-4">Xem san pham</a>
        </div>
    </div>
</body>
</html>
