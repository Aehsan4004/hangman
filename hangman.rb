require 'json'

class Hangman
  WORD_LIST_FILE = "google-10000-english-no-swears.txt"
  MAX_ATTEMPTS = 6
  SAVE_FILE = "hangman_save.json"

  def initialize
    @word = select_random_word
    @hidden_word = Array.new(@word.length, '_')
    @incorrect_letters = []
    @remaining_attempts = MAX_ATTEMPTS
  end

  def select_random_word
    words = File.readlines(WORD_LIST_FILE).map(&:chomp).select { |word| word.length.between?(5, 12) }
    words.sample.downcase
  end

  def display_status
    puts "\nWord: " + @hidden_word.join(' ')
    puts "Incorrect guesses: #{@incorrect_letters.join(', ')}"
    puts "Remaining attempts: #{@remaining_attempts}"
  end

  def guess_letter(letter)
    letter.downcase!
    if @word.include?(letter)
      @word.chars.each_with_index { |char, index| @hidden_word[index] = char if char == letter }
    else
      @incorrect_letters << letter unless @incorrect_letters.include?(letter)
      @remaining_attempts -= 1
    end
  end

  def save_game
    File.open(SAVE_FILE, 'w') do |file|
      file.puts JSON.dump({ word: @word, hidden_word: @hidden_word, incorrect_letters: @incorrect_letters, remaining_attempts: @remaining_attempts })
    end
    puts "Game saved successfully!"
  end

  def self.load_game
    if File.exist?(SAVE_FILE)
      data = JSON.parse(File.read(SAVE_FILE), symbolize_names: true)
      game = new
      game.instance_variable_set(:@word, data[:word])
      game.instance_variable_set(:@hidden_word, data[:hidden_word])
      game.instance_variable_set(:@incorrect_letters, data[:incorrect_letters])
      game.instance_variable_set(:@remaining_attempts, data[:remaining_attempts])
      game
    else
      puts "No saved game found. Starting a new game."
      new
    end
  end

  def play
    puts "Welcome to Hangman!"
    until @remaining_attempts.zero? || @hidden_word.join == @word
      display_status
      print "Enter a letter (or type 'save' to save and exit): "
      input = gets.chomp
      if input.downcase == 'save'
        save_game
        break
      elsif input.match?(/^[a-zA-Z]$/)
        guess_letter(input)
      else
        puts "Invalid input! Please enter a single letter."
      end
    end
    puts @hidden_word.join == @word ? "Congratulations! You guessed the word: #{@word}" : "Game over! The word was: #{@word}" unless input.downcase == 'save'
  end
end

# Game entry point
puts "Do you want to load a saved game? (yes/no)"
choice = gets.chomp.downcase
if choice == 'yes'
  Hangman.load_game.play
else
  Hangman.new.play
end
