<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edycja składników przepisu</title>
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
                <h1>Edycja składników przepisu</h1>

                    <table>
                        <tr>
                            <th>Składnik</th>
                            <th>Ilość</th>
                            <th>Akcje</th>
                        </tr>
                        <c:forEach items="${setOfIngredients.ingredientsWithQuantities}" var="ingredientWithQuantity">
                            <tr>
                                <td>${ingredientWithQuantity.ingredient.name}</td>
                                <td>${ingredientWithQuantity.quantity} gram</td>
                                <td>
<%--                                    <form action="/logged-user/recipe/edit-ingredient" method="post">--%>
<%--                                        <input type="hidden" name="iwqId" value="${ingredientWithQuantity.id}">--%>
<%--                                        <input type="hidden" name="setId" value="${setOfIngredients.id}">--%>
<%--                                        <input type="hidden" name="recipeId" value="${recipeId}">--%>
<%--                                        <input type="submit" value="edytuj">--%>
<%--                                    </form>--%>
                                    <button type="button"><a href="/logged-user/recipe/edit-ingredient/${recipeId}/${setOfIngredients.id}/${ingredientWithQuantity.id}">edytuj</a></button>
<%--                                    <form action="/logged-user/recipe/delete-ingredient" method="post">--%>
<%--                                        <input type="hidden" name="iwqId" value="${ingredientWithQuantity.id}">--%>
<%--                                        <input type="hidden" name="setId" value="${setOfIngredients.id}">--%>
<%--                                        <input type="hidden" name="recipeId" value="${recipeId}">--%>
<%--                                        <input type="submit" value="usuń">--%>
<%--                                    </form>--%>
                                    <button type="button"><a href="/logged-user/recipe/delete-ingredient/${recipeId}/${setOfIngredients.id}/${ingredientWithQuantity.id}">usuń</a></button>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="3">
<%--                                <form action="/logged-user/recipe/add-ingredient" method="post">--%>
<%--                                    <input type="hidden" name="setId" value="${setOfIngredients.id}">--%>
<%--                                    <input type="hidden" name="recipeId" value="${recipeId}">--%>
<%--                                    <input type="submit" value="Dodaj nowy składnik">--%>
<%--                                </form>--%>
                                <button type="button"><a href="/logged-user/recipe/add-ingredient/${recipeId}/${setOfIngredients.id}">Dodaj nowy składnik</a></button>
                            </td>
                        </tr>
                    </table>
                    <br />
                <button type="button"><a href="/logged-user/recipe/edit/${recipeId}">Zatwierdź</a></button>

                    <%--                    <form:button><a href="<c:url value="/logged_user/dashboard"/>">Gotowe</a></form:button>--%>
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
