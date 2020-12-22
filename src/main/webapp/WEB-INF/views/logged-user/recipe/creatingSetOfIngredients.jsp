<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie przepisu</title>
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
                <h1>Tworzenie nowego przepisu</h1>

                <c:if test="${setWithIngredients == null}">
                    <a class="return" style="margin-left: 1000px; margin-top: 10px" href="<c:url value="/logged-user/recipe/mine/list"/>">Powrót</a>
                </c:if>

                <c:if test="${setWithIngredients != null}">
                    <a class="return" style="margin-left: 1000px; margin-top: 10px" href="<c:url value="/logged-user/recipe/mine/list?setId=${setWithIngredients.id}"/>">Powrót</a>
                </c:if>

                <c:if test="${setWithIngredients == null}">
                    <p style="font-size: 18px; text-align: center">Najpierw proszę stworzyć listę składników dla nowego przepisu.</p>
                </c:if>

                <c:if test="${setWithIngredients != null}">
                    <table class="tableData" style="width: 40%; float: left; margin-bottom: 70px">
                        <tr>
                            <th style="width: 40%">składnik</th>
                            <th style="width: 20%">ilość</th>
                        </tr>

                        <c:forEach items="${setWithIngredients.ingredientsWithQuantities}" var="ingredientWithQuantity">
                            <tr>
                                <td>${ingredientWithQuantity.ingredient.name}</td>
                                <td>${ingredientWithQuantity.quantity} gram</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

                <c:if test="${setWithIngredients == null}">
                    <div id="form" style="width: 60%; padding-top: 50px; padding-bottom: 70px">
                </c:if>
                <c:if test="${setWithIngredients != null}">
                    <div id="form" style="width: 60%; float: left; padding-top: 50px; padding-bottom: 70px">
                </c:if>
                <form:form modelAttribute="ingredientsWithQuantity">
                    <table id="createSet">

                        <tr>
                            <td><form:label path="ingredient">Składnik: </form:label></td>
                            <td>
                                <form:input path="ingredient" cssStyle="width: 262px" list="ingredients" placeholder="zacznij pisać lub wybierz składnik z listy" required="true" />
                                <datalist id="ingredients">
                                    <c:forEach items="${ingredients}" var="ingredient">
                                        <option value="${ingredient.name}"></option>
                                    </c:forEach>
                                </datalist>
                            </td>
                            <td><form:errors path="ingredient" cssClass="error"/></td>
                        </tr>

                        <tr>
                            <td><form:label path="quantity">Ilość: </form:label></td>
                            <td style="width: 220px"><form:input cssStyle="width: 40px" path="quantity" required="true" pattern="\d*" title="Proszę wpisać wartość liczbową."/> g</td>
                            <td><form:errors path="quantity" cssClass="error"/></td>
                        </tr>
                    </table>
                    <br />

                    <c:if test="${setWithIngredients != null}">
                        <input type="hidden" name="setId" value="${setWithIngredients.id}">
                    </c:if>
                    <c:if test="${setWithIngredients == null}">
                        <input type="hidden" name="setId" value="0">
                    </c:if>

                    <input type="submit" class="submit" value="Dodaj składnik">

                </form:form>
                </div>

                <c:if test="${setWithIngredients != null}">
                    <div style="clear: both">
                        <form method="post" action="<c:url value="/logged-user/recipe/add"/>">
                            <input type="hidden" name="setId" value="${setWithIngredients.id}" />
                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                            <input type="submit" class="action" value="Zatwierdź">
                        </form>
                    </div>
                </c:if>

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
