<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie planu</title>
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
                <h1>Dodawanie planu</h1>

                <div id="form">
                    <form:form modelAttribute="plan">
                        <table id="plan">
                            <tr>
                                <td><form:label path="name">Nazwa planu: </form:label></td>
                                <td><form:input path="name" cssStyle="width: 380px"/></td>
                                <td><form:errors path="name" cssClass="error"/></td>
                            </tr>

                            <tr>
                                <td><form:label path="description">Opis planu: </form:label></td>
                                <td><form:textarea cols="50" rows="5" path="description" /></td>
                                <td><form:errors path="description" cssClass="error"/></td>
                            </tr>
                        </table>
                        <br />

                        <input type="submit" class="submit" value="Dodaj plan">
                        <a class="return" href="<c:url value="/logged-user/plan/list"/>">Powrót</a>

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
