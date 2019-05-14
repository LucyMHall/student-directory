
 
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
      name = "Jane Doe"
    end
    
    months = {"January" => :January, "February" => :February, "March" => :March, 
      "April" => :April, "May" => :May, "June" => :June, "July" => :July, "August" => :August,
      "September" => :September, "October" => :October, "November" => :November, "December" => :December}
    cohort = ""
    
      puts "What is your cohort?"
      cohort = gets.chomp
      if cohort.empty?
        month = "May"
      else
        month = months[cohort]
      end
    
     
    students << {name: name, cohort: month}
    puts "Now we have #{students.count} students"
    
    if name == "Jane Doe"
      break
    end 

  end
  students
 end
  
  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end


def print(students)
  students.each do |student|
    puts "#{student[:name]}, #{student[:cohort]} cohort "
  end
end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)