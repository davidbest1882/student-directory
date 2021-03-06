@students = [] # an empty array accessible to all methods
  
def input_students
  while true do
    # months for cohorts
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]    # get name from the user
    puts "Please enter the name of the student"
    puts "To finish, do not enter anything and hit return"
    name = gets.delete("\n") # using alternative to chomp
    if name.empty?
      break
    end
    # add hobbies
    puts "Enter any hobbies"
    hobbies = gets.chomp
    # add date of birth
    puts "Enter date of birth"
    dob = gets.chomp
    # add cohort
    puts "Enter cohort month. Leave blank for current month"
    cohort = gets.chomp.to_sym
    # if no cohort entered, current month is entered
    if cohort.empty?
     cohort = months[Time.now.mon - 1]
    end
    # add the student hash to the array
    @students << {name: name, hobbies: hobbies, dob: dob, cohort: cohort}
    # print student total
    if @students.count <= 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
  end
end

# If 1 or more students, prints header
def print_header
  if @students.length > 0
    puts "The students of Villains Academy"
#   puts "with less than 12 characters in their name"
    puts "-------------"
  end
end

# If 1 or more students, prints student names, hobbies, dob and cohort. Lines are centered
def prints_details
  count = 0
  width = 50
    while count < @students.length
      # prints student details, centered on line
      puts "#{@students[count][:name]}".center(width)
      puts "Hobbies: #{@students[count][:hobbies]}.".center(width)
      puts "Date of Birth: #{@students[count][:dob]}".center(width)
      puts "#{@students[count][:cohort]} cohort".center(width)
      print "\n"
      count += 1
    end
    
end

# prints name and cohort
def print_students_list
  @students.each_with_index do |student, index|
  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# prints names less than 12 characters
def prints_upto_12
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].size < 12
  end
end

def names_begin_with(letter)
  puts "...with names beginning with #{letter} are:"
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0]  == letter
  end
end

# print students from a given cohort
def print_cohort(month)
    puts "These are the students from #{month} cohort"
    @students.map do |student|
        puts "#{student[:name]}" if student[:cohort] == month
    end
end

# If 1 or more students, prints footer
def print_footer
  if @students.count > 0
    puts "Overall, we have #{@students.count} great students"
  end
end

# print the menu and ask the user what to do
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I dont know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu