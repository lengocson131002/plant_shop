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
            .card .plant__name:hover a{
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
            .page-numbers {
                display: flex;
                gap: 5px;
                justify-content: center;
                list-style: none;
            }

        </style>

    </head>
    <body>

        <%@ include file="../common/header.jsp" %>

        <!-- slider -->

        <div id="carouselExampleCaptions" class="carousel slide header__slider" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">                    
                <c:forEach items="${bestSellers}" var="plant" varStatus="loop">
                    <div class="carousel-item ${loop.index == 0 ? ' active' : ''}">
                        <img src="<c:url value="/resources/${plant.imgPath}"/>" class="d-block w-100 img-responsive" alt="...">
                        <div class="carousel-caption d-none d-md-block description">
                            <h5>${plant.name}</h5>
                            <a href="${pageContext.request.contextPath}/mainController?action=viewPlant&pId=${plant.id}">More detail</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- plants -->       

        <div class="container">
            <h2 class="section__header">ALL PLANT</h2>
            <div class="row">
                <c:forEach items="${listPlants}" var="plant">
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
                                <a href="${pageContext.request.contextPath}/mainController?action=addToCart&pId=${plant.id}" class="btn btn-success"> Add to card</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="py-5 text-center">
            <ul class="d-flex page-numbers  justify-content-center">
                <c:if test="${currentPage != 1}">
                    <li><a class="btn btn-primary" href="mainController?action=home&page=${currentPage - 1}">Previous</a></li>
                    </c:if>

                <c:forEach begin="1" end="${numOfPages}" var="i">
                    <c:choose>
                        <c:when test="${currentPage == i}">
                            <li class="btn btn-success">${i}</li>
                            </c:when>
                            <c:otherwise>
                            <li><a  class="btn btn-primary" href="mainController?action=home&page=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage < numOfPages}">
                    <li ><a class="btn btn-primary" href="mainController?action=home&page=${currentPage +  1}">Next</a></li>
                    </c:if>

            </ul>
        </div>
        <%@ include file="../common/footer.jsp" %>

        <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script> 
    </body>
</html>
