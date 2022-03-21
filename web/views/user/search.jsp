<%@ page language="java" pageEncoding="UTF-8"%>

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
            .carousel-item {
                height: 85vh;
            }

            .description {
                border-radius: 10px;
                background: #ddd;
                color: #343a40;
                backdrop-filter: blur(10px);
            }
            .section__header {
                text-align: center;
                margin-top: 8rem;
                margin-bottom: 5rem;
                font-weight: 700;
            }
            .card {
                box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 15px -3px, rgba(0, 0, 0, 0.05) 0px 4px 6px -2px;
                transition: all 0.3s;
                position: relative;
            }

            .card .plant__img {
                height: 15rem;
            }

            .card:hover {
                transform: scale(1.02);
                background: #b2f2bb;
            }

            .card p {
                margin-bottom: 10px;
            }

            .card .plant__name a {
                text-decoration: underline;
                text-decoration-color: transparent;
                transition: all 0.2s;
            }
            .card .plant__name a:hover {
                text-decoration-color: #0d6efd;
            }

            .card a.btn {
                margin-top: 20px;
                width: 47px;
                white-space: nowrap;
                overflow: hidden;
                display: flex;
                align-items: center;
                gap: 10px;
                word-wrap: none;
                transition: all 0.3s;
            }

            .card a.btn:hover {
                width: 110px;
            }

            .plant__name {
                margin-bottom: 10px;
            }
            .plant__price {
                display: inline-block;
                margin-left: 5px;
                font-size: 18px;
                font-weight: 600;
                color: #e03131;
            }
            .footer {
                height: 100px;
            }

        </style>

    </head>
    <body>

           <%@ include file="../common/header.jsp" %>

        <!-- Search results-->              

        <div class="container">
            <h2 class="section__header text-success">Search result: "${textSearch}"</h2>

            <div class="row">

                <c:forEach items="${searchResult}" var="plant">
                    <div class="col-lg-3 col-6 mb-5">
                        <div class="card">
                            <img class="img-responsive plant__img card-img-top" src="<c:url value="/resources/${plant.imgPath}"/>">
                            <div class="card-body">
                                <h5 class="plant__name">
                                     <a href="${pageContext.request.contextPath}/mainController?action=viewPlant&pId=${plant.id}">${plant.name}</a>
                                </h5>
                                <p class="plant__id">PlantId: ${plant.id}</p>
                                <p >Price:<span class="plant__price">${plant.price}VND</span></p>
                                <p class="plant__category">Category: ${plant.cateName} </p>
                                <a href="mainController?action=addToCart&pId=${plant.id}" class="btn btn-success"> Add to card</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                <c:if test="${searchResult.size() == 0}">
                    <p class="text-center h4">No results found</p>
                </c:if>
            </div>

        </div>
    <%@ include file="../common/footer.jsp" %>

        <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script> 
    </body>
</html>
