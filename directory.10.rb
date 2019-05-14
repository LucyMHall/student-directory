
 
# Put actions in methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  students = []
  name = "default"
  
  while true do
     puts "Name:"
    name = gets.delete!"\n"
    if name.empty?
      break
    end
    
    months = {"January" => :January, "February" => :February, "March" => :March, 
      "April" => :April, "May" => :May, "June" => :June, "July" => :July, "August" => :August,
      "September" => :September, "October" => :October, "November" => :November, "December" => :December}
    
    cohort = "default"
    until months.has_key?(cohort)
      puts "What is your cohort?"
      cohort = gets.delete!"\n"
      month = months[cohort]
    end
    
    students << {name: name, cohort: month}
    puts "Now we have #{students.count} students"
    
  end
  # returns the array of students
  students
 end
  
  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end


def print(students)
  cohorts = {}
  students.each do |data|
    if cohorts.has_key?(data[:cohort])
      cohorts[data[:cohort]] << data[:name]
    else
      cohorts[data[:cohort]] = [data[:name]]
    end
  end 
  cohorts.each { |cohort, names| puts "#{cohort.to_s}: #{names.join(", ")}" }
end


def print_footer(names)
  count_statement = "Overall, we have #{names.count} student"
  puts names.length < 2 ? count_statement : count_statement + "s"
end

students = input_students
print_header
print(students)
print_footer(students)