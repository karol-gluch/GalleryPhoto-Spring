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

        .main {
            max-width: 1000px;
            margin: auto;
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
<div class="main">
    <center>
        <h2> Centrum pomocy </h2>
        <div id="glowna" style="width:80%">
            </br></br><h3>Pomoc dotycząca strony głównej:</h3>
            </br>
            <img src="../../resources/images/1.png" style="width: 700px;"/></br>
            Po wybraniu przycisku „Napisz do mnie wiadomość!” jest otwierany formularz kontaktowy w wyskakującym
            oknie.</br>
            </br><img src="../../resources/images/2.png" style="width: 700px;"/></br>
            Na sliderze mamy dostępne dwie strzałki po obu stronach służące do przesuwania zdjęć. Możemy je kontrolować
            również za pomocą prostokątów na dole slidera. Zdjęcia są automatycznie zmieniane jeżeli użytkownik nic nie
            naciśnie.</br>
            </br></br>
            Na górze strony głównej użytkownik widzi menu główne. Kliknięcie opcji „Oferta”, „O mnie” i „Kontakt”
            przenosi użytkownika do danej sekcji na stronie. Kliknięcie opcji „Galeria zdjęć” przenosi nas do innej
            podstrony. Po prawej stronie mamy możliwość zalogowania się lub rejestracji. Po kliknięciu w dany przycisk
            otwiera się nam okno do logowania lub rejestracji. Po zalogowaniu w tym samym miejscu pojawia się nazwa
            użytkownika. Na górze strony z galerią mamy tylko dwie opcje. Jedna to powrót do strony głównej, a druga to
            przejście do galerii zdjęć. Opcją tą możemy odświeżać galerię.
        </div>

        <div id="galeria" style="width:80%">
            </br></br><h3>Pomoc dotycząca galerii zdjęć:</h3><br>
            <img src="../../resources/images/3.png" style="width: 700px;"/></br>
            Po wejściu do galerii, u góry jest dostępny panel z przyciskami. <br>
            - Wyświetl wszystkie - wyświetla wszystkie zdjęcia z galerii. <br>
            - Przyciski kategorii - uruchamiają zdjęcia w wybranej kategorii. <br>
            - Sortuj od najnowszych - sortowanie zdjęć od najnowszych. <br>
            - Sortuj od najstarszych - sortowanie zdjęć od najstarszych. <br>
            Po kliknięciu na dane zdjęcie jesteśmy przenoszeni do podstrony, na której mamy powiększony podgląd zdjęcia
            oraz informacje o nim takie jak tytuł, opis oraz data dodania. Poniżej znajduje się sekcja opinii
            użytkowników, którzy oceniają zdjęcia. <br>
            <img src="../../resources/images/4.png" style="width: 700px;"/></br>
            Pod zdjęciem są dostępne dwa przyciski; jeden do powrotu do galerii, a drugi do oceny zdjęcia. Po
            naciśnięciu go pokazuje się formularz, który wypełniamy, aby zostawić komentarz do zdjęcia. <br>
            <img src="../../resources/images/5.png" style="width: 700px;"/></br>
            Po kliknięciu na przycisk "Napisz opinię" użytkownik przenoszony jest na stronę galerii, a opinia zostaje
            dodana.


        </div>
    </center>


</div>

</body>
</html>