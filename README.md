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
I used the __Spring Boot__ and __Hibernate__ frameworks to build the application. \
Thanks to __Spring Data__ and the JpaRepository interface, performing database operations is very easy. \
BookController is responsible for all interaction with the user. \
Data collection takes place via the JpaBookService service layer, which uses the BookRepository interface to retrieve the data. \
The downloaded data is transferred to the corresponding .jsp files. \
If the user adds or edits the book, the entered data is additionally validated.