<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tworzenie listy zakupów</title>
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
                <h1>Tworzenie listy zakupów</h1>

                <button type="button"><a href="<c:url value="/logged-user/plan/details/${planId}"/>">anuluj</a></button>

                <p>Teraz możesz dostosować listę zakupów. Jeśli masz jakieś produkty w domu, usuń produkt z listy lub edytuj jego ilość.</p>
                <p>Jeśli lista będzie gotowa wystarczy nacisnąć przycisk "Gotowe!" w celu pobrania listy zakupów.</p>

                    <table>
                        <tr>
                            <th>produkt</th>
                            <th>ilość</th>
                            <th>Akcje</th>
                        </tr>
                    <c:forEach items="${shoppingList.ingredientsWithQuantities}" var="ingredientWithQuantity">
                        <tr>
                            <td>${ingredientWithQuantity.ingredient.name}</td>
                            <td>${ingredientWithQuantity.quantity} g</td>
                            <td>
                                <button type="button"><a href="/logged-user/plan/shopping-list/edit/${planId}/${shoppingList.id}/${ingredientWithQuantity.id}">edytuj</a></button>
                                <button type="button"><a href="/logged-user/plan/shopping-list/delete/${planId}/${shoppingList.id}/${ingredientWithQuantity.id}">usuń</a></button>
                            </td>
                        </tr>
                    </c:forEach>
                    </table>

                <button type="button"><a href="/logged-user/plan/shopping-list/export/${shoppingList.id}">Gotowe!</a></button>

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
