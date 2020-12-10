<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edycja przepisu</title>
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
                <h1>Edycja przepisu</h1>

                <form:form modelAttribute="recipe" action="/logged-user/recipe/edit" method="post">
                    <form:hidden path="id"/>
                    <div style="font-size: 18px; float: right; width: 480px; margin-top: 20px">
                        <p><b><form:label path="preparationTime">Czas przygotowania: </form:label></b><form:input cssStyle="width: 35px" path="preparationTime" /> min<form:errors path="preparationTime" cssClass="error"/></p>
                        <p><b><form:label path="numberOfServings">Ilość porcji: </form:label></b><form:input cssStyle="width: 35px" path="numberOfServings" /><form:errors path="numberOfServings" cssClass="error"/></p>
                    </div>

                    <div style="font-size: 18px; float: left; width: 750px; clear: right">
                        <p style="font-size: 18px"><b><form:label path="name">Nazwa przepisu: </form:label></b>
                            <br />
                            <form:input cssStyle="width: 469px; margin-top: 5px" path="name" /><form:errors path="name" cssClass="error"/></p>
                        <p style="font-size: 18px"><b><form:label cssStyle="text-align: start" path="description">Opis przepisu: </form:label></b>
                            <br />
                            <form:textarea cssStyle="margin-top: 5px" cols="70" rows="4" path="description" /><form:errors path="description" cssClass="error"/></p>
                    </div>

                    <div style="font-size: 18px; clear: left; float: left; width: 50%">
                        <p><b><form:label path="preparation">Przygotowanie: </form:label></b>
                            <br />
                            <form:textarea cssStyle="margin-top: 5px" cols="70" rows="10" path="preparation" /><form:errors path="preparation" cssClass="error"/></p>
                    </div>

                    <div style="font-size: 18px; float: right; width: 50%">
                        <table class="tableData" style="margin: 35px auto 15px auto" title="Składniki">
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

                        <a class="action" style="margin-bottom: 100px; margin-left: 0; border: 0; padding: 2px 5px" href="<c:url value="/logged-user/recipe/edit-set-of-ingredients/${recipe.id}/${setOfIngredients.id}"/>">Edytuj składniki</a>
                    </div>

                    <form:hidden path="setOfIngredientsWithQuantities" value="${setOfIngredients.id}"/>
                    <form:hidden path="created"/>
                    <div style="clear: right; margin-bottom: 50px">
                        <input class="submit" type="submit" value="Zapisz">
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
