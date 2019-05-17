require "csv"
@students = []
@counter = 0
@success = "You have successfully "
# Initialising Process

def initial_load_students
    @specified_file = ARGV.first
    return if @specified_file.nil?
    if File.exists?(@specified_file)
      load_students
      puts "Loaded #{@students.count} from #{@specified_file}"
    else
      puts "Sorry, #{@specified_filename} doesn't exist."
      exit
    end
end

def interactive_menu
    @counter += 1
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
end

# Deciding Time

def print_menu
  menu = ["1. Input the students", "2. Show the students", "3. Save students to a file", "4. Load a file", "9. Exit"]
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
  which_file?
  CSV.open("#{@filename}", "wb") do |csv|
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv << student_data
      end
  end 
  puts @success + "saved your inputs to #{@filename}"
end
  


#Option 4 / Called at initialisation

def load_students
  puts @success + "loaded students"
  which_file?
  CSV.open("#{@filename}", "rb") do |csv|
    CSV.foreach("#{@filename}") do | row|
      student_data_to_array(row[0], row[1])
    end
  end
 end    
       

def which_file?
  if @counter < 1
    @filename = @specified_file
  else
    user_input = ""
    until File.exist?(user_input)
      puts "What file would you like to use?"
      user_input= STDIN.gets.chomp
    end
    @filename = user_input
  end
end

#Abstractions

# used in Option 1 (Input) and Option 4 (Load Students)

def student_data_to_array(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def print_student_count
 puts "We now have #{@students.count} students."
end

#Read Source Code
def read_source_code
 open_file = File.open(__FILE__, "r")
 contents = open_file.read
 open_file.close
 puts contents
end

initial_load_students
read_source_code
interactive_menu


