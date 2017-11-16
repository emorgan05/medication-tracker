## Medication Tracker

# About
Medication Tracker is a Sinatra/ActiveRecord CRUD app that allows you to sign up for an account, add new medicines to your list, and track their automatically generated refill dates.
List all medications with dose and prescribing doctor, for those doctor visits and paperwork
Track and get a warning about upcoming refill dates, so you don't forget or miss them
After refilling the medicine, you can click one button to edit and generate a new refill date, so you are always on Track
You can also see a calendar view, so you know what will be coming up in the next couple of weeks


# Installation
Clone the repository, then execute:

$ bundle

# Usage
Clean then migrate the database:

$ rake db:reset db:migrate
To start the server, run:

$ shotgun
Then navigate to localhost:9393 or run:

$ open http://localhost:9393
Note: You can also use rackup then go to localhost:9292 as an alternative to shotgun

# Tech
Medication Tracker uses a number of open source projects to work properly:

Sinatra - A DSL for quickly creating web applications in Ruby with minimal effort.
Active Record - Connects classes to relational database tables.
Twitter Bootstrap - great UI boilerplate for modern web apps.
Bcrypt - A sophisticated and secure hash algorithm designed by The OpenBSD project.

Thanks to Corneal for the easy set up.

And of course Medication Tracker itself is open source with a public repository on GitHub.

# To Dos
Modify the new and edit forms to be more streamlined for the user
Create a model that allows the user to track whether they took their medicines today

# Contributing
Bug reports and pull requests are welcome on GitHub at this project's repository. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

# License
This Web Application is available as open source under the terms of the MIT License.
