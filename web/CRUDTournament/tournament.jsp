<%@page import="Entidades.Tournament"%>
<%@page import="Entidades.City"%>
<%@page import="DAOs.DAOCity"%>
<%@page import="Tools.DateTools"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>torneio</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    </head>
    <body>

        <%
            Tournament result = (Tournament) request.getAttribute("tournamentBuscar");
            DateTools dt = new DateTools();
            if (result != null) { %>

        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Alterar" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="my-3">Torneio</h2>
                <input type="number" class="form-control mb-3" placeholder="Id do Torneio" id="id" name="id" required value="<%out.print(result.getIdTournament());%>" readonly>
                <input type="date" class="form-control mb-3" placeholder="Data de Início" name="start" required value="<%out.print(dt.conversionDateToStringBD(result.getStartDateTournament()));%>">
                <input type="date" class="form-control mb-3" placeholder="Data Final" name="end" required value="<%out.print(dt.conversionDateToStringBD(result.getEndDateTournament()));%>">
                <input type="number" class="form-control mb-3" placeholder="Rodadas" name="rounds" required value="<%out.print(result.getRoundsTournament());%>">
                <select class="form-select mb-3" name="city">
                    <%
                        DAOCity daoCity = new DAOCity();
                        List<City> resultCity = daoCity.list();
                        if (resultCity.size() != 0) {
                            for (int i = 0; i < resultCity.size(); i++) {
                                out.println("<option value=\"" + resultCity.get(i).getIdCity() + "\"" + (resultCity.get(i).getIdCity() == result.getCityIdTournament().getIdCity() ? "selected" : "") +">" + resultCity.get(i).getNameCity() + "</option>");
                            }
                        }
                    %>
                </select>
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-danger">Voltar</a>
                    <button type="submit" class="btn btn-success">Alterar torneio</button>
                    <button type="button" class="btn btn-success" id="deletar">Deletar torneio</button>
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
