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

                <button type="button"><a href="<c:url value="/logged-user/plan/add"/>">dodaj nowy plan</a></button>

                <c:forEach items="${plans}" var="plan">
                    <table class="tableData">
                        <tr>
                            <th style="width: 30%">Nazwa planu</th>
                            <th style="width: 50%">Opis planu</th>
                            <th>Akcje</th>
                        </tr>
                        <tr>
                            <td>${plan.name}</td>
                            <td style="text-align: center">${plan.description}</td>
                            <td style="text-align: center">
                                <button type="button"><a href="/logged-user/plan/details/${plan.id}">szczegóły</a></button>
                                <button type="button"><a href="/logged-user/plan/delete/${plan.id}">usuń</a></button>
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
