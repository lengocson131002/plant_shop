<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title> 
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

        <style>
            .form-select {
                width: 150px;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>

        <%@ include file="../common/header.jsp" %>

        <div class="container">

            <h2 class="mb-5 mt-3">All users (${listUsers.size()})</h2>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Email</th>
                        <th scope="col">Fullname</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Status</th>
                        <th scope="col">Role</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${listUsers}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.email}</td>
                            <td>${user.fullname}</td>
                            <td>${user.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.status == 0}">
                                        <span class="badge bg-warning">Inactive</span>
                                    </c:when>
                                    <c:when test="${user.status == 1}">
                                        <span class="badge bg-success">Active</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.role == 1}">
                                        Admin
                                    </c:when>
                                    <c:when test="${user.role == 0}">
                                        User
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                               <c:choose>
                                    <c:when test="${user.role == 0 && user.status == 1}">
                                        <a href="${pageContext.request.contextPath}/admin?action=updateAccStatus&accId=${user.id}&status=0" class="badge bg-primary">Block</a>
                                    </c:when>
                                    <c:when test="${user.role == 0 && user.status == 0}">
                                        <a href="${pageContext.request.contextPath}/admin?action=updateAccStatus&accId=${user.id}&status=1"  class="badge bg-primary">Unblock</a>
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>   
        </div> 

        <%@ include file="../common/footer.jsp" %>

        <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script> 
    </body>
</html>

