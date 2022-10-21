<%@page import="Entidades.City"%>
<%@page import="DAOs.DAOCity"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Torneio</title>

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
                <h2 class="my-3">Torneio</h2>
                <input type="number" class="form-control mb-3" placeholder="Id do Torneio" name="id" required>
                <input type="date" class="form-control mb-3" placeholder="Início do Torneio" name="start" required >
                <input type="date" class="form-control mb-3" placeholder="Final do Torneio" name="end" required >
                <input type="number" class="form-control mb-3" placeholder="Rodadas" name="rounds" required >
                <select class="form-select mb-3" name="city" required>
                    <%
                        DAOCity daoCity = new DAOCity();
                        List<City> resultCity = daoCity.list();
                        if (resultCity.size() != 0) {
                            for (int i = 0; i < resultCity.size(); i++) {
                                out.println("<option value=\"" + resultCity.get(i).getIdCity() + "\">" + resultCity.get(i).getNameCity() + "</option>");
                            }
                        }
                    %>
                </select>
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-danger">Voltar</a>
                    <button type="submit" class="btn btn-success">Inserir torneio</button>
                    <a href="listaresult.jsp" class="btn btn-success">Listar torneios</a>
                </div>
            </form>
        </div>
    </body>

</html>