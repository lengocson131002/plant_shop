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

            <h2 class="mb-3 mt-3">Orders(${listOrders.size()})</h2>

            <form action="${pageContext.request.contextPath}/admin?action=viewAllOrders" method="POST" class="">

                <div class="d-block mb-3">
                    <span class="me-5">Filter by</span> 

                    <input type="radio" name="filter" id='byacc' value="byacc" ${filter.equals('byacc') ? 'checked' : ''}>
                    <label for="byacc" class="me-2">By user's email</label>

                    <input type="radio" name="filter" id='bydate' value="bydate" ${filter.equals('bydate') ? 'checked' : ''}>
                    <label for="bydate">By date</label>
                </div>

                <div class="mb-lg-0 mb-2 d-flex">

                    <input class="form-control me-2 w-lg-25 w-75" type="text" name="email" placeholder="Enter email" id="email-field" value="${email}">

                    <div id="date-selector" class="align-items-md-center align-items-start flex-column flex-md-row">
                        <label for="dateFrom">From</label>
                        <input class="h-100 me-2" type="date" name="dateFrom" id="dateFrom" value="${dateFrom}" />

                        <label for="dateTo">To</label>
                        <input class="h-100 me-5" type="date" name="dateTo" id="dateTo" value="${dateTo}" />
                    </div>

                    <input type="submit" value="Filter" class="btn btn-primary">
                </div>

            </form>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">AccId</th>
                        <th scope="col">Order date</th>
                        <th scope="col">Ship date</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach items="${listOrders}" var="order">
                        <tr>
                            <td>${order.id}</td>
                            <td>
                                ${order.accId}
                            </td>
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

                        </tr>
                    </c:forEach>
                </tbody>
            </table>   
        </div> 

        <%@ include file="../common/footer.jsp" %>

        <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script> 

        <script>
            const filterModes = document.querySelectorAll('input[name="filter"]');
            const emailField = document.querySelector('#email-field');
            const dateSelector = document.querySelector('#date-selector');

            if (${filter != null} && ${filter == "byacc"}) {
                emailField.style.display = 'flex';
                dateSelector.style.display = 'none'
            } else if(${filter != null} && ${filter == "bydate"}) {
                emailField.style.display = 'none';
                dateSelector.style.display = 'flex'
            }

            filterModes.forEach(m => {
                m.addEventListener('change', () => {
                    if (m.value === 'byacc') {
                        emailField.style.display = 'flex';
                        dateSelector.style.display = 'none'
                    } else {
                        emailField.style.display = 'none';
                        dateSelector.style.display = 'flex'
                    }
                })
            })
        </script>
    </body>
</html>

