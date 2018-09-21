def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def prints(names)
  names.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
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

students = input_students
print_header
# prints(students)
names_begin_with(students, "D")
print_footer(students)