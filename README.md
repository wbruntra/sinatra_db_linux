# Setup in Ubuntu

```sh
sudo gem install bundler
bundle update
```

Now we need to configure some postgresql settings before our application will be allowed to do anything with this database.
```sh
sudo gedit /etc/postgresql/9.3/main/pg_hba.conf
```

Look for and change "md5" to "trust" at end of some lines

Next we need to set a password for postgres.

The default password for this app is found in:
  - database.yaml file (line 5)
  - database.rb file (line 26)

In terminal, type:
```sh
sudo -u postgres psql
```

Which puts you inside psql shell. Type:

```sh
ALTER USER postgres PASSWORD 'dummy';
```

You will receive confirmation message 'ALTER ROLE'

Exit psql shell with

```sh
\q
```

You should now be able to access and edit the database. In project folder:

```sh
rake db:create
rake db:migrate
rake db:seed
```

And if everything is working as it should:
```sh
shotgun config.ru
```
