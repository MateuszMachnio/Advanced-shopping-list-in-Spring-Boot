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

                <a class="return" style="margin-left: 1000px; margin-top: 10px" href="<c:url value="/logged-user/plan/details/${planId}"/>">Powrót</a>

                <p style="font-size: 18px">Teraz możesz dostosować listę zakupów. Jeśli masz jakieś produkty w domu, możesz usunąć produkt z listy lub edytować jego ilość.</p>
                <p style="font-size: 18px">Jeśli lista będzie gotowa wystarczy nacisnąć przycisk <em><b>"Gotowe!"</b></em> w celu pobrania listy zakupów.</p>

                    <table class="tableData">
                        <tr>
                            <th style="width: 40%">produkt</th>
                            <th>ilość</th>
                            <th style="width: 40%">akcje</th>
                        </tr>
                    <c:forEach items="${shoppingList.ingredientsWithQuantities}" var="ingredientWithQuantity">
                        <tr>
                            <td>${ingredientWithQuantity.ingredient.name}</td>
                            <td>${ingredientWithQuantity.quantity} g</td>
                            <td>
                                <a class="button" href="/logged-user/plan/shopping-list/edit/${planId}/${shoppingList.id}/${ingredientWithQuantity.id}">edytuj</a>
                                <a class="button-danger" href="/logged-user/plan/shopping-list/delete/${planId}/${shoppingList.id}/${ingredientWithQuantity.id}">usuń</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </table>

                <a class="shoppingList" style="margin: 0 0 50px 0" href="/logged-user/plan/shopping-list/export/${shoppingList.id}">Gotowe!</a>

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
