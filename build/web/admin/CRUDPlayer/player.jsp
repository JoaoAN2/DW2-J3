<%@page import="Entidades.Player"%>
<%@page import="Entidades.Title"%>
<%@page import="DAOs.DAOTitle"%>
<%@page import="Entidades.Gender"%>
<%@page import="DAOs.DAOGender"%>
<%@page import="Entidades.Federation"%>
<%@page import="DAOs.DAOFederation"%>
<%@page import="Tools.DateTools"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jogador</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>>
    </head>
    <body>

        <%
            Player result = (Player) request.getAttribute("playerBuscar");
            DateTools dt = new DateTools();
            if (result != null) { %>

        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Alterar" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2/DW2-J3" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="my-3">Jogador</h2>
                <input type="number" class="form-control mb-3" placeholder="Id do Jogador" id="id" name="id" required value="<%out.print(result.getIdPlayer());%>" readonly>
                <input type="text" class="form-control mb-3" placeholder="Nome do jogador" name="name" required value="<%out.print(result.getNamePlayer());%>">
                <input type="number" class="form-control mb-3" placeholder="Pontos Fide" name="points" required value="<%out.print(result.getPointsPlayer());%>">
                <input type="date" class="form-control mb-3" placeholder="Data de Nascimento" name="birthday" required value="<%out.print(dt.conversionDateToStringBD(result.getBirthdayPlayer()));%>">
                <select class="form-select mb-3" name="federation">
                    <%
                        DAOFederation daoFederation = new DAOFederation();
                        List<Federation> resultFederation = daoFederation.list();
                        if (resultFederation.size() != 0) {
                            for (int i = 0; i < resultFederation.size(); i++) {
                                out.println("<option value=\"" + resultFederation.get(i).getSiglaFederation() + "\"" + (resultFederation.get(i).getSiglaFederation() == result.getFederationSiglaPlayer().getSiglaFederation() ? "selected" : "") +">" + resultFederation.get(i).getNameFederation() + "</option>");
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
                                out.println("<option value=\"" + resultGender.get(i).getSiglaGender() + "\"" + (resultGender.get(i).getSiglaGender() == result.getGenderSiglaPlayer().getSiglaGender() ? "selected" : "") + ">" + resultGender.get(i).getFullGender() + "</option>");
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
                                out.println("<option value=\"" + resultTitle.get(i).getSiglaTitle() + "\"" + (resultTitle.get(i).getSiglaTitle() == result.getTitleSiglaPlayer().getSiglaTitle() ? "selected" : "") +">" + resultTitle.get(i).getNameTitle() + "</option>");
                            }
                        }
                    %>
                </select>
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-danger">Voltar</a>
                    <button type="submit" class="btn btn-success">Alterar jogador</button>
                    <button type="button" class="btn btn-success" id="deletar">Deletar jogador</button>
                </div>
            </form>
        </div>

        <script>
            const id = document.getElementById("id").value;
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
                req.send('id=' + encodeURIComponent(id));

                alert("Usuário " + id + " removido com sucesso");
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
