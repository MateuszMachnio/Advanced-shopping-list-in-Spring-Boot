<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Formularz rejestracji użytkownika</title>
    <%@include file="../../constantParts/head.jspf"%>
</head>
<body>
<div class="container">
    <%@include file="../../constantParts/header.jspf" %>

    <div id="content">
        <div id="topOfContent">

        </div>
        <div id="middleOfContent">

            <div id="text">
                <h1>Formularz rejestracyjny</h1>

                <div id="form">

                    <form:form modelAttribute="user">
<%--                        <form:input type="hidden" path="id" id="id"/>--%>

                        <div class="row">
                            <div>
                                <label for="firstName">First Name</label>
                                <div>
                                    <form:input type="text" path="firstName" id="firstName" />
                                    <div class="has-error">
                                        <form:errors path="firstName" class="help-inline"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div>
                                <label for="lastName">Last Name</label>
                                <div>
                                    <form:input type="text" path="lastName" id="lastName" />
                                    <div class="has-error">
                                        <form:errors path="lastName" class="help-inline"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--        <div class="row">--%>
                        <%--            <div class="form-group col-md-12">--%>
                        <%--                <label class="col-md-3 control-lable" for="ssoId">SSO ID</label>--%>
                        <%--                <div class="col-md-7">--%>
                        <%--                    <c:choose>--%>
                        <%--                        <c:when test="${edit}">--%>
                        <%--                            <form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" disabled="true"/>--%>
                        <%--                        </c:when>--%>
                        <%--                        <c:otherwise>--%>
                        <%--                            <form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" />--%>
                        <%--                            <div class="has-error">--%>
                        <%--                                <form:errors path="ssoId" class="help-inline"/>--%>
                        <%--                            </div>--%>
                        <%--                        </c:otherwise>--%>
                        <%--                    </c:choose>--%>
                        <%--                </div>--%>
                        <%--            </div>--%>
                        <%--        </div>--%>

                        <div class="row">
                            <div>
                                <label for="password">Password</label>
                                <div>
                                    <form:input type="password" path="password" id="password" />
                                    <div class="has-error">
                                        <form:errors path="password" class="help-inline"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div>
                                <label for="email">Email</label>
                                <div>
                                    <form:input type="text" path="email" id="email" />
                                    <div class="has-error">
                                        <form:errors path="email" class="help-inline"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <%--        <div class="row">--%>
                        <%--            <div class="form-group col-md-12">--%>
                        <%--                <label class="col-md-3 control-lable" for="userProfiles">Roles</label>--%>
                        <%--                <div class="col-md-7">--%>
                        <%--                    <form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-sm" />--%>
                        <%--                    <div class="has-error">--%>
                        <%--                        <form:errors path="userProfiles" class="help-inline"/>--%>
                        <%--                    </div>--%>
                        <%--                </div>--%>
                        <%--            </div>--%>
                        <%--        </div>--%>

                        <div class="row">
                            <div>
                                <c:choose>
                                    <c:when test="${edit}">
                                        <input type="submit" value="Update" /> or <a href="<c:url value='/list' />">Cancel</a>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="submit" value="Register" /> or <a href="<c:url value='/list' />">Cancel</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </form:form>
                </div>

            </div>
        </div>
        <!-- koniec środka zawartości -->
        <div id="bottomOfContent">

        </div>
    </div>
    <!--  koniec divContent  -->

    <%@include file="../../constantParts/footer.jspf" %>
</div>
</body>
</html>
