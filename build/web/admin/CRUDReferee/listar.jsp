<%@page import="Tools.DateTools"%>
<%@page import="Entidades.Referee"%>
<%@page import="DAOs.DAOReferee"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Arbitros</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>
    </head>
   <body>
        
        <h2 style="text-align: center" class="mt-5">Lista de Arbitros</h2>
        <ul style="text-align: center; list-style: none;">
        <%
            DAOReferee daoReferee = new DAOReferee();
            List<Referee> result= daoReferee.list();
            DateTools dt = new DateTools();
            if (result.size() != 0) {
                for (Referee referee : result) {
                    out.println("<li>" + referee.getPlayerIdPlayer() + " | " + referee.getPlayer().getNamePlayer() + "</li>");
                }
            } else {
                out.println("<li>Nenhum arbitro cadastrado</li>");
            }
            %>
        </ul>

        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-success">Voltar</a>
        </div>
    </body>
</html>
