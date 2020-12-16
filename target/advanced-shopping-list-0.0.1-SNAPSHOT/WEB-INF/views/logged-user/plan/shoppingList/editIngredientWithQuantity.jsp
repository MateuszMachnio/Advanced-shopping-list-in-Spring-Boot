<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edycja elementu listy zakupów</title>
    <%@include file="../../../../constantParts/head.jspf" %>
</head>
<body>
<div class="container">
    <%@include file="../../../../constantParts/loggedHeader.jspf"%>

    <div id="content">
        <div id="topOfContent" style="margin-top: 10px">
        </div>

        <div id="middleOfContent">
            <%@include file="../../../../constantParts/loggedSidebar.jsp"%>

            <div id="text" style="text-align: center">
                <h1>Edycja elementu listy zakupów</h1>

                <div id="form">
                    <form:form modelAttribute="ingredientWithQuantity" action="/logged-user/plan/shopping-list/editing" method="post">
                        <form:hidden path="id"/>
                        <table id="editIngredientWQ">
                            <tr>
                                <td><form:label path="ingredient">Nazwa produktu: </form:label></td>
<%--                                <input type="text" style="width: 200px" value="${ingredientWithQuantity.ingredient.name}" readonly />--%>
                                <td><form:input cssStyle="width: 200px" path="ingredient" value="${ingredientWithQuantity.ingredient.name}" readonly="true" /></td>
                                <td><form:errors path="ingredient" cssClass="error"/></td>
                            </tr>
                            <tr>
                                <td><form:label path="quantity">Ilość: </form:label></td>
                                <td><form:input cssStyle="width: 200px" path="quantity" pattern="\d*" title="Proszę wpisać wartość liczbową." /> g</td>
                                <td><form:errors path="quantity" cssClass="error"/></td>
                            </tr>
                        </table>
                        <br />

                        <input type="hidden" name="planId" value="${planId}">
                        <input type="hidden" name="shoppingListId" value="${shoppingListId}">

                        <input class="submit" type="submit" value="Edytuj">
                        <a class="return" href="<c:url value="/logged-user/plan/shopping-list/${planId}?shoppingListId=${shoppingListId}"/>">Powrót</a>

                    </form:form>
                </div>

            </div>
        </div>
        <!-- koniec środka zawartości -->
        <div id="bottomOfContent">
        </div>
    </div>
    <!--  koniec divContent  -->
    <%@include file="../../../../constantParts/footer.jspf"%>
</div>
</body>
</html>
