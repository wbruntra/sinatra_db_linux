# Running the application in Ubuntu

### Preliminary
If you are starting from scratch on Ubuntu, you will need to get Ruby and bundler on your system.
```sh
sudo apt-get install ruby ruby-dev
sudo apt-get install bundler
```

You'll also need postgresql:
```sh
sudo apt-get install postgresql postgresql-contrib
sudo apt-get install libpq-dev
```
All the gems for this project should install without issue:
```sh
bundle update
```

### Postgres Settings
Normally, the two commands we use to create and drop databases are:
```sh
rake db:create
rake db:drop
```
But postgres will not allow us to run those commands, since the only postgres user allowed to create or drop databases is named "postgres". To run those commands under the name "postgres", you instead enter
```sh
sudo -u postgres rake db:create
sudo -u postgres rake db:drop
```
Run the first of those commands will create the database our app will use. However, it still needs permission to run migrations and seed data, so we will do this in the postgres shell by typing
```sh
sudo -u postgres psql
```
We need to set a password for the "postgres" user which our app will use.

The default password for the app uses is 'dummy', which can be found in:
  - config/database.rb (line 26)

Change that line if you want to. Then, in the shell, type
```sh
ALTER USER postgres PASSWORD 'dummy';
```
(Replace 'dummy' with your new password if you've changed it). Quit the shell with
```sh
\q
```
And you should now be able to access and edit the database.

### Final
Test whether everything is working by running:
```sh
sudo -u postgres rake db:create
rake db:migrate
rake db:seed
```

Then:
```sh
shotgun config.ru
```
If everything worked, shotgun will have started a server at
```sh
http://localhost:9393
```
from which you can see all the existing Model entries as well as create new ones.
