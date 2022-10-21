<%@page import="Entidades.City"%>
<%@page import="DAOs.DAOCity"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Cidades</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>
    </head>
   <body>
        
        <h2 style="text-align: center" class="mt-5">Lista de Cidades</h2>
        <ul style="text-align: center; list-style: none;">
        <%
            DAOCity daoCity = new DAOCity();
            List<City> result= daoCity.list();
            if (result.size() != 0) {
                for (City city : result) {
                    out.println("<li>" + city.getIdCity() + " | " + city.getNameCity() + " | " + city.getStateSiglaCity().getSiglaState() + "</li>");
                }
            } else {
                out.println("<li>Nenhum cidade cadastrado</li>");
            }
            %>
        </ul>

        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-success">Voltar</a>
        </div>
    </body>
</html>
