<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szczegóły przepisu</title>
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
                <h1>Szczegóły przepisu</h1>

                <c:if test="${planId == null}"><a class="return" style="margin-left: 1000px; margin-top: 10px" href="<c:url value="/logged-user/recipe/list"/>">Powrót</a></c:if>
                <c:if test="${planId != null}"><a class="return" style="margin-left: 1000px; margin-top: 10px" href="<c:url value="/logged-user/plan/details/${planId}"/>">Powrót</a></c:if>

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
                        <p style="font-size: 18px"><b>Przygotowanie:</b> ${recipe.preparation}</p>
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
