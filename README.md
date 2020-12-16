# Advanced-shopping-list-in-Spring-Boot
It is a project implemented after passing all modules of the course in CodersLab. \
I used the technologies and tools, which I learned, to create a very useful application. I use it in my daily life. \
The most important used technologies:
- __Spring Boot__
- __Spring DATA, Security, MVC__
- __Hibernate__
## What programme is that?
The application allows you to manage the nutritional plan.

Application Features:
- creating your own recipes (also editing and deleting);
- using the recipes of other users;
- creating weekly nutritional plans;
- based on a given weekly nutritional plan, a shopping list is created, which can be edited and then downloaded in pdf format.
## How it works? 
I would like to point out few curious functionality:
- to secure url address forgery, almost all Controller action are handled by post method. PlanDetails action of the PlanController and myRecipes action of the RecipeController, which are handled by get method are additionally secured:
    - planDetails shows plan details only if given planId belongs to current user (to prevent other users plans from changing);
    - myRecipes delete setOfIngredientsWithQuantities by given id only when it isn't assign to any recipe.
- myRecipes delete setOfIngredientsWithQuantities to prevent unnecessary data stored in the database. If the user withdraws from adding a new recipe, setOfIWQ is automatically removed from the database;
- if user wants to add recipe to plan but his own recipe list is empty or if he wants to create shopping list based on empty plan, is informed about it;
- if user adds recipe from all recipes list to his own list he copied it actually, so changes made by the user to a given recipe do not affect on the original recipe;
- on all recipes list are shown only original recipes;
- to create pdf file I used OpenPDF.