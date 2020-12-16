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

                <div style="margin: 30px auto; padding: 20px 0">
                    <form method="post">
                        <label>
                            <h3 style="display: inline-block">Wyszukaj przepis:</h3>
                            <input type="text" list="recipeList" style="width: 350px" name="searchRecipes" placeholder="wpisz szukaną frazę">
                            <datalist id="recipeList">
                                <c:forEach items="${allOriginalRecipes}" var="recipe">
                                    <option value="${recipe.name}"></option>
                                </c:forEach>
                            </datalist>
                        </label>
                        <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                        <input type="submit" class="submit" style="margin-left: 20px" value="wyszukaj">
                    </form>
                </div>

                <c:if test="${recipeList.size() == 0}">
                    <p class="alert-danger" style="text-align: center; font-size: 18px">Niestety nie ma przepisu który w nazwie zawiera szukaną frazę.</p>
                </c:if>

                <c:forEach items="${recipeList}" var="recipe">
                    <table class="tableData">
                        <tr>
                            <th style="width: 40%">Nazwa Przepisu</th>
                            <th style="width: 20%">Opis przepisu</th>
                            <th>Czas przygotowania</th>
                            <th>Akcje</th>
                        </tr>
                        <tr>
                            <td>${recipe.name}</td>
                            <td>${recipe.description}</td>
                            <td>${recipe.preparationTime} min</td>
                            <td>
                                <a class="button" style="margin-bottom: 5px" href="/logged-user/recipe/details/${recipe.id}?all">szczegóły</a>
                                <form method="post" action="<c:url value="/logged-user/recipe/add-to-my-list"/>">
                                    <input type="hidden" name="recipeId" value="${recipe.id}" />
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                    <input type="submit" class="button" value="dodaj do moich przepisów">
                                </form>
<%--                                <a class="button" href="/logged-user/recipe/add-to-my-list/${recipe.id}">dodaj do moich przepisów</a>--%>
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
