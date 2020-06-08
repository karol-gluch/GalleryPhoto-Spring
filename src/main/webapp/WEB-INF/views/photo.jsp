<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Base64" %>

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
        $(document).ready(function () {
            $("#myModalLogin").modal('show');
        });
        </c:if>
    </script>

    <style>
        body {
            background-color: #f1f1f1;
            font-family: Arial;
        }

        .mainG {
            max-width: 1100px;
            margin: auto;
        }

        .photo-container {
            border: 1px solid #ccc;
            padding: 5px;
            width: 512px;
            margin: 10px;
            display: inline-block;
            text-align: left;
        }

        .photo-container:hover {
            background-color: lightgrey;
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
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/pomoc#galeria">Pomoc</a>
        </li>
        <c:if test="${isAdmin}">
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/adminPanel">Panel administratora</a>
            </li>
        </c:if>
    </ul>
    <ul class="nav navbar-nav ml-auto">
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <li class="nav-item">
                <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#myModalLogin">
                    Zaloguj się
                </button>
            </li>
            <li class="nav-item">
                <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#myModalRegister"
                        style="margin-left: 5px">
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
            <li class="nav-item">
                <button type="button" class="btn btn-outline-light" onclick="document.forms['logoutForm'].submit()">
                    Wyloguj się
                </button>
            </li>

        </c:if>
    </ul>
</nav>
</br></br></br></br>
<div class="mainG">

    <h4>Podgląd:</h4>
    <center>
        <c:forEach var="img" items="${photo}">
            <img style="width: 1100px" src="data:image/*;base64,${Base64.getEncoder().encodeToString(img.photo)}"/>
        </c:forEach>
        <br>
        <b>Tytuł: </b>${title}<br>
        <b>Opis: </b>${desc}<br>
        <b>Data dodania: </b>${data}<br><br>

        <a href="${contextPath}/gallery" method="get" class="btn btn-outline-secondary">Powrót do galerii</a>
        <button class="btn btn-outline-dark" data-toggle="modal" data-target="#writeOpinion">
            Oceń zdjęcie
        </button>
        <br><br>
    </center>
    <h4>Opinie:</h4>

    <c:forEach items="${opinion}" var="opinion">

        <h6><b>Użytkownik: </b>${opinion.user.username}</h6>
        <h6><b>Liczba gwiazdek: </b>${opinion.stars}/5</h6>
        <h6><b>Komentarz: </b>${opinion.comment}</h6>
        <br><br>

    </c:forEach>


</div>
<!-- Logowanie -->
<div class="modal fade" id="myModalLogin">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Logowanie</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <form method="POST" action="${contextPath}/login" class="form-signin">

                        <div class="form-group ${error != null ? 'has-error' : ''}">
                            <!--<span>${message}</span>
                            <span>${error}</span>
                            <input name="username" type="text" placeholder="Username"
                                   autofocus="true"/>
                            <input name="password" type="password" placeholder="Password"/>
                            <div class="form-group">-->
                            <label for="username">Nazwa użytkownika:</label>
                            <input type="username" class="form-control" id="username"
                                   placeholder="Podaj nazwę użytkownika"
                                   name="username">
                        </div>
                        <div class="form-group">
                            <label for="password">Hasło:</label>
                            <input type="password" class="form-control" id="password" placeholder="Podaj hasło"
                                   name="password">
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <button class="btn btn-lg btn-dark btn-block" type="submit">Zaloguj się!</button>

                    </form>
                    <br/>
                </c:if>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button>
            </div>

        </div>
    </div>
</div>


<div class="modal fade" id="writeOpinion">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Ocena zdjęcia</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form method="POST" action="${contextPath}/writeOpinion/${ide}" class="form-signin">
                    <center>
                        <input type="hidden" id="uname" name="uname" value="${pageContext.request.userPrincipal.name}"
                               required>
                        <select class="custom-select my-1 mr-sm-2" id="stars" name="stars" style="width: 50%" required>
                            <option value="">Liczba gwiazdek</option>
                            <option value="1">*</option>
                            <option value="2">**</option>
                            <option value="3">***</option>
                            <option value="4">****</option>
                            <option value="5">*****</option>
                        </select>
                        <br>
                        <textarea id="comment" name="comment" placeholder="Zostaw komentarz..."
                                  style="height:200px; width: 50%"
                                  required></textarea><br>
                        <button class="btn btn-lg btn-dark btn-block" type="submit">Napisz opinię</button>
                    </center>
                </form>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Zamknij</button>
            </div>

        </div>
    </div>
</div>
</body>
</html>