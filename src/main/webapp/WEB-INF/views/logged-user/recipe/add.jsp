<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie przepisu</title>
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
                <h1>Dodawanie przepisu</h1>

                <form:form modelAttribute="recipe" action="/logged-user/recipe/add" method="post">
                    <table>
                        <tr>
                            <td><form:label path="name">Nazwa przepisu: </form:label></td>
                            <td><form:input path="name"/></td>
                            <td><form:errors path="name" cssClass="error"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="description">Opis przepisu: </form:label></td>
                            <td><form:textarea cols="20" rows="5" path="description"/></td>
                            <td><form:errors path="description" cssClass="error"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="preparation">Przygotowanie: </form:label></td>
                            <td><form:textarea cols="20" rows="10" path="preparation"/></td>
                            <td><form:errors path="preparation" cssClass="error"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="numberOfServings">Ilość porcji: </form:label></td>
                            <td><form:input path="numberOfServings"/></td>
                            <td><form:errors path="numberOfServings" cssClass="error"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="preparationTime">Czas przygotowania: </form:label></td>
                            <td><form:input path="preparationTime"/> min</td>
                            <td><form:errors path="preparationTime" cssClass="error"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="setOfIngredientsWithQuantities">Składniki: </form:label></td>
                            <form:hidden path="setOfIngredientsWithQuantities" value="${setOfIngredients.id}"/>
                            <td>
                                <table>
                                    <c:forEach items="${setOfIngredients.ingredientsWithQuantities}" var="ingredientWithQuantity">
                                        <tr>
                                            <td>${ingredientWithQuantity.ingredient.name}</td>
                                            <td>${ingredientWithQuantity.quantity} gram</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="3"><form:errors path="setOfIngredientsWithQuantities"/></td>
                        </tr>
                    </table>
                    <br />

                    <input type="submit" value="Dodaj przepis">
                    <%--                    <form:button><a href="<c:url value="/logged_user/dashboard"/>">Gotowe</a></form:button>--%>
                </form:form>
                <br />

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
