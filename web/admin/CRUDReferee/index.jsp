<%@page import="DAOs.DAOPlayer"%>
<%@page import="Entidades.Referee"%>
<%@page import="java.util.List"%>
<%@page import="DAOs.DAOReferee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Arbitros</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>
    </head>

    <body>
        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Buscar" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2/DW2-J3" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="mt-5 mb-3">Pesquisar Arbitro</h2>
                <select type="number" class="form-control mb-3" placeholder="Id do Arbitro" name="id" required>
                    <%
                        DAOReferee daoReferee = new DAOReferee();
                        List<Referee> referees = daoReferee.list();
                        for (Referee referee : referees) {
                            out.println("<option value=\"" + referee.getPlayerIdPlayer() + "\">" + new DAOPlayer().obter(referee.getPlayerIdPlayer()).getNamePlayer() + "</option>");
                        }
                    %>
                </select>
                <div class="text-center mt-3 mb-2">
                    <a href="inserir.jsp" class="btn btn-danger">Inserir arbitro</a>
                    <button type="submit" class="btn btn-success">Procurar arbitro</button>
                    <a href="listar.jsp" class="btn btn-primary">Listar arbitros</a>
                </div>

                <a href="../index.jsp">Voltar para o menu</a>
            </form>
        </div>

        <%
        String message = (String) request.getAttribute("message");
        if (message != null) { %>
        <script>alert("<%out.print(message);%>")</script>
        <% } %>
    </body>
</html>