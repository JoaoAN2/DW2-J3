<%@page import="Entidades.Federation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Federação</title>

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>

        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body>

        <%
            Federation result = (Federation) request.getAttribute("federationBuscar");
            if (result != null) { %>

            <div class="d-flex justify-content-center align-items-center min-vh-100">
                <form action="Alterar" class="border border-dark p-5" method="POST">
                    <div class="text-center">
                        <a href="https://www.github.com/JoaoAN2" class="copy-name" target="_blank">
                            <h1>@J³</h1>
                        </a>
                    </div>
                    <h2 class="my-3">Federação</h2>
                    <input value="<%out.print(result.getSiglaFederation());%>" type="text" class="form-control mb-3" placeholder="Sigla do Federação" name="id" maxlength="3" id="id" readonly>
                    <input value="<%out.print(result.getNameFederation());%>" type="text" class="form-control mb-3" placeholder="Nome do Federação" name="federation">
                    <div class="text-center mt-3">
                        <a href="index.jsp" class="btn btn-danger">Voltar</a>
                        <button type="submit" class="btn btn-success">Alterar Federação</button>
                        <button type="button" class="btn btn-success" id="deletar">Deletar Federação</button>
                    </div>
                </form>
            </div>

            <script>
                const federation = document.getElementById("id").value;
                const btnDelete = document.getElementById("deletar");

                btnDelete.addEventListener("click", event => {
                    var req;
                    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
                        req = new XMLHttpRequest();
                    } else if (window.ActiveXObject) { // IE 8 and older
                        req = new ActiveXObject("Microsoft.XMLHTTP");
                    }

                    req.open('POST', "Remover");
                    req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    req.send('id=' + encodeURIComponent(federation));
                    
                    alert("Federação " + federation + " removido com sucesso");
                    window.location.href = "index.jsp";
                });
            </script>
               
            <% } else { %>
            <h1 class="text-center">NÂO ENCONTRADO</h1>
            <div class="text-center mt-3">
                <a href="index.jsp" class="btn btn-success">Voltar</a>
            </div>
            <% } %> 
    </body>
</html>
