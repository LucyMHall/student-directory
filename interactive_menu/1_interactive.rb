@students = []
@success = "You have successfully "
# Initialising Process

def initial_load_students
    filename = ARGV.first
    return if filename.nil?
    if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
end

def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
end

# Deciding Time

def print_menu
  menu = ["1. Input the students", "2. Show the students", "3. Save students", "4. Load the list from students.csv", "9. Exit"]
  puts menu
end

def process(selection)

  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end 
end


# Option 1
def input_students
  puts @success + "selected input student"
  ask_for_input
  name = STDIN.gets.chomp
  
  while !name.empty? do
   student_data_to_array(name)
    print_student_count
    name = STDIN.gets.chomp
  end
  
  @students
end

def ask_for_input
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
end 

# Option 2
def show_students
  puts @success + "selected show students"
  print_header
  print_students_list
  print_student_count
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
    @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end


# Option 3
def save_students
  puts @success + "saved students"
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end


#Option 4 / Called at initialisation

def load_students(filename ="students.csv")
    puts @success + "loaded students"
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      student_data_to_array(name, cohort)
    end
    file.close
end


#Abstractions

# used in Option 1 (Input) and Option 4 (Load Students)

def student_data_to_array(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def print_student_count
 puts "We now have #{@students.count} students."
end

initial_load_students
interactive_menu
