class Hangman 

    def initialize
        @letters = ('a'..'z').to_a
        @word = words.sample
    end

    def words
        [
            ["cricket", "A game played by gentleman"],
            ["jogging", "We are not walking"],
            ["celebrate", "Remembering specjal moments"],
            ["exotic", "Not from around here..."]
        ]
    end

    def print_teaser

        word_teaser = ""

        @word.first.size.times do
            word_teaser += "_ "
        end

        puts word_teaser
    end

    def make_guess
    end

    def begin
        #ask for a letter
        puts "New game started..."
        puts "Your word is #{ @word.first.size } charactter long"
        
        print_teaser
        
        puts "Clue: #{ @word.last }"
        
        puts "Enter letter"
        
        guess = gets.chomp
        puts "You guessed #{ guess }"
    end

end

game = Hangman.new
game.begin