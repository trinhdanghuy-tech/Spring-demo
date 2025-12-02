<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete User ${id}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-12 mx-auto">
            <h2 class="text-center mb-4">Delete User ID = ${id}</h2>
            <div class="alert alert-danger text-center" role="alert">
                Are you sure you want to delete this user?
            </div>

            <form:form action="/admin/user/delete_user" method="post" modelAttribute="newUser">
                <!-- Hidden ID field -->
                <form:hidden path="id" value="${id}"/>

                <div class="d-flex justify-content-center mt-3">
                    <button type="submit" class="btn btn-danger me-2">Delete</button>
                    <a href="/admin/user" class="btn btn-secondary">Cancel</a>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>