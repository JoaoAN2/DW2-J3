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

        <jsp:include page="include/footer.jsp" />

        <script src="assets/js/jquery-3.6.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>    
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) { %>
        <script>alert("<%out.print(message);%>")</script>
        <% }%>
    </body>
</html>
