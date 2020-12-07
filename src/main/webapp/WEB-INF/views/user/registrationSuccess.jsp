<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Potwierdzenie rejestracji</title>
    <%@include file="../../constantParts/head.jspf"%>
</head>
<body>
<div class="container">
    <%@include file="../../constantParts/header.jspf" %>

    <div id="content">
        <div id="topOfContent">

        </div>
        <div id="middleOfContent">

            <div id="textNotLoggedIn">
                <h1>Pomyślnie zarejestrowano</h1>

                    <div style="text-align: center">
                        <%@include file="authHeader.jspf" %>
                        <br />
                        Jeśli już teraz chcesz korzystać z aplikacji, proszę się <a href="<c:url value="/user/login" />">zalogować</a>.
                    </div>

            </div>
        </div>
        <!-- koniec środka zawartości -->
        <div id="bottomOfContent">

        </div>
    </div>
    <!--  koniec divContent  -->

    <%@include file="../../constantParts/footer.jspf" %>
</div>
</body>
</html>