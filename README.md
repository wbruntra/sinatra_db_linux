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
But running those commands gives an error, since we are running it under our own username while we _should_ be running it under the name "postgres". So, just enter
```sh
sudo -u postgres rake db:create
```
Which will create the database our app uses. However, if we try to run
```sh
rake db:migrate
```
we will get a different error about needing a password. We'll create a password under the postgres shell by typing
```sh
sudo -u postgres psql
```
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
If everything is working correctly you can run:
```sh
sudo -u postgres rake db:create
rake db:migrate
rake db:seed
```

Then:
```sh
shotgun config.ru
```
The server at
```sh
http://localhost:9393
```
will then allow you to see all the existing Model entries as well as create new ones.
