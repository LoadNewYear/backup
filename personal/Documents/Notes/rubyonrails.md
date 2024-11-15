# MVC (Model View Controller)
## Model
This has the entire knowledge of the database, it knows how it works and can perform CRUD actions on it. Only the contorller can talk to it.
## View
This is what the user sees, the view does not have any logic built into it, it can only communicate with the controller.
## Controller
This is the middleman between the model and the view, it takes in the information the view sends it and determines what to do with that information. It can decide wether to contact the model or just do nothing. It can also return something which the view will then output to the user.
