def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # add hobbies
  puts "Enter any hobbies"
  hobbies = gets.chomp
  # add date of birth
  puts "Enter date of birth"
  dob = gets.chomp
  # while the name is not empty, repeat this code
  while true do
    # add the student hash to the array
    students << {name: name, hobbies: hobbies, dob: dob, cohort: :November}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter next students name"
    name = gets.chomp
    if name.empty?
      break
    end
    # add hobbies
    puts "Enter any hobbies"
    hobbies = gets.chomp
    # add date of birth
    puts "Enter date of birth"
    dob = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
#  puts "with less than 12 characters in their name"
  puts "-------------"
end

# prints student names and cohort
def prints(names)
  count = 0
  width = 50
    while count < names.length
     puts "#{names[count][:name]}".center(width)
     puts "Hobbies: #{names[count][:hobbies]}.".center(width)
     puts "Date of Birth: #{names[count][:dob]}".center(width)
     puts "#{names[count][:cohort]} cohort"
     print "\n"
     count += 1
    end
end

# def prints(names)
#   names.each_with_index do |student, index|
#     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end

# prints names less than 12 characters
# def prints(names)
#   names.each do |student|
#     puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].size < 12
#   end
# end

def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

def names_begin_with(students, letter)
  puts "...with names beginning with #{letter} are:"
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0]  == letter
  end
end

students = input_students
print_header
prints(students)
#names_begin_with(students, "D")
print_footer(students)