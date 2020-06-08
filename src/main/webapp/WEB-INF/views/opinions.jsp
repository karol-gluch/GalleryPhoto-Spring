<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% request.setAttribute("isAdmin", request.isUserInRole("ADMIN")); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Portfolio fotografa z galeria zdjec</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            $(document).ready(function(){
                $("#myModalLogin").modal('show');
            });
        </c:if>
    </script>

    <style>
        body {
            background-color: #f1f1f1;
            font-family: Arial;
        }
        
        .main {
            max-width: 1000px;
            margin: auto;
        }

         .table tr {
             text-align: center;
         }

        .table td {
            text-align: center;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/index">Strona Główna</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/gallery">Galeria zdjęć</a>
            </li>
            <c:if test="${isAdmin}">
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/adminPanel">Panel administratora</a>
                </li>
            </c:if>
        </ul>
        <ul class="nav navbar-nav ml-auto">
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <li class = "nav-item">
                    <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#myModalLogin">
                        Zaloguj się
                    </button>
                </li>
                <li class = "nav-item">
                    <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#myModalRegister" style="margin-left: 5px">
                        Rejestracja
                    </button>
                </li>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                </form>
                <li class="nav-item">
                    <a class="nav-link" href="">Zalogowany: <b>${pageContext.request.userPrincipal.name}</b></a>
                </li>
                <li class = "nav-item">
                    <button type="button" class="btn btn-outline-light" onclick="document.forms['logoutForm'].submit()">Wyloguj się
                    </button>
                </li>

            </c:if>
        </ul>
    </nav>
</br></br></br></br>
    <div class="main">
        <h2>Lista komentarzy:</h2>
        <table class="table table-hover">
            <thead class="thead-light">
            <tr>
                <th>Id</th>
                <th>Komentarz</th>
                <th>Użytkownik</th>
                <th>Operacja</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${opinions}" var="opinions">
                <tr>
                    <td>${opinions.id}</td>
                    <td>${opinions.comment}</td>
                    <td>${opinions.user.username}</td>

                    <td>
                        <form action="${contextPath}/deleteOpinion/${opinions.getId()}" method="get">
                            <button type="submit" class="btn btn-outline-danger btn-sm">Usuń</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>