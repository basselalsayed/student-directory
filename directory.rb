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
          puts "#{(i + 1)}. #{names[i][:name]} (#{names[i][:cohort]} cohort)
          hobbies: #{names[i][:hobbies]} country: #{names[i][:country]} height: #{names[i][:height]}" if names[i][:name][0] == selection
        else
          puts "#{(i + 1)}. #{names[i][:name]} (#{names[i][:cohort]} cohort)
          hobbies: #{names[i][:hobbies]} country: #{names[i][:country]} height: #{names[i][:height]}"
        end
        i += 1
      end
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{ names.count } great students"
end


def input
  students = []
  puts "Please enter the names of the student"
  puts "To finish, just hit return twice"
  name = gets.chomp!
    while !name.empty? do
      puts "Please enter the hobbies (return twice to finish)"
      hobbies = []
      hobby = gets.capitalize.chomp!
        while !hobby.empty? do
          hobbies << hobby
          hobby = gets.chomp!
        end
      puts "Please enter country of birth"
      country = gets.chomp!
      puts "Please enter height"
      height = gets.chomp!
      students << { name: name.capitalize!, cohort: :november, hobbies: hobbies, country: country.capitalize!, height: height }
      puts "Please enter the names of the student"
      puts "To finish, just hit return twice"
      name = gets.chomp!
    end
    students
end


students = input
print_header
print(students)
print_footer(students)
