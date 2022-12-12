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

        <link rel="stylesheet" href="assets/css/custom.css">
    </head>
    <body>
        <jsp:include page="include/navbar.jsp" />

        <section class="py-0">

            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="assets/img/irt2.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="assets/img/irt.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            
        </section>

        <section>
            <div class="container">
                <div class="row">

                    <div class="col-md-4 text-center">
                        <img class="grayscale p-5" src="assets/img/card-players.png" style="height: 80vh;" />
                    </div>
                    <div class="col-md-4 text-center">
                        <img class="grayscale p-5" src="assets/img/card-torneios.png" style="height: 80vh;" />
                    </div>
                    <div class="col-md-4 text-center">
                        <img class="grayscale p-5" src="assets/img/card-referee.png" style="height: 80vh;" />
                    </div>

                </div>
            </div>
        </section>


        <section class="bg-light">
            <div class="container">

                <div class="row">

                    <div class="col-md-6 text-start">
                        <h1>Sobre Nós</h1>
                        <p class="text-justify">
                            Somos a plataforma de cadastro de torneios e inscrições <strong>J³</strong>, 
                            nosso objetivo é fazer com que seja fácil, rápido e menos burocrático possível 
                            para que esses eventos sejam realizados sem problemas.</p>

                        <p class="mt-5 text-justify">Plataforma desenvolvida por 3 alunos do ensino técnico de informática do 4° ano (M34) da UTFPR
                            no ano de 2022, esses alunos que dão as suas iniciais de seus primeiros nomes ao projeto se chamam:</p>

                        <p class="mt-2">João Augusto do Nascimento
                            <br>João Paulo Tovo
                            <br>Juliano Rubio Sangaleti
                        </p>
                    </div>

                    <div class="col-md-12 text-end">
                        <h1>TOP 10 Jogadores</h1>

                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Pontos</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    DAOPlayer daoPlayer = new DAOPlayer();
                                    List<Player> topTen = daoPlayer.getTopTen();
                                    for (Player topPlayer : topTen) {%>

                                <tr>
                                    <th scope="row"><%= topPlayer.getIdPlayer()%></th>
                                    <td><%= topPlayer.getNamePlayer()%></td>
                                    <td><%= topPlayer.getPointsPlayer()%></td>
                                </tr>

                                <%}%>
                            </tbody>
                        </table>
                    </div>

                </div>

            </div>
        </section>

        <jsp:include page="include/footer.jsp" />

        <script src="assets/js/jquery-3.6.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>    
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) { %>
        <script>alert("<%out.print(message);%>")</script>
        <% }%>
    </body>
</html>
