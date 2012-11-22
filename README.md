Mate Questions
==============


Simple platform for creating quizzes for courses

## Instructions

First clone the repository. Then install the dependencies:

    bundle

Migrate the database:

    rake db:migrate

Create a User in the database to be able to edit questions. This can be done
by using a simple rake task included:

    rake create_user NEW_USER="your@email.com, yourpassword"

Run the server