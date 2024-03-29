require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame
  class Game
    
    attr_reader :title
    
    def initialize(title)
      @title = title 
      @players = []
    end

    def add_player(player_name)
      @players.push(player_name)
    end

    def play(rounds)
      puts "There are #{@players.size} players in #{@title}:"
        
      treasures = TreasureTrove::TREASURES
      puts "\nThere are #{treasures.size} treasures to be found:"

      treasures.each do |treasures|
        puts " A #{treasures.name} is worth #{treasures.points} points."
      end

      @players.each do |player|
        puts player
      end
        
      1.upto(rounds) do |round|
        if block_given?
          break if yield
        end
        puts "\nRound #{round}:"
          
        @players.each do |player|
          GameTurn.take_turn(player)
          puts player
        end
      end
    end

    def print_name_and_health(player)
      puts "#{player.name} (#{player.health})"
    end
    
    def print_stats
      puts "\n#{@title} Statistics:"

      strong_players, wimpy_players = @players.partition { |player| player.strong?}

      puts "\n#{strong_players.size} strong players:"
      strong_players.each do |player|
        print_name_and_health(player)
      end

      puts "\n#{wimpy_players.size} wimpy players:"
      wimpy_players.each do |player|
        print_name_and_health(player)
      end

      puts "\n#{@title} High Scores"
      @players.sort.each do |player|
        puts high_score_entry(player)
      end

        @players.sort.each do |player|
          puts "\n#{player.name}'s point totals:"
          puts "#{player.points} grand total points"
      end

      puts "\n#{total_points} total points from treasures found"

      @players.sort.each do |player|
        puts "\n#{player.name}'s point totals:"
        player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
      end
    end 

    def total_points
     @players.reduce(0) {|sum, player| sum + player.points}
    end

    def load_players(from_file)
      File.readlines(from_file).each do |line|
        add_player(Player.from_csv(line))
      end
    end

    # def load_players(from_file)
    #   CSV.foreach(from_file) do |row|
    #     player = Player.new(row[0], row[1].to_i)
    #     add_player(player)
    #   end
    # end

    def save_high_scores(to_file="high_scores.txt")
      File.open(to_file, "w") do |file|
        file.puts "#{@title} High Scores"
        @players.sort.each do |player|
          file.puts high_score_entry(player)
        end
      end
    end

    def high_score_entry(player)
      formatted_name = player.name.ljust(20, '.')
      "#{formatted_name} #{player.score}"
    end
  end
end