## Some useful commands:

#### Make new model:
```sh
rake generate:model NAME=Word
rake generate:migration NAME=create_words
```

#### Define Model characteristics in migration

```rb
class CreateModels < ActiveRecord::Migration
  def change
  	create_table :models do |t|
  		t.string :name
  	end
  end
end
```

Add column to model:
```sh
rake generate:migration NAME=add_{column}_to_models
```
```rb
def change
  add_column :{table_name}, :{column}, :{type}
end
```

#### Database commands:

```sh
sudo -u postgres rake db:create
sudo -u postgres rake db:drop
rake db:migrate
rake db:seed
```
