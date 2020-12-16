<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="sidebar">
    <ul>
        <li><a href="<c:url value="/logged-user/dashboard"/>">Start</a></li>
        <li><a href="<c:url value="/logged-user/plan/list"/>">Plany</a></li>
        <li><a href="<c:url value="/logged-user/recipe/list"/>">Przepisy</a></li>
        <li><a href="<c:url value="#"/>">Edytuj dane</a></li>
        <li><a href="<c:url value="/user/logout"/>">Wyloguj</a></li>
    </ul>
</div>
