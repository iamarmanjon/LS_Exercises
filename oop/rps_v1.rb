require 'pry'

class Player
  attr_accessor :move, :name

  def initialize(player_type)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      n = ""
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, you must input a name."
      end

      self.name = n
    else
      self.name = ['Jon Snow', 'Arya Stark', 'Little Finger', 'Cersie'].sample
    end
  end

  def choose
    if @player_type == :human
      choice = nil

      loop do
        puts 'Choose a move (rock, paper, scissors):'
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "Sorry, you must input correct choice."
      end

      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper and Scissors!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper and Scissors, goodbye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
    end

    return true if answer == 'y'
    return false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play