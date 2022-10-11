class Hangman

    def initialize
      @word = words.sample
      @lives = 7
      @word_teaser = ""
  
      @word.first.size.times do
        @word_teaser += "_ "
      end
    end
  
    def words
      [
        ["iphone", "Nie andorid", "telefon"],
        ["bieganie", "Na przykład nie bieżni", "sport"],
        ["powerbank", "Naładuje telefon wszędzie gdzie jesteś", "zasilanie"]
      ]
    end
  
    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
      end
  
    def update_teaser last_guess
      new_teaser = @word_teaser.split
  
      new_teaser.each_with_index do |letter, index|
        # replace blank values with guessed letter if matches letter in word
        if letter == '_' && @word.first[index] == last_guess
          new_teaser[index] = last_guess
        end
      end
  
      @word_teaser = new_teaser.join(' ')
    end
  
    def make_guess
      if @lives > 0
        puts "Wprowadź literę:"
        guess = gets.chomp
  
        good_guess = @word.first.include? guess
  
        if guess == "exit"
          puts "Dziękuję za gre!"

        elsif guess == "podpowiedz"
            puts "Podpowiedź: #{ @word[1] }"
            make_guess
          
        #if guess is longer than 1 letter
        elsif guess.length > 1
          puts "Możesz wprowadzić tylko jedną literę!"
            make_guess
          
        elsif good_guess
          puts "Poprawna litera!"
  
          print_teaser guess
  
          if @word.first == @word_teaser.split.join
            puts "Gratuluje, wygrałeś"
          else
            make_guess
          end
        else
          @lives -= 1
          puts "Sorry... Pozostało ci #{ @lives } żyć. Spróbuj ponownie!"
          make_guess
        end
      else
        puts "Gra skończona!"
      end
    end
  
    def begin
      # ask user for a letter
      puts "Nowa gra... Twój wyraz ma #{ @word.first.size } liter i jest z kategorii #{ @word.last }"
      puts "Aby wyjść z gry wpisz 'exit'"
      puts "Aby uzyskać podopwiedź wpisz 'podpowiedz"
      puts "Masz #{ @lives } żyć"
      print_teaser
  
      make_guess
    end
  
  end
  
  game = Hangman.new
  game.begin