<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="sb-topnav navbar navbar-expand admin-topbar">
    <a class="navbar-brand ps-3 admin-brand" href="<c:url value='/admin'/>">
        <span class="admin-brand-mark"><i class="fas fa-layer-group"></i></span>
        LaptopVN Admin
    </a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0 admin-toggle" id="sidebarToggle" type="button">
        <i class="fas fa-bars"></i>
    </button>

    <div class="ms-auto d-none d-md-flex align-items-center admin-topbar-meta">
        <div class="admin-topbar-chip">
            <i class="fas fa-shield-alt"></i>
            <span>Control Panel</span>
        </div>
        <div class="admin-topbar-chip">
            <i class="fas fa-user-circle"></i>
            <span>
                <c:choose>
                    <c:when test="${not empty sessionScope.fullName}">${sessionScope.fullName}</c:when>
                    <c:otherwise>${pageContext.request.userPrincipal.name}</c:otherwise>
                </c:choose>
            </span>
        </div>
    </div>

    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle admin-user-menu" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-user fa-fw"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end shadow border-0 rounded-4" aria-labelledby="navbarDropdown">
                <li class="px-3 py-2">
                    <div class="small text-muted">Đăng nhập với</div>
                    <div class="fw-semibold">
                        <c:choose>
                            <c:when test="${not empty sessionScope.fullName}">${sessionScope.fullName}</c:when>
                            <c:otherwise>${pageContext.request.userPrincipal.name}</c:otherwise>
                        </c:choose>
                    </div>
                </li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item py-2" href="<c:url value='/admin'/>"><i class="fas fa-chart-line me-2"></i>Dashboard</a></li>
                <li><a class="dropdown-item py-2" href="<c:url value='/'/>"><i class="fas fa-store me-2"></i>Xem website</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li>
                    <form action="/logout" method="post">
                        <button type="submit" class="dropdown-item py-2 text-danger">
                            <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
                        </button>
                    </form>
                </li>
            </ul>
        </li>
    </ul>
</nav>
