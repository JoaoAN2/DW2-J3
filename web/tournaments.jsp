<%@page import="java.util.List"%>
<%@page import="Entidades.Player"%>
<%@page import="DAOs.DAOPlayer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>J³</title>

        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

        <link href="assets/css/fontawesome.min.css" rel="stylesheet" />        
        <link rel="stylesheet" href="assets/css/custom.css">

    </head>
    <body>
        <jsp:include page="include/navbar.jsp" />

        <section>
            <div class="container">
                <h1 class="text-center">Torneios</h1>

                <div class="row mt-5">

                    <div class="col-md-4 p-3">
                        <div class="card" style="width: 22rem;">
                            <img src="assets/img/irt2.jpg" class="card-img-top" alt="..." style="height: 13rem;">
                            <div class="card-body">
                                <h5 class="card-title">Torneio 1</h5>
                                <p class="card-text">Conteúdo do card do torneio que vai acontecer algum dia</p>
                                <a href="tournament.jsp" class="btn btn-primary">Ir para o torneio</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 p-3">
                        <div class="card" style="width: 22rem;">
                            <img src="assets/img/irt.jpg" class="card-img-top" alt="..." style="height: 13rem;">
                            <div class="card-body">
                                <h5 class="card-title">Torneio 2</h5>
                                <p class="card-text">Conteúdo do card do torneio que vai acontecer algum dia</p>
                                <a href="tournament.jsp" class="btn btn-primary">Ir para o torneio</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 p-3">
                        <div class="card" style="width: 22rem;">
                            <img src="assets/img/irt2.jpg" class="card-img-top" alt="..." style="height: 13rem;">
                            <div class="card-body">
                                <h5 class="card-title">Torneio 3</h5>
                                <p class="card-text">Conteúdo do card do torneio que vai acontecer algum dia</p>
                                <a href="tournament.jsp" class="btn btn-primary">Ir para o torneio</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="include/footer.jsp" />

        <script src="assets/js/jquery-3.6.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) { %>
        <script>alert("<%out.print(message);%>")</script>
        <% }%>
    </body>
</html>
