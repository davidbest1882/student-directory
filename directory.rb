def input_students
  students = []
  while true do
    # months for cohorts
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]    # get name from the user
    puts "Please enter the names of the student"
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
    students << {name: name, hobbies: hobbies, dob: dob, cohort: cohort}
    # print student total
    if students.count <= 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
#  puts "with less than 12 characters in their name"
  puts "-------------"
end

# prints student names, hobbies, dob and cohort. Lines are centered
def prints(names)
  count = 0
  width = 50
    while count < names.length
     # prints student details, centered on line
     puts "#{names[count][:name]}".center(width)
     puts "Hobbies: #{names[count][:hobbies]}.".center(width)
     puts "Date of Birth: #{names[count][:dob]}".center(width)
     puts "#{names[count][:cohort]} cohort".center(width)
     print "\n"
     count += 1
    end
end

def prints(names)
  names.each_with_index do |student, index|
  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# prints names less than 12 characters
def prints(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].size < 12
  end
end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

def names_begin_with(students, letter)
  puts "...with names beginning with #{letter} are:"
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0]  == letter
  end
end

# print students from a given cohort
def print_cohort(students, month)
    puts "These are the students from #{month} cohort"
    students.map do |student|
        puts "#{student[:name]}" if student[:cohort] == month
    end
end

students = input_students
print_header
prints(students)
# names_begin_with(students, "D")
print_footer(students)
# print_cohort(students, :November)