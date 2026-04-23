<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark admin-sidenav" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Overview</div>
                <a class="nav-link" href="<c:url value='/admin'/>">
                    <div class="sb-nav-link-icon"><i class="fas fa-chart-pie"></i></div>
                    Dashboard
                </a>

                <div class="sb-sidenav-menu-heading">Management</div>
                <a class="nav-link" href="<c:url value='/admin/user'/>">
                    <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                    Users
                </a>
                <a class="nav-link" href="<c:url value='/admin/product'/>">
                    <div class="sb-nav-link-icon"><i class="fas fa-laptop"></i></div>
                    Products
                </a>
                <a class="nav-link" href="<c:url value='/admin/oder'/>">
                    <div class="sb-nav-link-icon"><i class="fas fa-receipt"></i></div>
                    Orders
                </a>

                <div class="sb-sidenav-menu-heading">Quick Access</div>
                <a class="nav-link" href="<c:url value='/admin/product/create'/>">
                    <div class="sb-nav-link-icon"><i class="fas fa-plus-circle"></i></div>
                    Add Product
                </a>
                <a class="nav-link" href="<c:url value='/admin/user/create'/>">
                    <div class="sb-nav-link-icon"><i class="fas fa-user-plus"></i></div>
                    Add User
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer admin-sidenav-footer">
            <div class="small">Administrator</div>
            <c:choose>
                <c:when test="${not empty sessionScope.fullName}">${sessionScope.fullName}</c:when>
                <c:otherwise>${pageContext.request.userPrincipal.name}</c:otherwise>
            </c:choose>
        </div>
    </nav>
</div>
