<%@page import="com.lson.dao.PlantDAO"%>
<%@page import="com.lson.dto.Plant"%>
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
            <h1 class="mt-3 mb-5">Cart Items</h1>
            <h4 class="text-center text-success">${announcement}</h4>
            <h4 class="text-center text-danger ">${error}</h4>
            <div class="list__items">
                <c:choose>
                    <c:when test="${cart != null && !cart.isEmpty()}">
                        <c:forEach items="${cart}" var="entry">
                            <c:set var="plant" scope="page" value="${entry.key}" />
                            <form action="mainController" method="POST" 
                                  class="item border border-1 border-top-0 border-start-0 border-end-0 d-flex align-items-center justify-content-between px-5 py-3">
                                
                                <input type="hidden" name="id" value="${plant.id}">
                                
                                <div class="item__image">
                                    <img class="img-responsive" src="<c:url value="/resources/${plant.imgPath}"/>" alt="alt"/>
                                </div>
                                <div class="item__info">
                                    <p class="item__info--id">ID: 
                                        <a href="${pageContext.request.contextPath}/mainController?action=viewPlant&pId=${plant.id}">${plant.id}</a>
                                    </p>
                                    <p class="item__info--name">${plant.name}</p>
                                </div>

                                <div class="item__quantity">
                                    <input type="number" value="${entry.value}" min="0" name="quantity"/>
                                </div>


                                <div class="item__action d-flex">
                                    <button onclick="if (!confirm('Do you want to update this item?')) {
                                                return false;
                                            }
                                            " class="btn btn-success me-2" type="submit" value="updateCartItem" name="action">Update</button>
                                    <button onclick="if (!confirm('Do you want to update this item?')) {
                                                return false;
                                            }" class="btn btn-danger" type="submit" value="deleteCartItem"  name="action" >&times;</button>
                                </div>
                            </form>
                        </c:forEach>
                        <div class="total-price py-3 pe-5">
                            <span>Total: ${totalPrice} VND</span>
                            <a onclick="
                                    if (!confirm('Do you want to order?')) {
                                        return false;
                                    }
                               " href="mainController?action=checkout&total=${totalPrice}" class="btn btn-success">Save order</a>
                            <a href="mainController?action=viewAllOrders" class="btn btn-success">View all orders</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h5 class="text-center text-danger">${warning}</h5>
                    </c:otherwise>
                </c:choose>

            </div>
        </div> 
        <%@ include file="../common/footer.jsp" %>

        <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script> 
    </body>
</html>