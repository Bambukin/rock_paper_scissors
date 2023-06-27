VARIANTS = %w[камень вода воздух бумага губка ножницы огонь].freeze
WIN_CONDITION = %w[06 05 04 10 16 15 21 20 26 30 31 32 41 42 43 52 53 54 63 64 65].freeze

def who_won(user_choice, computer_choice, win_condition)
  return 0 if user_choice == computer_choice

  code = "#{user_choice}#{computer_choice}"
  win_condition = win_condition.include?(code)

  return 1 if win_condition

  2
end

VARIANTS.each.with_index(1) do |variants, index|
  puts "#{index} - #{variants}"
end

user_choice = 0
until user_choice.between?(1, VARIANTS.size)
  puts 'Выберете один из вариантов'
  user_choice = $stdin.gets.to_i
end

computer_choice = rand(VARIANTS.size)

user_text = VARIANTS[user_choice]
puts "Вы выбрали #{user_text}"

computer_text = VARIANTS[computer_choice]
puts "Компьютер выбрал #{computer_text}"

puts case who_won(user_choice, computer_choice, WIN_CONDITION)
     when 0 then 'Ничья'
     when 1 then 'Вы победили'
     when 2 then 'Победил компьютер'
     end
