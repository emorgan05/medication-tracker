# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
I used Sinatra
- [x] Use ActiveRecord for storing information in a database
I used ActiveRecord and inherited from both Migrations and Base classes
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
Models = User, Medicine, Calendar
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
User has_many Medicines, Calendar has_many Medicines through Users
- [x] Include user accounts
User has an account and their password is authenticated on login
- [x] Ensure that users can't modify content created by other users
All CRUD methods use the helper methods logged_in? and current_user to check that the user attempting to modify is logged in and is the owner, so only the user who created it can modify it
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
Medicine can be created with the new route/form, read with the show.erb, updated with the edit route/form, and destroyed with the delete route/form
- [x] Include user input validations
I check user inputs on username (must be there and unique), email, and password. When a user creates a new medication they must include a name, dose_number, and number_in_bottle
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
I use rack-flash to display error messages. I made them detailed and red font, so they stand out
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
Today (11/15/17 at 1pm) I have 46 commits
- [x] Your commit messages are meaningful
last commit message: "add checks to index/show/edit/delete so only the user can modify"
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
I think there are 2 that something else was included in the commit that I had forgotten about.
