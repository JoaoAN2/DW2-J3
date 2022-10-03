<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Jogadores</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </head>

    <body>
        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Buscar" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="mt-5 mb-3">Pesquisar Jogador</h2>
                <input type="number" class="form-control mb-3" placeholder="Id do Jogador" name="id" required>
                <div class="text-center mt-3 mb-2">
                    <a href="inserir.jsp" class="btn btn-danger">Inserir jogador</a>
                    <button type="submit" class="btn btn-success">Procurar jogador</button>
                    <a href="listar.jsp" class="btn btn-primary">Listar jogadores</a>
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