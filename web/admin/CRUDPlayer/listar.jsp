<%@page import="Tools.DateTools"%>
<%@page import="Entidades.Player"%>
<%@page import="DAOs.DAOPlayer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Jogadores</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>
    </head>
   <body>
        
        <h2 style="text-align: center" class="mt-5">Lista de Jogadores</h2>
        <ul style="text-align: center; list-style: none;">
        <%
            DAOPlayer daoPlayer = new DAOPlayer();
            List<Player> result= daoPlayer.list();
            DateTools dt = new DateTools();
            if (result.size() != 0) {
                for (Player player : result) {
                    out.println("<li>" + player.getIdPlayer() + " | " + player.getNamePlayer()+ " | " + player.getPointsPlayer() +  " | " + dt.conversionDateToString(player.getBirthdayPlayer())+ " | " + player.getFederationSiglaPlayer().getSiglaFederation() +  " | "  + player.getGenderSiglaPlayer().getSiglaGender() + " | " + player.getTitleSiglaPlayer().getSiglaTitle() + "</li>");
                }
            } else {
                out.println("<li>Nenhum jogador cadastrado</li>");
            }
            %>
        </ul>

        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-success">Voltar</a>
        </div>
    </body>
</html>
