<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/plant.css"/>"/>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <title>Plant Page</title>
    </head>
    <body>
            <%@ include file="../common/header.jsp" %>
        <div class="container">
            <div class="plant">
                <div class="plant__img">
                    <img src="
                         <c:url value="./resources/${plant.imgPath}"></c:url>
                         " alt="alt" class="img-responsive"/>
                </div>
                <div class="plant__info">
                    <p class="plant__info--id">ID: ${plant.id}</p>
                    <p class="plant__info--name">${plant.name}</p>
                    <p class="plant__info--price">Price: <span>${plant.price}VND</span></p>
                    <p class="plant__info--description">
                        ${plant.description}
                    </p>
                    <p class="plant__info--status">Status: ${plant.status}</p>
                    <p class="plant__info--cateId">Category ID: ${plant.cateId}</p>
                    <p class="plant__info--cateName">Category name: ${plant.cateName}</p>
                </div>
            </div>
        </div>
        
            <%@ include file="../common/footer.jsp" %>
    </body>
</html>
