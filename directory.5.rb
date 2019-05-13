
 
# Put actions in methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
 
  name = "default"
  

  while true do
    
    puts "Name?"
    name = gets.chomp
    if name.empty?
      break
    end
    puts "What is your country of birth?"
    country = gets.chomp
    
    students << {name: name, country: country, cohort: :november}
    puts "Now we have #{students.count} students"
    
  end

  students
 end
  
  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{student[:name]} (#{student[:cohort]} cohort, from #{student[:country]}) "
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