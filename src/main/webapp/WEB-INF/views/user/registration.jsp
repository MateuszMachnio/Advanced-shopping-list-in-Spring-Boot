<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Formularz rejestracji użytkownika</title>
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
                <h1>Formularz rejestracyjny</h1>

                <div id="form">

                    <form:form modelAttribute="user">
<%--                        <form:input type="hidden" path="id" id="id"/>--%>

                        <table id="registration">
                            <tr>
                                <td><form:input type="text" path="firstName" placeholder="Imię"/></td>
                                <td><form:errors path="firstName" class="alert-danger"/></td>
                            </tr>

                            <tr>
                                <td><form:input type="text" path="lastName" placeholder="Nazwisko" /></td>
                                <td><form:errors path="lastName" class="alert-danger"/></td>
                            </tr>

                            <tr>
                                <td><form:input type="password" path="password" placeholder="Hasło" /></td>
                                <td><form:errors path="password" class="alert-danger"/></td>
                            </tr>

                            <tr>
                                <td><form:input type="text" path="email" placeholder="Email" /></td>
                                <td><form:errors path="email" class="alert-danger"/></td>
                            </tr>

                            <tr>
                                <td style="text-align: center"><input type="submit" value="Zarejestruj" /></td>
                                <td></td>
                            </tr>
                        </table>

                    </form:form>
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
