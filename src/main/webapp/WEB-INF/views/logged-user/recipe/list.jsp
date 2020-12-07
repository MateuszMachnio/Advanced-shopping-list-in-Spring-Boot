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

                <button type="button"><a href="<c:url value="/logged-user/recipe/create-set-of-ingredients"/>">dodaj nowy przepis</a></button>

                <c:forEach items="${recipeList}" var="recipe">
                <table class="tableData">
                    <tr>
                        <th style="width: 20%">Nazwa Przepisu</th>
                        <th style="width: 40%">Opis przepisu</th>
                        <th style="width: 18%">Czas przygotowania</th>
                        <th style="width: 22%">Akcje</th>
                    </tr>
                    <tr>
                        <td>${recipe.name}</td>
                        <td style="text-align: center">${recipe.description}</td>
                        <td style="text-align: center">${recipe.preparationTime} min</td>
                        <td style="text-align: center">
                            <button type="button"><a href="/logged-user/recipe/details/${recipe.id}">szczegóły</a></button>
                            <button type="button"><a href="/logged-user/recipe/edit/${recipe.id}">edytuj</a></button>
                            <button type="button"><a href="/logged-user/recipe/delete/${recipe.id}">usuń</a></button>
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
