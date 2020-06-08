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
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
        $(document).ready(function () {
            $("#myModalLogin").modal('show');
        });
        </c:if>
    </script>

    <style>
        #slajder {
            width: 100%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/index#oferta">Oferta</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/index#omnie">O mnie</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/index#kontakt">Kontakt</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/gallery">Galeria zdjęć</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${contextPath}/pomoc#glowna">Pomoc</a>
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

<center>
    <div id="slajder">
        <div id="demo" class="carousel slide" data-ride="carousel" style="width:100%">
            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../../resources/images/1.jpg" alt="Los Angeles" style="width:100%">
                </div>
                <div class="carousel-item">
                    <img src="../../resources/images/2.jpg" alt="Chicago" style="width:100%">
                </div>
                <div class="carousel-item">
                    <img src="../../resources/images/3.jpg" alt="New York" style="width:100%">
                </div>
            </div>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>
</center>
<c:if test="${mail eq true}">
    <div class="alert alert-success">Wiadomość została wysłana!</div>
</c:if>
<br><br>
<div id="oferta">
    <div class="container">
        <center>
            <h1>Oferta:</h1>
            <p>Oferuje fotografię na wydarzeniach zawartych poniżej. <br>Jeżeli interesuję Cię fotografia innego
                wydarzenia niż podane, skontaktuj się ze mną.</p>
        </center>
        <br><br>
        <div class="row">
            <div class="col-sm-4">
                <center>
                    <i class="fas fa-glass-cheers" style="font-size: 80px; color: darkgray"></i><br><br>
                    <h3>Śluby oraz wesela</h3>
                    <p>Oferuje fotografowanie ślubów i wesel.</p>
                </center>
            </div>
            <div class="col-sm-4">
                <center>
                    <i class="fas fa-baby" style="font-size: 80px; color: darkgray"></i><br><br>
                    <h3>Chrzty oraz przyjęcia</h3>
                    <p>Oferuje fotografowanie chrztów, komunii, bierzmowań oraz podobnych uroczystości.</p>
                </center>
            </div>
            <div class="col-sm-4">
                <center>
                    <i class="fas fa-handshake" style="font-size: 80px; color: darkgray"></i><br><br>
                    <h3>Biznes</h3>
                    <p>Oferuje fotografowanie różnorodnych elementów związanych z biznesem. </p>
                </center>
            </div>
        </div>
    </div>
</div>
<br><br>
<div id="omnie">
    <div class="jumbotron text-center">
        <h1>O mnie</h1>
        <br>
        <p style="margin-left: 15%; margin-right: 15%; text-align: justify; font-size: 19px">Magia fotografii
            Dzięki fotografii możemy uchwycić wyjątkowe chwile, piękne widoki i emocje. W tym jednym krótkim momencie
            świat staje w miejscu, po czym na zawsze zostanie zapamiętany poprzez naciśnięcie spustu migawki.
            Ale czym jest sama fotografia? Umiejętnością obserwacji, sposobem na kształtowanie percepcji odbiorców.
            Podniesiona do rangi sztuki, podziwiana i szanowana. Gdzie tkwi jej sekret, dlaczego jest tak ważna i
            ceniona?
            Bez przesady możemy powiedzieć, że fotografia w dzisiejszym świecie jest produktem masowym. Każdy dzień do
            kolejne miliony zdjęć, które trafiają do sieci lub zostają w aparatach, lub komputerach.
            Nie zawsze tak było. Jak wyglądały początki fotografii? Bardzo niepozornie, choć gdyby nie te pierwsze,
            przełomowe zdjęcia, nie bylibyśmy na tym etapie, na jakim jesteśmy teraz.
            Pierwsza trwała fotografia została wykonana w 1826 roku, a jej produkcja przy sprzyjających warunkach
            pogodowych wymagała co najmniej ośmiu godzin ekspozycji.Jak się to ma do tego, do czego jesteśmy
            przyzwyczajeni! Naciskamy przycisk i zdjęcie gotowe. Dawniej fotograf był niczym czarodziej, który w
            niewiadomy sposób umieszczał na papierze wizerunek przedmiotów i ludzi. Teraz amatorskie zdjęcie może zrobić
            każdy.
        </p>
    </div>
</div>
<br>
<div id="kontakt">
    <div class="container mt-3">
        <center>
            <h1>Kontakt</h1>
            <br>
            <p>Jeżeli jesteś zainteresowany moją ofertą to zapraszam do kontaktu ze mną.<br>Na wszystkie wiadomości
                odpowiadam w ciągu maksymalnie 24 godzin.<br>Jeżeli nie masz ode mnie odpowiedzi, proszę sprawdź folder
                ze spamem lub zadzwoń do mnie.<br></p>
            <i class="far fa-envelope"></i> <b>Mail:</b> przykladowy_mail@mail.com<br>
            <i class="fas fa-mobile-alt"></i> <b>Telefon komórkowy:</b> 123-456-789<br>
            <i class="fas fa-phone-alt"></i> <b>Telefon stacjonarny:</b> 987-654-321<br>
            <i class="fas fa-map-marker-alt"></i> <b>Adres:</b> ul. Osowa 153, Kielce<br><br>
            <p>Pracuję na terenie całego kraju oraz za granicą.</p>
            <!-- Button to Open the Modal -->
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#myModal">
                    Napisz do mnie wiadomość!
                </button>
            </c:if>
            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Napisz wiadomość</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <form method="post" action="sendMail" class="center">
                                <input type="text" class="form-control mb-2 mr-sm-2" id="email" name="email"
                                       placeholder="Twoj email.." required>
                                <input type="text" class="form-control mb-2 mr-sm-2" id="temat" name="temat"
                                       placeholder="Twoj temat.." required>
                                <textarea id="tresc" name="tresc" placeholder="Tresc.."
                                          style="width: 100%; height:200px" required></textarea><br>
                                <button type="submit" class="btn btn-dark">Wyślij wiadomość</button>
                            </form>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Zamknij</button>
                        </div>
                    </div>
                </div>
            </div>
        </center>
    </div>
</div>
<!-- Footer -->
<footer class="page-footer font-small special-color-dark pt-4">
    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2020 Copyright:
    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->


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


<!-- Rejestracja -->
<div class="modal fade" id="myModalRegister">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Rejestracja</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">

                <form action="${contextPath}/registration" method="POST">
                    <div class="form-group">
                        <label for="username">Nazwa użytkownika:</label>
                        <input type="text" minlength="6" class="form-control" id="RegisterUsername"
                               placeholder="Podaj nazwe uzytkownika"
                               name="username" required>
                        <div class="valid-feedback">Uzupełniono</div>
                        <div class="invalid-feedback">Proszę wypełnić pole</div>
                    </div>
                    <div class="form-group">
                        <label for="password">Haslo:</label>
                        <input type="password" minlength="8" class="form-control" id="registerPassword"
                               placeholder="Podaj haslo"
                               name="password" required>
                        <div class="valid-feedback">Uzupełniono</div>
                        <div class="invalid-feedback">Proszę wypełnić pole</div>
                    </div>
                    <div class="form-group">
                        <label for="passwordConfirm">Tresc:</label>
                        <input type="password" minlength="8" class="form-control" id="passwordConfirm"
                               placeholder="Podaj ponownie haslo" name="passwordConfirm" required>
                        <div class="valid-feedback">Uzupełniono</div>
                        <div class="invalid-feedback">Proszę wypełnić pole</div>
                    </div>
                    <button type="submit" class="btn btn-lg btn-dark btn-block">Zarejestruj</button>
                </form>
                <br/>
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