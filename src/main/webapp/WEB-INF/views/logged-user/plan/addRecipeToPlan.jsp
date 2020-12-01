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

                <form:form modelAttribute="planSchedule" method="post" action="/logged-user/plan/add-recipe">
                    <table>
                        <tr>
                            <td><form:label path="dayOfTheWeek">Dzień tygodnia: </form:label></td>
                            <td>
                                <form:select path="dayOfTheWeek">
                                    <form:option value="0" label="--select day--"/>
                                    <form:options items="${daysOfTheWeek}" itemLabel="name" itemValue="id" />
                                </form:select>
                            </td>
                            <td><form:errors path="dayOfTheWeek" cssClass="error"/></td>
                        </tr>

                        <tr>
                            <td><form:label path="mealName">Nazwa posiłku: </form:label></td>
                            <td>
                                <form:select path="mealName">
                                    <form:option value="0" label="--select meal--"/>
                                    <form:options items="${mealNames}" itemLabel="name" itemValue="id" />
                                </form:select>
                            </td>
                            <td><form:errors path="mealName" cssClass="error"/></td>
                        </tr>

                        <tr>
                            <td><form:label path="recipe">Nazwa przepisu: </form:label></td>
                            <td>
                                <form:select path="recipe">
                                    <form:option value="0" label="--select recipe--"/>
                                    <form:options items="${recipes}" itemLabel="name" itemValue="id" />
                                </form:select>
                            </td>
                            <td><form:errors path="recipe" cssClass="error"/></td>
                        </tr>
                        <form:hidden path="plan" value="${planId}"/>
                    </table>
                    <br />

                    <input type="submit" value="Zapisz">
                    <%--                    <form:button><a href="<c:url value="/logged_user/dashboard"/>">Gotowe</a></form:button>--%>
                </form:form>

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
