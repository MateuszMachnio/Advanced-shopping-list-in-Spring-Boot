<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Strona logowania</title>
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
                <h1>Logowanie</h1>

                <div id="form">
                    <c:url var="loginUrl" value="/user/login" />
                    <form action="${loginUrl}" method="post">

                        <c:if test="${param.error != null}">
                            <div class="alert-danger">Nieprawidłowy login lub hasło.</div>
                        </c:if>
                        <c:if test="${param.logout != null}">
                            <div class="alert-success">Zostałeś pomyślnie wylogowany.</div>
                        </c:if>

                        <div>
                            <input type="email" name="email" placeholder="Email" required>
                        </div>
                        <br />

                        <div>
                            <input type="password" name="password" placeholder="Hasło" required>
                        </div>
                        <br />

                        <div style="text-align: center">
                            <input type="submit" value="Zaloguj">
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />

                    </form>

                    <c:if test="${param.error != null}">
                        <div>Jeśli nie masz jeszcze konta, proszę <a href="<c:url value="/user/registration"/>">zarejestruj się</a>.</div>
                    </c:if>

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
