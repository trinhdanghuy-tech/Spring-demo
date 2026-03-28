<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Product Page</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script>
                $(document).ready(() => {
                    const avatarFile = $("#avatarFile");
                    avatarFile.change(function (e) {
                        const imgURL = URL.createObjectURL(e.target.files[0]);
                        $("#avatarPreview").attr("src", imgURL);
                        $("#avatarPreview").css({ "display": "block" });
                    });
                });
            </script>
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <div id="layoutSidenav_nav">
                    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                        <div class="sb-sidenav-menu">
                            <div class="nav">
                                <div class="sb-sidenav-menu-heading">Core</div>
                                <a class="nav-link" href="index.html">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    Dashboard
                                </a>
                                <a class="nav-link" href="admin/user">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    User
                                </a>
                                <a class="nav-link" href="admin/oder">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    Oder
                                </a>
                                <a class="nav-link" href="admin/product">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    Product
                                </a>
                                <div class="sb-sidenav-menu-heading">Interface</div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#collapseLayouts" aria-expanded="false"
                                    aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Layouts
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                        <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                    Pages
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                            data-bs-target="#pagesCollapseAuth" aria-expanded="false"
                                            aria-controls="pagesCollapseAuth">
                                            Authentication
                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                            </div>
                                        </a>
                                        <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                                            data-bs-parent="#sidenavAccordionPages">
                                            <nav class="sb-sidenav-menu-nested nav">
                                                <a class="nav-link" href="login.html">Login</a>
                                                <a class="nav-link" href="register.html">Register</a>
                                                <a class="nav-link" href="password.html">Forgot Password</a>
                                            </nav>
                                        </div>
                                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                            data-bs-target="#pagesCollapseError" aria-expanded="false"
                                            aria-controls="pagesCollapseError">
                                            Error
                                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                            </div>
                                        </a>
                                        <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                            data-bs-parent="#sidenavAccordionPages">
                                            <nav class="sb-sidenav-menu-nested nav">
                                                <a class="nav-link" href="401.html">401 Page</a>
                                                <a class="nav-link" href="404.html">404 Page</a>
                                                <a class="nav-link" href="500.html">500 Page</a>
                                            </nav>
                                        </div>
                                    </nav>
                                </div>
                                <div class="sb-sidenav-menu-heading">Addons</div>
                                <a class="nav-link" href="charts.html">
                                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                    Charts
                                </a>
                                <a class="nav-link" href="tables.html">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    Tables
                                </a>
                            </div>
                        </div>
                        <div class="sb-sidenav-footer">
                            <div class="small">Logged in as:</div>
                            Start Bootstrap
                        </div>
                    </nav>
                </div>
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1>Manager Products</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dasboard</a></li>
                                <li class="breadcrumb-item active">Products</li>
                            </ol>
                            <div class="mt-5">
                    <div class="row">
                        <div class="col-md-8 col-12 mx-auto">
                            <h3>Create a product</h3>
                            <c:if test="${not empty error}">
                                <div class="alert alert-warning">${error}</div>
                            </c:if>
                            <br>
                            <form:form modelAttribute="newProduct" method="post" action="/admin/product/create"
                                       class="row g-3" enctype="multipart/form-data">
                                <div class="col-md-6">
                                    <label class="form-label">Name</label>
                                    <form:input path="name" class="form-control" />
                                    <form:errors path="name" cssClass="text-danger" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Price</label>
                                    <form:input path="price" type="number" step="0.01" class="form-control" />
                                    <form:errors path="price" cssClass="text-danger" />
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Detail Description</label>
                                    <form:textarea path="detailDesc" class="form-control" rows="3" />
                                    <form:errors path="detailDesc" cssClass="text-danger" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Short Description</label>
                                    <form:input path="shortDesc" class="form-control" />
                                    <form:errors path="shortDesc" cssClass="text-danger" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Quantity</label>
                                    <form:input path="quantity" type="number" class="form-control" />
                                    <form:errors path="quantity" cssClass="text-danger" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Factory</label>
                                    <form:select class="form-select" path="factory">
                                        <form:option value="Apple">Apple</form:option>
                                        <form:option value="Asus">Asus</form:option>
                                        <form:option value="Dell">Dell</form:option>
                                        <form:option value="HP">HP</form:option>
                                        <form:option value="Lenovo">Lenovo</form:option>
                                        <form:option value="MSI">MSI</form:option>
                                        <form:option value="Acer">Acer</form:option>
                                    </form:select>
                                    <form:errors path="factory" cssClass="text-danger" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Target</label>
                                    <form:select class="form-select" path="target">
                                        <form:option value="Gaming">Gaming</form:option>
                                        <form:option value="Office">Office</form:option>
                                        <form:option value="Student">Student</form:option>
                                    </form:select>
                                    <form:errors path="target" cssClass="text-danger" />
                                </div>
                                <div class="mb-3 col-12 col-md-6">
                                    <label for="imageFile" class="form-label">Image: </label>
                                    <input class="form-control" type="file" id="imageFile" name="imageFile" accept=".jpg, .jpeg, .png">
                                </div>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display: none" alt="avatar preview" id="imagePreview">
                                </div>
                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-primary mt-3">Submit</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="/js/scripts.js"></script>
        </body>

        </html>
