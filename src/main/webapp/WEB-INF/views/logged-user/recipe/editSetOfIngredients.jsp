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

                <a class="action" href="/logged-user/recipe/add-ingredient/${recipeId}/${setOfIngredients.id}">dodaj nowy składnik</a>

                <table class="tableData" style="margin-bottom: 20px">
                        <tr>
                            <th style="width: 35%">Składnik</th>
                            <th>Ilość</th>
                            <th style="width: 45%">Akcje</th>
                        </tr>
                        <c:forEach items="${setOfIngredients.ingredientsWithQuantities}" var="ingredientWithQuantity">
                            <tr>
                                <td>${ingredientWithQuantity.ingredient.name}</td>
                                <td>${ingredientWithQuantity.quantity} gram</td>
                                <td>
                                    <a class="button" href="/logged-user/recipe/edit-ingredient/${recipeId}/${setOfIngredients.id}/${ingredientWithQuantity.id}">edytuj</a>
                                    <a class="button-danger" href="/logged-user/recipe/delete-ingredient/${recipeId}/${setOfIngredients.id}/${ingredientWithQuantity.id}">usuń</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                <a class="action" style="margin-left: 0; margin-bottom: 70px" href="/logged-user/recipe/edit/${recipeId}">Zatwierdź</a>

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
