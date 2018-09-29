@students = [] # an empty array accessible to all methods
require 'csv'

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a csv file"
  puts "4. Load a different student list"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
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
    load_new_student_list
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Please enter the name of the file to save to."
  filename = gets.chomp
  # open the file for writing
  File.open(filename, "w") do |file|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file << csv_line
    end
  end
  puts "Your list has been saved."
  print "\n"
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
    name, cohort = row
      @students << {name: name, cohort: cohort.to_sym}
  end
end

def load_new_student_list
  puts "Enter a filename to load."
  new_file = gets.chomp
  @students = []
  if File.exists?(new_file)
    load_students(new_file)
    puts "Loaded #{@students.count} students from #{new_file}"
  else
    puts "File does not exist. Create new student list?"
    input_students if gets.chomp == "yes"
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # if no file given as argument
    load_students
    filename = "students.csv"
  elsif File.exists?(filename) # if it exists
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry #{filename} doesn't exist."
    exit # quit the program
  end
  puts "Loaded #{@students.count} students from #{filename}"
end

try_load_students
interactive_menu