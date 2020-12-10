<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie nowego składniku do zbioru składników</title>
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
                <h1>Dodawanie nowego składniku do zbioru składników</h1>

                <a class="return" style="margin-left: 1000px; margin-top: 10px" href="<c:url value="/logged-user/recipe/edit-set-of-ingredients/${recipeId}/${setId}"/>">Powrót</a>

                <div id="form">
                <form:form modelAttribute="ingredientWithQuantity" method="post" action="/logged-user/recipe/adding-ingredient">
                    <table id="addIngredient">
                        <tr>
                            <td><form:label path="ingredient">Składnik: </form:label></td>
                            <td>
                                <form:select cssStyle="width: 220px" path="ingredient">
                                    <form:option value="0" label="--wybierz składnik--"/>
                                    <form:options items="${ingredients}" itemLabel="name" itemValue="id" />
                                </form:select>
                            </td>
                            <td><form:errors path="ingredient" cssClass="error"/></td>
                        </tr>

                        <tr>
                            <td><form:label path="quantity">Ilość: </form:label></td>
                            <td><form:input cssStyle="width: 220px" path="quantity"/> g</td>
                            <td><form:errors path="quantity" cssClass="error"/></td>
                        </tr>
                    </table>
                    <br />

                    <input type="hidden" name="setId" value="${setId}">
                    <input type="hidden" name="recipeId" value="${recipeId}">

                    <input type="submit" class="submit" value="Dodaj składnik">
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
