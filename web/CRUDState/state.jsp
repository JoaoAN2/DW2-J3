<%@page import="Entidades.State"%>
<%@page import="Entidades.Federation"%>
<%@page import="DAOs.DAOFederation"%>
<%@page import="Tools.DateTools"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>estado</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>>
    </head>
    <body>

        <%
            State result = (State) request.getAttribute("stateBuscar");
            DateTools dt = new DateTools();
            if (result != null) { %>

        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Alterar" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2/DW2-J3" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="my-3">Estado</h2>
                <input type="text" class="form-control mb-3" placeholder="Sigla do Estado" id="sigla" name="sigla" required value="<%out.print(result.getSiglaState());%>" readonly>
                <input type="text" class="form-control mb-3" placeholder="Nome do estado" name="name" required value="<%out.print(result.getNameState());%>">
                <select class="form-select mb-3" name="federation">
                    <%
                        DAOFederation daoFederation = new DAOFederation();
                        List<Federation> resultFederation = daoFederation.list();
                        if (resultFederation.size() != 0) {
                            for (int i = 0; i < resultFederation.size(); i++) {
                                out.println("<option value=\"" + resultFederation.get(i).getSiglaFederation() + "\"" + (resultFederation.get(i).getSiglaFederation() == result.getFederationIdState().getSiglaFederation() ? "selected" : "") +">" + resultFederation.get(i).getNameFederation() + "</option>");
                            }
                        }
                    %>
                </select>
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-danger">Voltar</a>
                    <button type="submit" class="btn btn-success">Alterar estado</button>
                    <button type="button" class="btn btn-success" id="deletar">Deletar estado</button>
                </div>
            </form>
        </div>

        <script>
            const sigla = document.getElementById("sigla").value;
            const btnDelete = document.getElementById("deletar");

            console.log(btnDelete);

            btnDelete.addEventListener("click", event => {
                console.log("Apertou princeso");

                var req;
                if (window.XMLHttpRequest) { // Mozilla, Safari, ...
                    req = new XMLHttpRequest();
                } else if (window.ActiveXObject) { // IE 8 and older
                    req = new ActiveXObject("Microsoft.XMLHTTP");
                }

                req.open('POST', "Remover");
                req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                req.send('sigla=' + encodeURIComponent(sigla));

                alert("Usuário " + sigla + " removido com sucesso");
                window.location.href = "index.jsp";
            });
        </script>

        <% } else { %>
        <h1 class="text-center">NÂO ENCONTRADO</h1>
        <div class="text-center mt-3">
            <a href="index.jsp" class="btn btn-success">Voltar</a>
        </div>
        <% }%> 
    </body>
</html>
