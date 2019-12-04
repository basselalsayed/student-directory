def print_header
  puts "The students of Villains Academy".center(50)
  puts "----------------------".center(50)
end

def print(names)
  if names.count == 0
    puts "There are no students to print"
    nil
  else
    puts "Would you like to group by cohort or sort by name?"
    answer = gets.strip!
    if answer == "cohort"
      grouped_by_cohort = Hash.new { |h, k| h[k] = [] }
      names.each { |person| grouped_by_cohort[person[:cohort]] << person }
      puts "If you would like to see a specific cohort, enter the month below. Otherwise return twice to see all grouped"
      choice = gets.chomp!
      if choice.empty?
        print_header
        c = 0
        grouped_by_cohort.each { |cohort, person| 

          person.each { |i| 
          puts %{
            #{(c + 1)}. #{i[:name]} (#{i[:cohort]} cohort)
               Hobbies: #{i[:hobbies]} 
               Country: #{i[:country]} 
               Height: #{i[:height]} cm}.center(50)  
          c += 1
        }}
      else
        print_header
        c = 0
        grouped_by_cohort.each { |cohort, person| 
          person.each { |i| 
          puts %{
            #{(c + 1)}. #{i[:name]} (#{i[:cohort]} cohort)
               Hobbies: #{i[:hobbies]} 
               Country: #{i[:country]} 
               Height: #{i[:height]} cm}.center(50)  if i[:cohort] == choice.to_sym
          c += 1
        }}
      end
      


    else
      puts "Would you like to print all students or by a specific letter?"
      selection = gets.capitalize.strip!
      print_header
      i = 0
      until i == names.length
        if i == names.length 
          break
        else
          if names[i][:name].length < 12
            if selection != "All" 
              puts %{
              #{(i + 1)}. #{names[i][:name]} (#{names[i][:cohort]} cohort)
                Hobbies: #{names[i][:hobbies]} 
                Country: #{names[i][:country]} 
                Height: #{names[i][:height]} cm}.center(50) if names[i][:name][0] == selection
            else
              puts %{
              #{(i + 1)}. #{names[i][:name]} (#{names[i][:cohort]} cohort)
                 Hobbies: #{names[i][:hobbies]} 
                 Country: #{names[i][:country]} 
                 Height: #{names[i][:height]} cm}.center(50)
            end
            i += 1
          end
        end
      end
    end
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{ names.count } great student"
  else
    puts "Overall, we have #{ names.count } great students"
  end
end

def input_students
  students = []
  puts "Please enter the names of the student:"
  puts "To finish, just hit return twice"
  name = gets.strip!
    while !name.empty? do
      puts "Please enter a cohort (return twice for default: november):"
      cohort = gets.strip!
      puts "You have entered: #{cohort}. If this is correct return twice, otherwise please re-enter: "
      cohort_2 = gets.strip!
      if cohort_2.empty?
        cohort = :november if cohort.empty?
      else
        cohort = cohort_2
      end
      puts "Please enter the hobbies (return twice to finish):"
      hobbies = []
      hobby = gets.strip!
        while !hobby.empty? do
          hobbies << hobby.capitalize!
          hobby = gets.strip!
        end
      
      puts "Please enter country of birth"
      country = gets.strip!
      puts "Please enter height"
      height = gets.strip!
      students << { name: name.capitalize!, cohort: cohort.to_sym, hobbies: hobbies, country: country.capitalize!, height: height }
      puts "Now we have #{students.count} students"
      puts "Please enter the names of the student"
      puts "To finish, just hit return twice"
      name = gets.strip!
    end
    students
end


# students = input_students
# print(students)
# print_footer(students)

def interactive_menu
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    
    
    
    
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2" #show the students
      print(students)
      print_footer(students)
      
    when "9"
      exit #terminates program
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu