def lcd(size, number)

  numbers = { "0" => [ [" ","-"," "],
                       ["|"," ","|"],
                       [" "," "," "],
                       ["|"," ","|"],
                       [" ","-"," "] ],

              "1" => [ [" "," "," "],
                       [" "," ","|"],
                       [" "," "," "],
                       [" "," ","|"],
                       [" "," "," "] ],

              "2" => [ [" ","-"," "],
                       [" "," ","|"],
                       [" ","-"," "],
                       ["|"," "," "],
                       [" ","-"," "] ],

              "3" => [ [" ","-"," "],
                       [" "," ","|"],
                       [" ","-"," "],
                       [" "," ","|"],
                       [" ","-"," "] ],

              "4" => [ [" "," "," "],
                       ["|"," ","|"],
                       [" ","-"," "],
                       [" "," ","|"],
                       [" "," "," "] ],

              "5" => [ [" ","-"," "],
                       ["|"," "," "],
                       [" ","-"," "],
                       [" "," ","|"],
                       [" ","-"," "] ],

              "6" => [ [" ","-"," "],
                       ["|"," "," "],
                       [" ","-"," "],
                       ["|"," ","|"],
                       [" ","-"," "] ],

              "7" => [ [" ","-"," "],
                       [" "," ","|"],
                       [" "," "," "],
                       [" "," ","|"],
                       [" "," "," "] ],

              "8" => [ [" ","-"," "],
                       ["|"," ","|"],
                       [" ","-"," "],
                       ["|"," ","|"],
                       [" ","-"," "] ],

              "9" => [ [" ","-"," "],
                       ["|"," ","|"],
                       [" ","-"," "],
                       [" "," ","|"],
                       [" ","-"," "] ] }

  split_nums = number.to_s.split("")

  split_nums.each do |num|

    puts numbers[num][0][0] + (numbers[num][0][1] * size) + numbers[num][0][2]

    size.times {|x| puts numbers[num][1][0] + (numbers[num][1][1] * size) + numbers[num][1][2] }

    puts numbers[num][2][0] + (numbers[num][2][1] * size) + numbers[num][2][2]

    size.times {|x| puts numbers[num][3][0] + (numbers[num][3][1] * size) + numbers[num][3][2] }

    puts numbers[num][4][0] + (numbers[num][4][1] * size) + numbers[num][4][2]

  end
end

puts "What what number would you like to show?"

number = gets.chomp

puts "And how large would you like it?"

size = gets.chomp.to_i

lcd(size, number)
