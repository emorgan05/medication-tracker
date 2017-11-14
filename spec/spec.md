# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
I used Sinatra
- [x] Use ActiveRecord for storing information in a database
I used ActiveRecord and inherited from both Migrations and Base classes
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
Models = User, Medicine
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
User has_many Medicines
- [ ] Include user accounts
- [ ] Ensure that users can't modify content created by other users
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
Medicine can be created with the new route/form, read with the show.erb, updated with the edit route/form, and destroyed with the delete route/form
- [ ] Include user input validations
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
