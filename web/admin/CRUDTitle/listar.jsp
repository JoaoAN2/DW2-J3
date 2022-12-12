<%@page import="Entidades.Title"%>
<%@page import="DAOs.DAOTitle"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Títulos</title>

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="css/custom.css">
    </head>
   <body>
        
        <h2 style="text-align: center" class="mt-5">Lista de Títulos</h2>
        <ul style="text-align: center; list-style: none;">
        <%
            DAOTitle daoTitle = new DAOTitle();
            List<Title> result= daoTitle.list();
            if (result.size() != 0) {
                for (int i = 0; i < result.size(); i++) {
                    out.println("<li>" + result.get(i).getSiglaTitle() + " | " + result.get(i).getNameTitle()+ "</li>");
                }
            } else {
                out.println("<li>Nenhum título cadastrado</li>");
            }
            %>
        </ul>

        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-success">Voltar</a>
        </div>
    </body>
</html>
