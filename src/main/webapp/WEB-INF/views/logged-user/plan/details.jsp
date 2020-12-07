<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szczegóły planu</title>
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
                <h1>Szczegóły planu</h1>

                <a class="shoppingList" href="<c:url value="/logged-user/plan/shopping-list/${plan.id}"/>">Stwórz listę zakupów dla tego planu</a>
                <a class="return" style="margin-left: 1000px; margin-top: 10px" href="<c:url value="/logged-user/plan/list"/>">Powrót</a>

                <p><b>Nazwa planu:</b> ${plan.name}</p>
                <p><b>Opis planu:</b> ${plan.description}</p>

                <c:forEach items="${planSchedule.keySet()}" var="day">
                    <table class="tableData">
                        <tr>
                            <th style="width: 20%">${day.name}</th>
                            <th style="width: 60%"></th>
                            <th><c:if test="${planSchedule.get(day).size() < 5}"><a class="day" href="<c:url value="/logged-user/plan/add-recipe/${plan.id}/${day.id}"/>">dodaj przepis do dnia</a></c:if></th>
                        </tr>
                        <c:forEach items="${planSchedule.get(day)}" var="schedule">
                            <tr>
                                <td>${schedule.mealName.name}</td>
                                <td style="text-align: center">${schedule.recipe.name}</td>
                                <td style="text-align: center">
                                    <a class="button" href="<c:url value="/logged-user/recipe/details/${schedule.recipe.id}?planId=${plan.id}"/>">szczegóły</a>
                                    <a class="button-danger" href="<c:url value="/logged-user/plan/remove-schedule/${plan.id}/${schedule.id}"/>">usuń</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:forEach>

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
