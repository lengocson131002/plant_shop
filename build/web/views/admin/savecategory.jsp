<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Plant</title>
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

        <style>
            .form-add-cate {
                max-width: 500px;
                width: 90%;
            }

        </style>
    </head>

    <body>
        <%@include file="../common/header.jsp" %>

        <div class="container">
            <form class="form px-4 form-add-cate" action="${pageContext.request.contextPath}/saveCategory" method="POST">
                <input type="hidden" name="action" value="${action}">
                <input type="hidden" name="cId" value="${category.id != null ? category.id : ''}">

                <h2 class="text-start mb-3 mt-5">${action == 'update' ? 'Update Category' : 'Add new category'}</h2>

                <c:if test="${action == 'update'}">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="id" value="${category.id}" disabled>
                    </div>
                </c:if>

                <div class="mb-3">
                    <div class="input-group">
                        <input type="text" class="form-control"  placeholder="Enter category's name" name="name" value="${category.name}"/>

                        <div class="invalid-feedback">
                            ${nameError}
                        </div>

                    </div>
                </div>

                <div class="text-start mt-3">
                    <input class="btn btn-primary ms-auto" type="submit" value="${action == 'update' ? 'Update' : 'Add'}" />
                </div>
            </form>
        </div>

        <%@include file="../common/footer.jsp" %>
    </body>
</html>
