<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </head>
    <body>
        <%@include file="./common/header.jsp" %>

        <div class="container">
            <p class="text-center text-danger mt-5">${loginWarning}</p>
            <form class="form form-auth px-4" action="mainController" method="POST">
                <input type="hidden" name="action" value="login"/>
                <h2 class="text-center mb-5">Login</h2>

                <div class="mb-3">
                    <p class="text-danger text-center">${loginError}</p>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroupPrepend2">
                                <ion-icon name="person-outline"></ion-icon>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="validationDefaultUsername" name="email" value="${errorAccount.email}">

                        <div class="invalid-feedback was-validated">
                            ${emailError}
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroupPrepend2">
                                <ion-icon name="lock-closed-outline"></ion-icon>
                            </span>
                        </div>
                        <input type="password" class="form-control" id="validationDefaultUsername" name="password" value="${errorAccount.password}">

                        <div class="invalid-feedback">
                            ${passwordError}
                        </div>

                    </div>
                </div>
                <div class="form-check mb-5">
                    <c:choose>
                        <c:when test="${rememberMe}">
                            <input class="form-check-input" type="checkbox" value="y" name="rememberMe" id="remember" checked>
                        </c:when>
                        <c:when test="${!rememberMe}">
                            <input class="form-check-input" type="checkbox" value="y" name="rememberMe" id="remember">
                        </c:when>
                    </c:choose>
                    <label class="form-check-label" for="remember">
                        Remember me
                    </label>
                </div>

                <div class="text-center">
                    <input class="btn btn-primary ms-auto" type="submit" value="Login" />
                </div>
            </form>
        </div>

        <%@include file="./common/footer.jsp" %>

    </body>
</html>
