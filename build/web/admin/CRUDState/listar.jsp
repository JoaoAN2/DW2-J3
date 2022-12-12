<%@page import="Entidades.State"%>
<%@page import="DAOs.DAOState"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Estados</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>
    </head>
   <body>
        
        <h2 style="text-align: center" class="mt-5">Lista de Estados</h2>
        <ul style="text-align: center; list-style: none;">
        <%
            DAOState daoState = new DAOState();
            List<State> result= daoState.list();
            if (result.size() != 0) {
                for (State state : result) {
                    out.println("<li>" + state.getSiglaState() + " | " + state.getNameState() + " | " + state.getFederationIdState().getSiglaFederation() + "</li>");
                }
            } else {
                out.println("<li>Nenhum estado cadastrado</li>");
            }
            %>
        </ul>

        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-success">Voltar</a>
        </div>
    </body>
</html>
