def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  puts "Would you like to print all students or by a specific letter?"
  selection = gets.capitalize.chomp!
  i = 0
  until i == names.length
    if i == names.length 
      break
    else
      if names[i][:name].length < 12
        if selection != "All" 
          puts "#{(i + 1)}. #{names[i][:name]} (#{names[i][:cohort]} cohort)" if names[i][:name][0] == selection
        else
          puts "#{(i + 1)}. #{names[i][:name] } (#{names[i][:cohort]} cohort)" 
        end
        i += 1
      end
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{ names.count } great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp!
  
  while !name.empty? do 
    students << { name: name.capitalize!, cohort: :november }
    puts "Now we have #{ students.count } students"
    name = gets.chomp!
  end

  students
end

students = input_students
print_header
print(students)
print_footer(students)
