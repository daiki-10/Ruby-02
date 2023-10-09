CHOICES = ["グー", "チョキ", "パー"]

DIRECTIONS = ["上", "下", "左", "右"]

def random_choice
  CHOICES.sample
end

def choose_direction
  puts "どの方向を選びますか？"
  puts "1(上) 2(下) 3(左) 4(右)"
  choice = gets.chomp.to_i
  if choice.between?(1, DIRECTIONS.length)
    DIRECTIONS[choice - 1]
  else
    puts "無効な選択です。1から#{DIRECTIONS.length}の数字を選んでください。"
    choose_direction
  end
end

def judge(player_choice, computer_choice)
  if player_choice == computer_choice
    "引き分け"
  elsif (player_choice == "グー" && computer_choice == "チョキ") ||
        (player_choice == "チョキ" && computer_choice == "パー") ||
        (player_choice == "パー" && computer_choice == "グー")
    "あなたの勝ち！"
  else
    "コンピュータの勝ち！"
  end
end

loop do
  puts "じゃんけんをします！"
  puts "1(グー) 2(チョキ) 3(パー) 0(ゲームを終了)"
  player_choice = gets.chomp.to_i

  if player_choice == 0
    puts "ゲームを終了します。"
    break
  elsif player_choice.between?(1, 3)
    player_choice -= 1
    computer_choice = random_choice

    puts "あなた: #{CHOICES[player_choice]}"
    puts "相手: #{computer_choice}"

    result = judge(CHOICES[player_choice], computer_choice)
    puts result

    if result == "あなたの勝ち！"
      player_direction = choose_direction
      puts "あっち向いてホイ！"
      puts "あなた: #{player_direction}"
      puts "相手: #{computer_direction = DIRECTIONS.sample}"
      if player_direction == computer_direction
        puts "あなたの勝ち！"
      else
        puts "残念、もう一回！"
      end
    elsif result == "コンピュータの勝ち！"
      computer_direction = DIRECTIONS.sample
      puts "あっち向いてホイ！"
      puts "あなた: #{player_direction = choose_direction}"
      puts "相手: #{computer_direction}"
      if player_direction == computer_direction
        puts "コンピュータの勝ち！"
      else
        puts "もう一回！"
      end
    end
  else
    puts "無効な選択です。1から3の数字を選んでください。"
  end
end