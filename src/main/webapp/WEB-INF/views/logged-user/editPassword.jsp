<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edycja danych</title>
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

            <div id="text" style="text-align: center">
                <h1>Edycja hasła</h1>

                <div id="form">
                <form:form modelAttribute="user">
                    <form:hidden path="id"/>
                    <form:hidden path="firstName"/>
                    <form:hidden path="lastName"/>
                    <form:hidden path="email"/>
                    <form:hidden path="role"/>
                    <form:hidden path="created"/>
                    <form:hidden path="recipes"/>
                    <form:hidden path="plans"/>
                    <form:hidden path="shoppingList"/>

                    <table id="editPassword">
                        <tr>
                            <td><form:input type="password" path="password" cssStyle="width: 220px" placeholder="Wpisz nowe hasło" required="true" /></td>
                            <td><form:errors path="password" class="alert-danger"/></td>
                        </tr>
                    </table>
                    <br />

                    <input class="submit" type="submit" value="Edytuj">
                    <a class="return" href="<c:url value="/logged-user/dashboard"/>">Anuluj</a>

                </form:form>
                </div>

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
