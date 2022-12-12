<%@page import="Entidades.Gender"%>
<%@page import="DAOs.DAOGender"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Gêneros</title>

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="css/custom.css">
    </head>
   <body>
        
        <h2 style="text-align: center" class="mt-5">Lista de Gêneros</h2>
        <ul style="text-align: center; list-style: none;">
        <%
            DAOGender daoGender = new DAOGender();
            List<Gender> result= daoGender.list();
            if (result.size() != 0) {
                for (int i = 0; i < result.size(); i++) {
                    out.println("<li>" + result.get(i).getSiglaGender() + " | " + result.get(i).getFullGender() + "</li>");
                }
            } else {
                out.println("<li>Nenhum gênero cadastrado</li>");
            }
            %>
        </ul>

        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-success">Voltar</a>
        </div>
    </body>
</html>
