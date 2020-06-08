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
    <center>
        <c:if test="${photo eq true}">
            <div class="alert alert-success">Zdjęcie zostało dodane!</div>
        </c:if>
        <c:if test="${cate eq true}">
            <div class="alert alert-success">Kategoria została dodana!</div>
        </c:if>
        <c:if test="${success eq true}">
            <div class="alert alert-success">Zdjęcie zostało usuniete!</div>
        </c:if>
        <c:if test="${delUser eq true}">
            <div class="alert alert-success">Użytkownik został usunięty!</div>
        </c:if>
        <c:if test="${opinionD eq true}">
            <div class="alert alert-success">Opinia została usunięta!</div>
        </c:if>
        <form action="${contextPath}/addPhoto" method="get">
            <button type="submit" class="btn btn-dark" style="width: 300px; margin-top:5px">Dodaj zdjęcie</button>
        </form>
        <form action="${contextPath}/deletePhoto" method="get">
            <button type="submit" class="btn btn-dark" style="width: 300px; margin-top:5px">Usuń zdjęcie</button>
        </form>
        <form action="${contextPath}/addCategory" method="get">
            <button type="submit" class="btn btn-dark" style="width: 300px; margin-top:5px">Dodaj kategorie</button>
        </form>
        <form action="${contextPath}/users" method="get">
            <button type="submit" class="btn btn-dark" style="width: 300px; margin-top:5px">Zarządzaj użytkownikami
            </button>
        </form>
        <form action="${contextPath}/opinions" method="get">
            <button type="submit" class="btn btn-dark" style="width: 300px; margin-top:5px">Zarządzaj komentarzami
            </button>
        </form>
    </center>
</div>


</body>
</html>