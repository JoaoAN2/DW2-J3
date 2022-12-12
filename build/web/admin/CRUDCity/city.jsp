<%@page import="Entidades.City"%>
<%@page import="Entidades.State"%>
<%@page import="DAOs.DAOState"%>
<%@page import="Tools.DateTools"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cidade</title>

        <link rel="stylesheet" href="css/custom.css">

        <!-- Bootstrap -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/css/bootstrap.min.js"></script>>
    </head>
    <body>

        <%
            City result = (City) request.getAttribute("cityBuscar");
            if (result != null) { %>

        <div class="d-flex justify-content-center align-items-center min-vh-100">
            <form action="Alterar" class="border border-dark p-5" method="POST">
                <div class="text-center">
                    <a href="https://www.github.com/JoaoAN2/DW2-J3" class="copy-name" target="_blank">
                        <h1>@J³</h1>
                    </a>
                </div>
                <h2 class="my-3">Cidade</h2>
                <input type="text" class="form-control mb-3" placeholder="Id da Cidade" id="id" name="id" required value="<%out.print(result.getIdCity());%>" readonly>
                <input type="text" class="form-control mb-3" placeholder="Nome da cidade" name="name" required value="<%out.print(result.getNameCity());%>">
                <select class="form-select mb-3" name="state">
                    <%
                        DAOState daoState = new DAOState();
                        List<State> resultState = daoState.list();
                        if (resultState.size() != 0) {
                            for (int i = 0; i < resultState.size(); i++) {
                                out.println("<option value=\"" + resultState.get(i).getSiglaState() + "\"" + (resultState.get(i).getSiglaState() == result.getStateSiglaCity().getSiglaState() ? "selected" : "") +">" + resultState.get(i).getNameState() + "</option>");
                            }
                        }
                    %>
                </select>
                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-danger">Voltar</a>
                    <button type="submit" class="btn btn-success">Alterar cidade</button>
                    <button type="button" class="btn btn-success" id="deletar">Deletar cidade</button>
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
