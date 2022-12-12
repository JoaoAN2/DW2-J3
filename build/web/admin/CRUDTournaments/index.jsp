<%@page import="Entidades.Referee"%>
<%@page import="Entidades.Tournament"%>
<%@page import="Entidades.Player"%>
<%@page import="DAOs.DAOPlayer"%>
<%@page import="Entidades.Tournaments"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.DAOTournaments"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Tournament result = (Tournament) session.getAttribute("tournament");%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Torneios</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>
    </head>

    <body>
        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Atualizar" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2/DW2-J3" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="mt-5 mb-3">Jogadores do torneio <%out.print(result.getIdTournament());%></h2>
                <%
                    DAOPlayer daoPlayer = new DAOPlayer();
                    DAOTournaments daoTournaments = new DAOTournaments();
                  /*  
                    Tournaments tournaments = daoTournaments.obter();
                    
                    List<Player> playerList = result.; */
                    for (Player player : daoPlayer.list()) { 
                        // String checked = refereeList.contains(player) ? "checked" : "";
                        String checked = "";
                %>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="players" value="<% out.print(player.getIdPlayer());%>" id="<% out.print(player.getIdPlayer());%>" <%out.print(checked);%>>
                    <label class="form-check-label" for="<% out.print(player.getIdPlayer());%>"><% out.print(player.getIdPlayer());%> | <% out.print(player.getNamePlayer());%></label>
                </div>
                <% } %>
                <div class="text-center mt-3 mb-2">
                    <button type="submit" class="btn btn-success">Atualizar lista de jogadores</button>
                    <a href="listar.jsp" class="btn btn-primary">Listar jogadores do torneio</a>
                </div>

                <a href="../index.jsp">Voltar para o menu</a>
            </form>
        </div>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) { %>
        <script>alert("<%out.print(message);%>")</script>
        <% }%>
    </body>
</html>