<c:redirect url="${(loginedUser != null && loginedUser.role == 1) ? 'viewAllPlants' : 'home'}" />