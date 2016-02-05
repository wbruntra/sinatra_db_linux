# Setup in Ubuntu

```sh
sudo gem install bundler
bundle update
```

```sh
sudo gedit /etc/postgresql/9.3/main/pg_hba.conf
```

change lines with "md5" to "trust"

Next:

```sh
sudo -u postgres psql
```

Now, you are inside psql shell. Type:

```sh
ALTER USER postgres PASSWORD 'dummy';
```

You will receive confirmation message 'ALTER ROLE'

Finally, in project folder:

```sh
rake db:create
rake db:migrate
rake db:seed

shotgun config.ru
```
