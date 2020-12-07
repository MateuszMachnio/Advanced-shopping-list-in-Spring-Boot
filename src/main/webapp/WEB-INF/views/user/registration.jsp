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

                        <div class="row">
                            <div>
                                <div>
                                    <form:input type="text" path="firstName" id="firstName" placeholder="Imię"/>
                                    <div class="has-error">
                                        <form:errors path="firstName" class="help-inline"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div>
                                <div>
                                    <form:input type="text" path="lastName" id="lastName" placeholder="Nazwisko" />
                                    <div class="has-error">
                                        <form:errors path="lastName" class="help-inline"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div>
                                <div>
                                    <form:input type="password" path="password" id="password" placeholder="Hasło" />
                                    <div class="has-error">
                                        <form:errors path="password" class="help-inline"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div>
                                <div>
                                    <form:input type="text" path="email" id="email" placeholder="Email" />
                                    <div class="has-error">
                                        <form:errors path="email" class="help-inline"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row" style="text-align: center">
                            <div>
                                <c:choose>
                                    <c:when test="${edit}">
                                        <input type="submit" value="Update" /> or <a href="<c:url value='/list' />">Cancel</a>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="submit" value="Zarejestruj" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
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
