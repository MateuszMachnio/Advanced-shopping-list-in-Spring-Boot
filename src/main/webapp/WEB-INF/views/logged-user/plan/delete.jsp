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
                <h1>Czy na pewno chcesz usunąć ten plan?</h1>

                <p>Nazwa planu: ${plan.name}</p>
                <p>Opis planu: ${plan.description}</p>

                <c:forEach items="${planSchedule.keySet()}" var="day">
                    <table>
                        <tr>
                            <th>${day.name}</th>
                            <th></th>
                            <th></th>
                        </tr>
                        <c:forEach items="${planSchedule.get(day)}" var="schedule">
                            <tr>
                                <td>${schedule.mealName.name}</td>
                                <td>${schedule.recipe.name}</td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:forEach>

                <form:form modelAttribute="plan" action="/logged-user/plan/delete" method="post">
                    <form:hidden path="id"/>

                    <input type="submit" value="Usuń przepis">
                    <%--                    <form:button><a href="<c:url value="/logged_user/dashboard"/>">Gotowe</a></form:button>--%>
                </form:form>
                <button type="button"><a href="<c:url value="/logged-user/plan/list"/>">Anuluj</a></button>
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