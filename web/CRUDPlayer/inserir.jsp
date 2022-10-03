<%@page import="Entidades.Federation"%>
<%@page import="DAOs.DAOFederation"%>
<%@page import="Entidades.Gender"%>
<%@page import="DAOs.DAOGender"%>
<%@page import="Entidades.Title"%>
<%@page import="DAOs.DAOTitle"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Jogador</title>

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
            <form action="Inserir" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="my-3">Jogador</h2>
                <input type="number" class="form-control mb-3" placeholder="Id do Jogador" name="id" required>
                <input type="text" class="form-control mb-3" placeholder="Nome do jogador" name="name" required >
                <input type="number" class="form-control mb-3" placeholder="Pontos Fide" name="points" required >
                <input type="date" class="form-control mb-3" placeholder="Data de Nascimento" name="birthday" required >
                <select class="form-select mb-3" name="federation">
                    <% 
                        DAOFederation daoFederation = new DAOFederation();
                        List<Federation> resultFederation = daoFederation.list();
                        if (resultFederation.size() != 0) {
                            for (int i = 0; i < resultFederation.size(); i++) {
                                out.println("<option value=\"" + resultFederation.get(i).getSiglaFederation()+ "\">" + resultFederation.get(i).getNameFederation()+ "</option>");
                            }
                        }
                    %>
                </select>
                <select class="form-select mb-3" name="gender">
                    <% 
                        DAOGender daoGender = new DAOGender();
                        List<Gender> resultGender = daoGender.list();
                        if (resultGender.size() != 0) {
                            for (int i = 0; i < resultGender.size(); i++) {
                                out.println("<option value=\"" + resultGender.get(i).getSiglaGender()+ "\">" + resultGender.get(i).getFullGender()+ "</option>");
                            }
                        }
                    %>
                </select>
                <select class="form-select mb-3" name="title">
                    <% 
                        DAOTitle daoTitle = new DAOTitle();
                        List<Title> resultTitle = daoTitle.list();
                        if (resultTitle.size() != 0) {
                            for (int i = 0; i < resultTitle.size(); i++) {
                                out.println("<option value=\"" + resultTitle.get(i).getSiglaTitle()+ "\">" + resultTitle.get(i).getNameTitle()+ "</option>");
                            }
                        }
                    %>
                </select>
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-danger">Voltar</a>
                    <button type="submit" class="btn btn-success">Inserir jogador</button>
                    <a href="listaresult.jsp" class="btn btn-success">Listar jogadors</a>
                </div>
            </form>
        </div>
    </body>

</html>