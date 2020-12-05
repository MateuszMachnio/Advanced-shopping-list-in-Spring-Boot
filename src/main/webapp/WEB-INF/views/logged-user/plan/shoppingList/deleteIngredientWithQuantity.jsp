<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuwanie elementu listy zakupów</title>
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
                <h1>Czy na pewno chcesz usunąć ten element z listy zakupów?</h1>

                <form:form modelAttribute="ingredientWithQuantity" action="/logged-user/plan/shopping-list/delete" method="post">
                    <form:hidden path="id"/>
                    <table>
                        <tr>
                            <td><form:label path="ingredient">Nazwa produktu: </form:label></td>
                            <td><input type="text" value="${ingredientWithQuantity.ingredient.name}" readonly /></td>
                            <form:hidden path="ingredient" />
                        </tr>
                        <tr>
                            <td><form:label path="quantity">Ilość: </form:label></td>
                            <td><form:input path="quantity" readonly="true" /></td>
                        </tr>
                    </table>
                    <br />

                    <input type="hidden" name="planId" value="${planId}">
                    <input type="hidden" name="shoppingListId" value="${shoppingListId}">

                    <input type="submit" value="Usuń">
                    <form:button><a href="<c:url value="/logged-user/plan/shopping-list/${planId}?shoppingListId=${shoppingListId}"/>">Powrót</a></form:button>

                </form:form>

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
