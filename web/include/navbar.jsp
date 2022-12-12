<%@page import="Entidades.Player"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light px-5 sticky-top">

    <div class="container">

        <a class="navbar-brand" href="index.jsp">
            <img src="assets/img/chess-piece.png" width="50" height="50" class="d-inline-block align-top" alt="">
            <span style="font-size: 35px">J³</span>
        </a>

        <div class="collapse navbar-collapse flex-row-reverse" id="navbarNavDropdown">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item" style="padding-top: 14px">
                    <a class="nav-link" href="players.jsp">Jogadores</a>
                </li>

                <li class="nav-item" style="padding-top: 14px">
                    <a class="nav-link" href="tournaments.jsp">Torneios</a>
                </li>

                <li class="nav-item" style="padding-top: 14px">
                    <a class="nav-link" href="referees.jsp">Arbitros</a>
                </li>

                <li class="nav-item" style="padding-top: 14px">
                    <a class="nav-link" href="organizations.jsp">Organizadores</a>
                </li>

                <%  Player user = (Player) session.getAttribute("user");
                    if (user == null) { %>
                <li class="nav-item" style="padding-top: 14px">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary nav-item" style="margin-right: 1rem;" data-bs-toggle="modal" data-bs-target="#register-modal">
                        Registrar
                    </button>
                </li>

                <li class="nav-item" style="padding-top: 14px">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary nav-item" data-bs-toggle="modal" data-bs-target="#login-modal">
                        Login
                    </button>
                </li>
                <% } else {%>

                <li class="nav-item dropdown nav-user-picture">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="<%= user.getProfilePictureUrl()%>" alt="<%= user.getNamePlayer()%>">
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item py-3" href="#">Perfil do jogador</a></li>
                        <li><a class="dropdown-item py-3" href="Logout">Logout</a></li>
                    </ul>
                </li>
                
                <%}%>
            </ul>
        </div>
    </div>
</nav>

<% if (user == null) { %>
<jsp:include page="login-modal.jsp" />
<jsp:include page="register-modal.jsp" />
<% }%>
