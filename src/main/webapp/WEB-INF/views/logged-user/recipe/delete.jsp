<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuwanie przepisu</title>
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
                <h1>Czy na pewno chcesz usunąć ten przepis?</h1>

                <div style="font-size: 18px; float: right; width: 480px; margin-top: 20px">
                    <p><b>Czas przygotowania:</b> ${recipe.preparationTime} min</p>
                    <p><b>Ilość porcji:</b> ${recipe.numberOfServings}</p>
                </div>

                <div style="font-size: 18px; float: left; width: 750px; clear: right">
                    <p style="font-size: 18px"><b>Nazwa przepisu:</b> ${recipe.name}</p>
                    <p style="font-size: 18px"><b>Opis przepisu:</b> ${recipe.description}</p>
                </div>

                <div style="font-size: 18px; clear: left">

                    <div style="float: left; width: 50%">
                        <p><b>Przygotowanie:</b> ${recipe.preparation}</p>
                    </div>

                    <div style="float: right; width: 50%">
                        <table class="tableData" title="Składniki">
                            <tr>
                                <th style="width: 50%">składnik</th>
                                <th>ilość</th>
                            </tr>
                            <c:forEach items="${setOfIngredients.ingredientsWithQuantities}" var="ingredientWithQuantity">
                                <tr>
                                    <td>${ingredientWithQuantity.ingredient.name}</td>
                                    <td>${ingredientWithQuantity.quantity} g</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>


                <form:form modelAttribute="recipe" action="/logged-user/recipe/delete" method="post">
                    <form:hidden path="id"/>
                    <form:hidden path="setOfIngredientsWithQuantities"/>

                    <div style="clear: right; margin-bottom: 50px; padding-top: 50px">
                        <input class="delete" type="submit" value="Usuń">
                        <a class="return" href="<c:url value="/logged-user/recipe/mine/list"/>">Anuluj</a>
                    </div>

                </form:form>


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
