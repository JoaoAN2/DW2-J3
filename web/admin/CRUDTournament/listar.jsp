<%@page import="Tools.DateTools"%>
<%@page import="Entidades.Tournament"%>
<%@page import="DAOs.DAOTournament"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Torneios</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>
    </head>
   <body>
        
        <h2 style="text-align: center" class="mt-5">Lista de Torneios</h2>
        <ul style="text-align: center; list-style: none;">
        <%
            DAOTournament daoTournament = new DAOTournament();
            List<Tournament> result= daoTournament.list();
            DateTools dt = new DateTools();
            if (result.size() != 0) {
                for (Tournament tournament : result) {
                    out.println("<li>" + tournament.getIdTournament() + " | " + dt.conversionDateToString(tournament.getStartDateTournament()) + " | " + dt.conversionDateToString(tournament.getEndDateTournament()) +  " | " + tournament.getRoundsTournament() + " | " + tournament.getCityIdTournament().getIdCity() + "</li>");
                }
            } else {
                out.println("<li>Nenhum torneio cadastrado</li>");
            }
            %>
        </ul>

        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-success">Voltar</a>
        </div>
    </body>
</html>
