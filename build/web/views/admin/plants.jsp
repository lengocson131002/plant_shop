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

            #dateFrom, #dateTo {
                border: 1px solid #ced4da;
                border-radius: 0.2rem;
                padding: 5px;
            }

            #dateFrom:focus,
            #dateTo:focus {
                outline: none;
                border-color: 86b7fe;
                box-shadow: 0 0 0 0.25rem rgb(13 110 253 / 25%);
            }

            #date-selector{
                display: none;
            }

        </style>
    </head>
    <body>

        <%@ include file="../common/header.jsp" %>

        <div class="container">

            <h2 class="mb-3 mt-3">All Plants(${listPlants.size()})</h2>

            <p class="text-danger">${saveError}</p>
            <p class="text-success">${saveSuccess}</p>

            <a class="mb-5 btn btn-success" href="${pageContext.request.contextPath}/admin?action=addPlant">Add new plant</a>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Plant Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Description</th>
                        <th scope="col">Status</th>
                        <th scope="col">Image path</th>
                        <th scope="col">Category</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${listPlants}" var="plant">
                        <tr>
                            <td>${plant.id}</td>
                            <td>${plant.name}</td>
                            <td>${plant.price}</td>
                            <td>${plant.description}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${plant.status == 1}">
                                        <span class="badge bg-success">Available</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Out of stock</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${plant.imgPath}</td>
                            <td>${plant.cateName}</td>
                            <td >
                                <a class="mb-5" href="${pageContext.request.contextPath}/admin?action=updatePlant&pId=${plant.id}">Update</a> |
                                <a onclick="if(!confirm('Do you want to delete this plant?')) return false;" class="mb-5 text-danger" href="${pageContext.request.contextPath}/admin?action=deletePlant&pId=${plant.id}"> Delete</a>
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

