<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Strona powitalna</title>
    <%@include file="../constantParts/head.jspf" %>
</head>
<body>
<div class="container">
    <%@include file="../constantParts/header.jspf"%>

    <div id="content">
        <div id="topOfContent">

        </div>
        <div id="middleOfContent">

            <div id="textNotLoggedIn">
                <h3>Zapraszam do skorzystania z najlepszej aplikacji stworzonej w celu zarządzania i organizacji planu żywieniowego!</h3>
                <div id="notLoggedUserContent">
                    Po zalogowaniu plikacja pozwala na:
                    <ul>
                        <li>stworzenie własnego przepisu;</li>
                        <li>korzystanie z przepisów innych użytkowników;</li>
                        <li>ułożenie własnych tygodniowych planów żywieniowych;</li>
                        <li>stworzenie w prosty sposób listy zakupów potrzebnej do zrealizowania danego planu żywieniowego.</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- koniec środka zawartości -->
        <div id="bottomOfContent">

        </div>
    </div>
    <!--  koniec divContent  -->
    <%@include file="../constantParts/footer.jspf"%>
</div>
</body>
</html>