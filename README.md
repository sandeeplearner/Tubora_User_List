# Tubora_User_List

### Description :

Tubora_User_List application reads the data from Users.json file which is placed inside the application bundle, parses the data to create
json objects and then finally applies the user selected filter and shows the users list matching the search filter in the form of list.

User can change the filter at any point by tapping on the filter button available at the right hand corner of the home screen, and select
a complete different filter and list will be updated immediately.

User can even tap on the list item and can see all the information about the specific user from the list.

### How to install :

* Application makes use of Cocoa Pods to add and maintain the dependency. In order to build the code, please install Cocoa Pods.
Link to Cocoa Pods : (https://cocoapods.org)

* Use terminal to navigate to the root folder and execute ```Pod install```

* Click on the application workspace to open the project.

### Main things to notice :
1. Universal application
2. Usage of Decoadable protocol to map JSON to Object
3. Complete MVC architecture
4. Enum with Associated value to hold currently applied filter
5. Complete dynamic app. Every single data like departments, locations etc are derived dynamically from data source, So adding a new entry to existing
   json file will not need a single line of code change and yet will reflect the change.
6. Adding any new property to existing JSON, app will ignore the property by default, but adding one line to ```init(json: JSON) {``` to process the property
  will immediately reflect the change in entire application.

### Application UX :
Having the four button at the bottom of the screen and asking the user to tap on it to change the filter sounded a little messed up UX to me,
hence took a liberty to modify the UX as follow.

* App on launch by default takes department as applied filter and searches the user who belongs to "Retail Brokerage" department.
It is conveyed to the user using the view placed on top of the tableView which always will reflect the currently applied filter.

<img src="http://s13.postimg.org/g3zcfpopz/Screen_Shot_2016_09_21_at_10_02_25_PM.png" width="200">

* User can tap on the filter button provided on the right hand corner of the screen, depending on whether the application is running on iPhone or iPad
either filter screen will be presented modally or in the form of pop over. On opening, the filter screen will expand the specfic section containing
the filter selected by user and shows a tick mark next to it.

<img src="http://s11.postimg.org/opqkjo9b7/Screen_Shot_2016_09_21_at_10_26_59_PM.png" width="200">

* User can tap on any of the genric category like Employee type, Department,location or Jobtitle. Section will expand and will show the list of various possible 
options availabe for the section. User can select any of the option by tapping on it and filter screen will dismiss it self and user list will be updated with applied filter.

* User can tap on any of the cell in user list and User Info view controller will show the user info. User Info screen is designed using tableView
so adding any additional property to user json will auto matically be reflected. Dynamic tableView is provided with the intention of dealing with
changing property in User json.

<img src="http://s18.postimg.org/dnja776y1/Screen_Shot_2016_09_21_at_11_19_43_PM.png" width="200">
