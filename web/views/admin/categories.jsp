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

    </head>
    <body>

        <%@ include file="../common/header.jsp" %>

        <div class="container">

            <h2 class="mb-3 mt-3">All categories(${listCategories.size()})</h2>
            
            <a href="${pageContext.request.contextPath}/admin?action=addCategory" class="btn btn-success">Create new category</a>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Category ID</th>
                        <th scope="col">Category name</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${listCategories}" var="cate">
                        <tr>
                            <td>${cate.id}</td>
                            <td> ${cate.name}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin?action=updateCategory&cId=${cate.id}">Update</a>
                            </td>
                        </c:forEach>
                </tbody>
            </table>   
        </div> 

        <%@ include file="../common/footer.jsp" %>

        <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script> 
       
    </body>
</html>

