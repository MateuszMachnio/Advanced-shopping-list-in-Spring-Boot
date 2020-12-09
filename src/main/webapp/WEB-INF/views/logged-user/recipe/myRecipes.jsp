<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista przepisów</title>
    <%@include file="../../../constantParts/head.jspf" %>
</head>
<body>
<div class="container">
    <%@include file="../../../constantParts/loggedHeader.jspf"%>

    <div id="content">
        <div id="topOfContent" style="margin-top: 10px">
        </div>

        <div id="middleOfContent">
            <%@include file="../../../constantParts/loggedSidebar.jsp"%>

            <div id="text" style="text-align: center">
                <h1>Lista przepisów</h1>

                <a class="action" href="<c:url value="/logged-user/recipe/create-set-of-ingredients"/>">dodaj nowy przepis</a>

                <c:forEach items="${recipeList}" var="recipe">
                <table class="tableData">
                    <tr>
                        <th style="width: 20%">Nazwa Przepisu</th>
                        <th style="width: 40%">Opis przepisu</th>
                        <th>Czas przygotowania</th>
                        <th>Akcje</th>
                    </tr>
                    <tr>
                        <td style="text-align: left; padding-left: 20px">${recipe.name}</td>
                        <td>${recipe.description}</td>
                        <td>${recipe.preparationTime} min</td>
                        <td>
                            <a class="button" href="/logged-user/recipe/details/${recipe.id}">szczegóły</a>
                            <a class="button" href="/logged-user/recipe/edit/${recipe.id}">edytuj</a>
                            <a class="button-danger" href="/logged-user/recipe/delete/${recipe.id}">usuń</a>
                        </td>
                    </tr>
                </table>
                </c:forEach>

            </div>
        </div>
        <!-- koniec środka zawartości -->
        <div id="bottomOfContent">
        </div>
    </div>
    <!--  koniec divContent  -->
    <%@include file="../../../constantParts/footer.jspf"%>
</div>
</body>
</html>
