Some useful commands:

Create new model:

rake generate:model NAME=Word
rake generate:migration NAME=create_words

Add column to model:

rake generate:migration NAME=add_{column}_to_models
def create
  add_column :{table_name}, :{column}, :{type}

Set up database:

rake db:create
rake db:migrate
rake db:seed


rake db:drop
