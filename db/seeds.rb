require_relative('../models/student')
require_relative('../models/house')

require('pry')

House.delete_all()
Student.delete_all()

house1 = House.new({"name" => "Gryffindor", "url" => "www.gryffindor.com"})
house2 = House.new({"name" => "Ravenclaw", "url" => "www.ravenclaw.com"})
house3 = House.new({"name" => "Hufflepuff", "url" => "www.hufflepuff.com"})
house4 = House.new({"name" => "Slytherin", "url" => "www.slytherin.com"})

house1.save
house2.save
house3.save
house4.save

student1 = Student.new({"first_name" => "Harry", "second_name" => "Potter", "house_id" => house1.id, "age" => 12})
student2 = Student.new({"first_name" => "Hermione", "second_name" => "Granger", "house_id" => house1.id, "age" => 12})
student3 = Student.new({"first_name" => "Ron", "second_name" => "Weasley", "house_id" => house1.id, "age" => 12})
student4 = Student.new({"first_name" => "Cho", "second_name" => "Chang", "house_id" => house2.id, "age" => 13})
student5 = Student.new({"first_name" => "Cedric", "second_name" => "Diggory", "house_id" => house3.id, "age" => 15})
student6 = Student.new({"first_name" => "Draco", "second_name" => "Malfoy", "house_id" => house4.id, "age" => 12})

student1.save
student2.save
student3.save
student4.save
student5.save
student6.save

binding.pry
nil
