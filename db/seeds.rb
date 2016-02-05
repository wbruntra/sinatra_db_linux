# Este archivo sirve para correr código que te permita
# rellenar tu base de datos con información.

animal_list = [ "Rat",
    "Dog",
    "Pig",
    "Goat"]

animal_list.each do |name|
  Model.create( name: name )
end
