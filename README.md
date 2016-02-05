# Running the application in Ubuntu

### Preliminary
First, make sure postgresql is installed on the system:
```sh
sudo apt-get install postgresql postgresql-contrib
```
Next, get all the gems for the project:
```sh
sudo gem install bundler
bundle update
```

### Postgres Settings
We need to configure some postgresql settings before our application will be allowed to do anything with this database.
```sh
sudo gedit /etc/postgresql/9.3/main/pg_hba.conf
```
In this file, look for and change "md5" to "trust" at end of some lines.

Next, we need to set a password for the "postgres" user.

The default password for this app is 'dummy', which can be found in:
  - database.yaml file (line 5)
  - database.rb file (line 26)

Change those files if you want to.
Then, in terminal, type:
```sh
sudo -u postgres psql
```

Which puts you inside the psql shell. Enter:

```sh
ALTER USER postgres PASSWORD 'dummy';
```

You will receive confirmation message 'ALTER ROLE'

Exit psql shell with

```sh
\q
```

And you should now be able to access and edit the database.

### Final
In project folder:
```sh
rake db:create
rake db:migrate
rake db:seed
```

And if everything is working as it should:
```sh
shotgun config.ru
```
