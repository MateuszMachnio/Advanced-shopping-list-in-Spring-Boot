<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Widoki aplikacji</title>
    <%@include file="../../constantParts/head.jspf"%>
</head>
<body>
<div class="container">
    <%@include file="../../constantParts/header.jspf" %>

    <div id="content">
        <div id="topOfContent">

        </div>
        <div id="middleOfContent">

            <div id="textNotLoggedIn">
                <h1>Przykładowe widoki aplikacji po zalogowaniu</h1>

                <div style="margin-left: 150px">

                    <div class="image">
                    <img src="<c:url value="/static/css/images/allRecipes.png"/>" alt="widok aplikacji po zalogowaniu" title="wszystkie przepisy">
                    </div>
                    <div class="image">
                    <img src="<c:url value="/static/css/images/recipeDetails.png"/>" alt="widok aplikacji po zalogowaniu" title="szczegóły przepisu">
                    </div>
                    <div class="image" style="clear: left">
                    <img src="<c:url value="/static/css/images/addingIngredients.png"/>" alt="widok aplikacji po zalogowaniu" title="dodawanie składników do przepisu">
                    </div>
                    <div class="image">
                    <img src="<c:url value="/static/css/images/newRecipe.png"/>" alt="widok aplikacji po zalogowaniu" title="tworzenie nowego przepisu">
                    </div>
                    <div class="image" style="clear: left; margin-bottom: 50px">
                    <img src="<c:url value="/static/css/images/planDetails.png"/>" alt="widok aplikacji po zalogowaniu" title="szczegóły planu">
                    </div>
                    <div class="image">
                    <img src="<c:url value="/static/css/images/creatingShoppingList.png"/>" alt="widok aplikacji po zalogowaniu" title="tworzenie listy zakupów">
                    </div>
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
