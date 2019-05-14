
 
# Put actions in methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = nil
  
  while name != "Jane Doe" 
    
    puts "Name?"
    name = gets.chomp
    name = "Jane Doe" if name.empty?
      
    months = {"January" => :January, "February" => :February, "March" => :March, 
      "April" => :April, "May" => :May, "June" => :June, "July" => :July, "August" => :August,
      "September" => :September, "October" => :October, "November" => :November, "December" => :December}
    cohort = ""
    
    puts "What is your cohort?"
    cohort = gets.chomp
    cohort.empty? ? month = :May : month = months[cohort]
    
    students << {name: name, cohort: month}
    puts "Now we have #{students.count} students"
    
  end
  
  return students
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
  puts "Overall, we have #{names.count} students"
end

students = input_students
print_header
print(students)
print_footer(students)