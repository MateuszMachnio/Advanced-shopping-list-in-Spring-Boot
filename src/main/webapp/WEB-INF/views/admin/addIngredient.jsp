<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie nowego składniku</title>
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

            <div id="text" style="text-align: center">
                <h1>Dodawanie nowego składniku</h1>

                <form:form modelAttribute="ingredient">
                    <table>
                        <tr>
                            <td><form:label path="name">Nazwa składnika: </form:label></td>
                            <td><form:input path="name"/></td>
                            <td><form:errors path="name" cssClass="error"/></td>
                        </tr>
                    </table>
                    <br />

                    <input type="submit" value="Dodaj składnik">
                    <form:button><a href="<c:url value="/logged-user/dashboard"/>">Powrót</a></form:button>

                </form:form>

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

