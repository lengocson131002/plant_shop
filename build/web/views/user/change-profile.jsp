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
            <%@ include file="../common/header.jsp" %>

        <div class="container">
            <form class="form form-auth px-4" action="${pageContext.request.contextPath}/mainController" method="POST">
                <input type="hidden" name="action" value="changeProfile">
                <h2 class="text-center mb-5">Change profile</h2>

                <i class="text-danger d-block text-center mb-3">${updateError}</i>
                <i class="text-success d-block text-center mb-3">${announcement}</i>

                <div class="mb-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroupPrepend2">
                                <ion-icon name="people-outline"></ion-icon>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="Fullname" name="fullname"  value="${loginedUser.fullname}">

                        <div class="invalid-feedback">
                            ${fullnameError}
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
                        <input type="password" class="form-control"  placeholder="Password" name="password"  value="${loginedUser.password}">

                        <div class="invalid-feedback">
                            ${passwordError}
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroupPrepend2">
                                <ion-icon name="call-outline"></ion-icon>
                            </span>
                        </div>
                        <input type="text" class="form-control"  placeholder="Phone number" name="phoneNumber"  value="${loginedUser.phone}">

                        <div class="invalid-feedback">
                            ${phoneError}
                        </div>

                    </div>
                </div>
                <div class="text-center">
                    <input class="btn btn-primary ms-auto" type="submit" value="Update" />
                </div>
            </form>
        </div>

            <%@ include file="../common/footer.jsp" %>
    </body>
</html>
