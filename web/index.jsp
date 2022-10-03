<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Alunitos</title>

        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="assets/css/bootstrap.min.js"></script>

        <link rel="stylesheet" href="css/custom.css">
    </head>

    <body>
        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <div class="border border-dark p-5">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="mt-5 mb-3">CRUDs</h2>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="CRUDGender/index.jsp" class="w-100 btn btn-danger">Gêneros</a></li>
                    <li class="mb-2"><a href="CRUDTitle/index.jsp" class="w-100 btn btn-primary">Título</a></li>
                    <li class="mb-2"><a href="CRUDFederation/index.jsp" class="w-100 btn btn-success">Federação</a></li>
                    <li class="mb-2"><a href="CRUDCatReferee/index.jsp" class="w-100 btn btn-warning">Categoria de árbitros</a></li>
                    <li class="mb-2"><a href="CRUDPlayer/index.jsp" class="w-100 btn btn-secondary">Jogadores</a></li>
                    <li class="mb-2"><a href="CRUDState/index.jsp" class="w-100 btn btn-warning">Estados</a></li>
                    <li class="mb-2"><a href="CRUDCity/index.jsp" class="w-100 btn btn-success">Cidades</a></li>
                    <li class="mb-2"><a href="CRUDTournament/index.jsp" class="w-100 btn btn-primary">Torneios</a></li>
                </ul>
            </div>
        </div>
    </body>
</html>