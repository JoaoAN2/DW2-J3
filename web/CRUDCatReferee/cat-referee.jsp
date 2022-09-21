<%@page import="Entidades.CatReferee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categoria de Árbitro</title>

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>

        <link rel="stylesheet" href="css/custom.css">
    </head>
    <body>

        <%
            CatReferee result = (CatReferee) request.getAttribute("catRefereeBuscar");
            if (result != null) { %>

            <div class="d-flex justify-content-center align-items-center min-vh-100">
                <form action="Alterar" class="border border-dark p-5" method="POST">
                    <div class="text-center">
                        <a href="https://www.github.com/JoaoAN2" class="copy-name" target="_blank">
                            <h1>@J³</h1>
                        </a>
                    </div>
                    <h2 class="my-3">Categoria de Árbitro</h2>
                    <input value="<%out.print(result.getSiglaCatReferee());%>" type="text" class="form-control mb-3" placeholder="Sigla do Categoria de Árbitro" name="id" maxlength="3" id="id" readonly>
                    <input value="<%out.print(result.getNameCatReferee());%>" type="text" class="form-control mb-3" placeholder="Nome do Categoria de Árbitro" name="catReferee">
                    <div class="text-center mt-3">
                        <a href="index.jsp" class="btn btn-danger">Voltar</a>
                        <button type="submit" class="btn btn-success">Alterar Categoria de Árbitro</button>
                        <button type="button" class="btn btn-success" id="deletar">Deletar Categoria de Árbitro</button>
                    </div>
                </form>
            </div>

            <script>
                const catReferee = document.getElementById("id").value;
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
                    req.send('id=' + encodeURIComponent(catReferee));
                    
                    alert("Categoria de Árbitro " + catReferee + " removido com sucesso");
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
