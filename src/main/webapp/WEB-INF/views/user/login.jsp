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
                            <div class="alert alert-danger">
                                <p>Invalid username or password.</p>
                            </div>
                        </c:if>
                        <c:if test="${param.logout != null}">
                            <div class="alert alert-success">
                                <p>You have been logged out successfully.</p>
                            </div>
                        </c:if>
                        <div>
                            <label for="username"><i></i></label>
                            <input type="text" id="username" name="email" placeholder="Email" required>
                        </div>
                        <br />
                        <div>
                            <label for="password"><i></i></label>
                            <input type="password" id="password" name="password" placeholder="Hasło" required>
                        </div>
                        <br />
                        <div>
                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                        </div>
                        <div style="text-align: center">
                            <input type="submit" value="Zaloguj">
                        </div>
                    </form>
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
