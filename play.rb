class Hangman 

    def initialize
        @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 7
        @correct_guess = []
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
        if @lives > 0

            guess = gets.chomp
            puts "You guessed #{ guess }"

            #if letter is not part of word then remove from letters array
            good_guess = @word.first.include? guess
            if good_guess
                puts "You are correct"

                @correct_guess << guess
                print_teaser
                make_guess
            else
                @lives -= 1
                puts "Sorry... You have #{ @lives } guess left. Try again"
                make_guess
            end

        else
            puts "Game over..."
        end

    end

    def begin
        #ask for a letter
        puts "New game started..."
        puts "Your word is #{ @word.first.size } charactter long"
        
        print_teaser
        
        puts "Clue: #{ @word.last }"
        
        puts "Enter letter"
        
        make_guess
        
    end

end

game = Hangman.new
game.begin