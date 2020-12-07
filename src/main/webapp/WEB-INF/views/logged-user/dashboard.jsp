<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Strona powitalna zalogowanego użytkownika</title>
    <%@include file="../../constantParts/head.jspf" %>
</head>
<body>
<div class="container">
    <%@include file="../../constantParts/loggedHeader.jspf"%>

    <div id="content">
        <div id="topOfContent" style="margin-top: 10px">
        </div>

            <div id="middleOfContent">
                <%@include file="../../constantParts/loggedSidebar.jsp"%>

                <div id="text">
                    <h3>Witam w najlepszej aplikacji stworzonej w celu zarządzania i organizacji planu żywieniowego!</h3>
                    <p>Aplikacja pozwala na:
                        <ul>
                            <li>stworzenie własnego przepisu;</li>
                            <li>korzystanie z przepisów innych użytkowników;</li>
                            <li>ułożenie własnych tygodniowych planów żywieniowych;</li>
                            <li>stworzenie w prosty sposób listy zakupów potrzebnej do zrealizowania danego planu żywieniowego.</li>
                        </ul>
                    </p>
                    <p>*Jeśli na liście produktów (przy tworzeniu własnego przepisu) nie znajdziesz szukanego produktu, proszę zgłoś problem wysyłając do mnie maila.</p>
                </div>
            </div>
            <!-- koniec środka zawartości -->
            <div id="bottomOfContent">
            </div>
    </div>
    <!--  koniec divContent  -->
    <%@include file="../../constantParts/footer.jspf"%>
</div>
</body>
</html>
