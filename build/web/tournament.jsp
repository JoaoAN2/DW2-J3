<%@page import="DAOs.DAOTournament"%>
<%@page import="DAOs.DAOTournaments"%>
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

        <img src="assets/img/irt.jpg" alt="" class="w-100" style="height: 70vh">

        <section>
            <div class="container">
                <div class="row mt-5">
                    <div class="col-md-6 p-5">
                        <h2 class="text-center mb-4">Torneio teste</h2>

                        <p style="font-size: 1.2rem" class="text-justify">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consectetur laborum, 
                            voluptates sequi labore, magnam dolores officia, blanditiis ut quia velit commodi doloremque architecto omnis temporibus deleniti corporis enim id eligendi.
                            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Consectetur laborum, 
                            voluptates sequi labore, magnam dolores officia, blanditiis ut quia velit commodi doloremque architecto omnis temporibus deleniti corporis enim id eligendi.
                        </p>
                    </div>
                    <div class="col-md-6 p-5">
                        <h2 class="text-center mb-4">Informações sobre o torneio</h2>

                        <p style="font-size: 1.2rem">Local: local teste.</p>
                        <p style="font-size: 1.2rem">Data de início: data teste.</p>
                        <p style="font-size: 1.2rem">Data final prevista: data teste.</p>
                        <p style="font-size: 1.2rem">Organizador do evento: organizador teste.</p>
                        <p style="font-size: 1.2rem">Árbitros: Arbitros testes.</p>
                        <p style="font-size: 1.2rem">Rodadas previstas: 9 rodadas.</p>
                    </div>
                </div>

                <button class="btn btn-primary mt-3 d-block mx-auto">Inscrever</button>

            </div>
        </section>

        <section class="bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 text-center">
                        <h1 class="mb-4">Jogadores Inscritos</h1>

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
                                    DAOTournaments daoTournaments = new DAOTournaments();
                                    List<Player> playersInTournament = daoTournaments.getPlayersInTournament(new DAOTournament().obter(1));
                                    for (Player topPlayer : playersInTournament) {%>

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

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) { %>
        <script>alert("<%out.print(message);%>")</script>
        <% }%>
    </body>
</html>
