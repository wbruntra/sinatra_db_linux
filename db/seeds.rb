animal_list = [ "Rat",
    "Dog",
    "Pig",
    "Goat"]

animal_list.each do |name|
  Model.create( name: name )
end
