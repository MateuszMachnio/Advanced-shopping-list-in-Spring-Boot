<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Strona powitalna zalogowanego użytkownika</title>
    <%@include file="../../constantParts/head.jspf" %>
</head>
<body>
<div class="container">
    <%@include file="../../constantParts/loggedHeader.jspf"%>

    <div id="content">
        <div id="topOfContent" style="margin-top: 10px">
        </div>

            <div id="middleOfContent">
                <%@include file="../../constantParts/loggedSidebar.jsp"%>

                <div id="text">
                    <h1>Strona Główna</h1>

                </div>
            </div>
            <!-- koniec środka zawartości -->
            <div id="bottomOfContent">
            </div>
    </div>
    <!--  koniec divContent  -->
    <%@include file="../../constantParts/footer.jspf"%>
</div>
</body>
</html>
