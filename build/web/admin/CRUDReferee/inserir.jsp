<%@page import="Entidades.Player"%>
<%@page import="DAOs.DAOPlayer"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.CatReferee"%>
<%@page import="DAOs.DAOCatReferee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Arbitro</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>>
    </head>

    <body>
        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Inserir" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2/DW2-J3" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="my-3">Arbitro</h2>
                <select class="form-select mb-3" name="id">
                    <% 
                        DAOPlayer daoPlayer = new DAOPlayer();
                        List<Player> resultPlayer = daoPlayer.list();
                        if (resultPlayer.size() != 0) {
                            for (int i = 0; i < resultPlayer.size(); i++) {
                                out.println("<option value=\"" + resultPlayer.get(i).getIdPlayer()+ "\">" + resultPlayer.get(i).getNamePlayer()+ "</option>");
                            }
                        }
                    %>
                </select>
                <select class="form-select mb-3" name="catReferee">
                    <% 
                        DAOCatReferee daoCatReferee = new DAOCatReferee();
                        List<CatReferee> resultCatReferee = daoCatReferee.list();
                        if (resultCatReferee.size() != 0) {
                            for (int i = 0; i < resultCatReferee.size(); i++) {
                                out.println("<option value=\"" + resultCatReferee.get(i).getSiglaCatReferee()+ "\">" + resultCatReferee.get(i).getNameCatReferee()+ "</option>");
                            }
                        }
                    %>
                </select>
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-danger">Voltar</a>
                    <button type="submit" class="btn btn-success">Inserir arbitro</button>
                    <a href="listaresult.jsp" class="btn btn-success">Listar arbitros</a>
                </div>
            </form>
        </div>
    </body>

</html>