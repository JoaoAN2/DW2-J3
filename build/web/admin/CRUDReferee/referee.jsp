<%@page import="Entidades.CatReferee"%>
<%@page import="DAOs.DAOCatReferee"%>
<%@page import="Entidades.Player"%>
<%@page import="DAOs.DAOPlayer"%>
<%@page import="Entidades.Referee"%>
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
        <title>arbitro</title>


        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>>

        <link rel="stylesheet" href="../assets/css/custom.css">

    </head>
    <body>

        <%
            Referee result = (Referee) request.getAttribute("refereeBuscar");
            DateTools dt = new DateTools();
            if (result != null) { %>

        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Alterar" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2/DW2-J3" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="my-3">Arbitro</h2>

                <select class="form-select mb-3" name="id" readonly id="id">
                    <%
                        
                        out.println("<option value=\"" + result.getPlayerIdPlayer() + "\"" + ">" + new DAOPlayer().obter(result.getPlayerIdPlayer()).getNamePlayer() + "</option>");%>
                </select>

                <select class="form-select mb-3" name="catReferee">
                    <%
                        DAOCatReferee daoCatReferee = new DAOCatReferee();
                        List<CatReferee> resultCatReferee = daoCatReferee.list();
                        if (resultCatReferee.size() != 0) {
                            for (int i = 0; i < resultCatReferee.size(); i++) {
                                out.println("<option value=\"" + resultCatReferee.get(i).getSiglaCatReferee() + "\"" + (resultCatReferee.get(i).getSiglaCatReferee() == result.getCatRefereeIdReferee().getSiglaCatReferee() ? "selected" : "") + ">" + resultCatReferee.get(i).getNameCatReferee() + "</option>");
                            }
                        }
                    %>
                </select>

                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-danger">Voltar</a>
                    <button type="submit" class="btn btn-success">Alterar arbitro</button>
                    <button type="button" class="btn btn-success" id="deletar">Deletar arbitro</button>
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
