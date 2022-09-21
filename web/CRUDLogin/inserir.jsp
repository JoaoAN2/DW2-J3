<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alunitos</title>

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>

        <link rel="stylesheet" href="css/custom.css">
    </head>

    <body>
        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Inserir" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="my-3">Gender</h2>
                <input type="text" class="form-control mb-3" placeholder="Sigla do gênero" name="id" maxlength="3" required>
                <input type="text" class="form-control mb-3" placeholder="Gênero completo" name="gender" required>
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-danger">Voltar</a>
                    <button type="submit" class="btn btn-success">Inserir gênero</button>
                    <a href="listar.jsp" class="btn btn-success">Listar gêneros</a>
                </div>
            </form>
        </div>
    </body>

</html>