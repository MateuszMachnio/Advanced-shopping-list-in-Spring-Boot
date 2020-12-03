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

                <p>Nazwa planu: ${plan.name}</p>
                <p>Opis planu: ${plan.description}</p>

                <button type="button"><a href="<c:url value="/logged-user/plan/list"/>">Powrót</a></button>

                <c:forEach items="${planSchedule.keySet()}" var="day">
                    <table>
                        <tr>
                            <th>${day.name}</th>
                            <th></th>
                            <th><c:if test="${planSchedule.get(day).size() < 5}"><button type="button"><a href="<c:url value="/logged-user/plan/add-recipe/${plan.id}/${day.id}"/>">Dodaj przepis</a></button></c:if></th>
                        </tr>
                        <c:forEach items="${planSchedule.get(day)}" var="schedule">
                            <tr>
                                <td>${schedule.mealName.name}</td>
                                <td>${schedule.recipe.name}</td>
                                <td>
                                    <button type="button"><a href="<c:url value="/logged-user/recipe/details/${schedule.recipe.id}?planId=${plan.id}"/>">szczegóły</a></button>
                                    <button type="button"><a href="<c:url value="/logged-user/plan/remove-schedule/${plan.id}/${schedule.id}"/>">usuń</a></button>
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
