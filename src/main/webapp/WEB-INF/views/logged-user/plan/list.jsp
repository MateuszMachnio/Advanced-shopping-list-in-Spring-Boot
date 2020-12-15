<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista planów</title>
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
                <h1>Lista planów</h1>

                <a class="action" href="<c:url value="/logged-user/plan/add"/>">dodaj nowy plan</a>

                <c:forEach items="${plans}" var="plan">
                    <table class="tableData">
                        <tr>
                            <th style="width: 30%">Nazwa planu</th>
                            <th style="width: 50%">Opis planu</th>
                            <th>Akcje</th>
                        </tr>
                        <tr>
                            <td>${plan.name}</td>
                            <td>${plan.description}</td>
                            <td>
                                <form action="<c:url value="/logged-user/plan/details"/>" method="post">
                                    <input type="hidden" name="planId" value="${plan.id}" />
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                    <input type="submit" class="button" value="szczegóły" />
                                </form>
                                <form action="<c:url value="/logged-user/plan/delete"/>" method="post">
                                    <input type="hidden" name="planId" value="${plan.id}" />
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                    <input type="submit" class="button-danger" value="usuń" />
                                </form>
<%--                                <a class="button" href="/logged-user/plan/details/${plan.id}">szczegóły</a>--%>
<%--                                <a class="button-danger" href="/logged-user/plan/delete/${plan.id}">usuń</a>--%>
                            </td>
                        </tr>
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
