# README

# Setup
* Ruby version
3.0.3-p157
* Rails version
7.0.2.4
* Initialize <br/>
From the base directory use "bundle install" to install dependencies.
Start server with "rails s", and go to localhost:3000 to view the application.

# Usage
This is an app, where users can login and create chat rooms to write messages in.
* Front page <br/>
Can press buttons to go to login form, or sign up form, once a proper form has been filled out routes to room index page

* Room index <br/>
Has button to logout or change user avatar. 
Also has a list of currently created rooms sorted by most recently active in the top, and a button to a form for creating a new room. 
A room can be clicked on to enter the room, where users cen write and recieve messages.

* Room <br/>
In a room the 50 most recent messages are loaded, with a button to increase the amount in increments of 50. 
Messages contain avatar, username, content and date/time and displays each of them. 
at the bottom there is a text field and a send button, which when pressed creates a message with the contents of the textfield.

# Bugs/problems
Avatars caused crashes when trying to use variations. They also caused crashes when the app ran preview and analyse jobs on a newly created one. Right now the avatars are transfared in their default size each time, which is unoptimal, but it works. </br></br>
Avatars also are not displayed properly in the live recieved messages, but work for messages already present when entering the chat. </br></br>
Rooms needed to also have a description displayed, but adding it now would take some time because it would not fit in the current layout. </br></br>
