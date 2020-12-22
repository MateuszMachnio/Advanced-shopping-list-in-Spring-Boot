<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edycja ilości składniku</title>
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
                <h1>Edycja ilości składniku</h1>

                <form method="post" action="<c:url value="/logged-user/recipe/edit-set-of-ingredients"/>">
                    <input type="hidden" name="recipeId" value="${recipeId}" />
                    <input type="hidden" name="setOfIngredientsId" value="${setId}" />
                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                    <input type="submit" class="return" style="margin-left: 1000px; margin-top: 10px" value="Powrót">
                </form>

                <div id="form">
                <form:form modelAttribute="ingredientWithQuantity" action="/logged-user/recipe/editing-ingredient" method="post">
                    <form:hidden path="id"/>
                    <table id="addIngredient" style="margin-left: 310px">
                        <tr>
                            <td><form:label path="ingredient">Nazwa: </form:label></td>
                            <td><form:input cssStyle="width: 220px" path="ingredient" value="${ingredientName}" readonly="true" /></td>
                            <td><form:errors path="ingredient" cssClass="error"/></td>
                        </tr>
                        <tr>
                            <td><form:label path="quantity">Ilość: </form:label></td>
                            <td><form:input cssStyle="width: 40px" path="quantity" required="true" pattern="\d*" title="Proszę wpisać wartość liczbową." /> g</td>
                            <td><form:errors path="quantity" cssClass="error"/></td>
                        </tr>
                    </table>
                    <br />

                    <input type="hidden" name="setId" value="${setId}">
                    <input type="hidden" name="recipeId" value="${recipeId}">
                    <input type="submit" class="submit" value="Zapisz">
                </form:form>
                </div>

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
