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
        </style>
    </head>
    <body>

            <%@ include file="../common/header.jsp" %>

        <div class="container">

            <h2 class="mb-5">My Orders</h2>

            <form action="mainController?action=viewAllOrders" method="POST" class="d-flex flex-lg-row flex-column">
                <select class="form-select form-select-sm mb-lg-0 mb-2" name="filter">
                    <option value="all" ${status == 0 ? 'selected' : ''}>All</option>
                    <option value="processing"  ${status == 1 ? 'selected' : ''}>Processing orders</option>
                    <option value="completed"  ${status == 2 ? 'selected' : ''}>Completed orders</option>
                    <option value="canceled"  ${status == 3 ? 'selected' : ''}>Canceled orders</option>
                </select>

                <div class="mb-lg-0 mb-2">
                    <label for="dateFrom">From</label>
                    <input class="h-100 me-2" type="date" name="dateFrom" id="dateFrom" value="${dateFrom}" >

                    <label for="dateTo">To</label>
                    <input class="h-100 me-5" type="date" name="dateTo" id="dateTo" value="${dateTo}" />
                </div>

                <input type="submit" value="Filter" class="btn btn-primary">
            </form>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Order date</th>
                        <th scope="col">Ship date</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${listOrders}" var="order">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.shipDate == null ? 'Not yet' : order.shipDate}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.status == 1}">
                                        <span class="badge bg-warning">Processing</span>
                                    </c:when>
                                    <c:when test="${order.status == 2}">
                                        <span class="badge bg-success">Completed</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Canceled</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/mainController?action=viewOrderDetail&orderId=${order.id}&status=${order.status}">Detail</a>
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

