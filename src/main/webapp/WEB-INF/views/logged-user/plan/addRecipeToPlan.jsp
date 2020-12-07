<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie przepisu do planu</title>
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
                <h1>Dodawanie przepisu do planu</h1>

                <div id="form">
                    <form:form modelAttribute="planSchedule" method="post" action="/logged-user/plan/add-recipe">
                        <table id="addRecipeToPlan">
                            <tr>
                                <td><form:label path="mealName">Nazwa posiłku: </form:label></td>
                                <td>
                                    <form:select cssStyle="width: 250px" path="mealName">
                                        <form:option value="0" label="--wybierz posiłek--"/>
                                        <form:options items="${mealNames}" itemLabel="name" itemValue="id" />
                                    </form:select>
                                </td>
                                <td><form:errors path="mealName" cssClass="error"/></td>
                            </tr>

                            <tr>
                                <td><form:label path="recipe">Nazwa przepisu: </form:label></td>
                                <td>
                                    <form:select cssStyle="width: 250px" path="recipe">
                                        <form:option value="0" label="--wybierz przepis--"/>
                                        <form:options items="${recipes}" itemLabel="name" itemValue="id" />
                                    </form:select>
                                </td>
                                <td><form:errors path="recipe" cssClass="error"/></td>
                            </tr>
                            <form:hidden path="dayOfTheWeek" value="${dayId}"/>
                            <form:hidden path="plan" value="${planId}"/>
                        </table>
                        <br />

                        <input class="submit" type="submit" value="Zapisz">
                        <a class="return" href="<c:url value="/logged-user/plan/details/${planId}"/>">Powrót</a>
                        <%--                    <form:button><a href="<c:url value="/logged_user/dashboard"/>">Gotowe</a></form:button>--%>
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
