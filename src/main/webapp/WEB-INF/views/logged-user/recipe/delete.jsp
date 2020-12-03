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

                <form:form modelAttribute="recipe" action="/logged-user/recipe/delete" method="post">
                    <form:hidden path="id"/>
                    <table>
                        <tr>
                            <td><form:label path="name">Nazwa przepisu: </form:label></td>
                            <td><form:input path="name" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="description">Opis przepisu: </form:label></td>
                            <td><form:textarea cols="20" rows="5" path="description" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="preparation">Przygotowanie: </form:label></td>
                            <td><form:textarea cols="20" rows="10" path="preparation" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="numberOfServings">Ilość porcji: </form:label></td>
                            <td><form:input path="numberOfServings" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="preparationTime">Czas przygotowania: </form:label></td>
                            <td><form:input path="preparationTime" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="setOfIngredientsWithQuantities">Składniki: </form:label></td>
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
                        </tr>
                    </table>
                    <br />

                    <input type="submit" value="Usuń przepis">
                    <%--                    <form:button><a href="<c:url value="/logged_user/dashboard"/>">Gotowe</a></form:button>--%>
                </form:form>
                <button type="button"><a href="<c:url value="/logged-user/recipe/list"/>">Anuluj</a></button>
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
