
 
# Put actions in methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # gets another name from the user
    name = gets.chomp
  end
  # returns the array of students
  students
 end
  
  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) "
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Nothing happens until we call the methods, remember to put in correct parameters

students = input_students
print_header
print(students)
print_footer(students)