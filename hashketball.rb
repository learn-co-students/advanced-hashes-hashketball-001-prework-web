require 'pry'

def game_hash 
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
          "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
          },
          "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
          },
         "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
          },
          "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
          },
          "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1 
        }
      }
    },
           
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {  
        "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
        "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
        },
        "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
        "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
        "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12 
        }
      }
    }
  }
end

  
  def num_points_scored(player_name)
    all_players[player_name][:points]
  end 

  def home_players
    game_hash[:home][:players]
  end

  def away_players
    away_players = game_hash[:away][:players]
  end

  def all_players
    home_players.merge(away_players)
  end
 
  def shoe_size(player_name)
    all_players[player_name][:shoe]
  end

  def home_team
    game_hash[:home]
  end
  
  def away_team
    game_hash[:away]
  end

  def all_teams
    [home_team, away_team]
  end

  def team_colors(team_name)
    if team_name == game_hash[:home][:team_name]
      return game_hash[:home][:colors]
    else 
      return game_hash[:away][:colors]
    end
  end

  def team_names
    game_hash.collect do |loc, team_data|
      team_data[:team_name]
    end
  end

  def player_numbers(team_name)
    #returns player numbers in an array by team
    charlotte_numbers = []
    brooklyn_numbers = []
    if team_name == away_team[:team_name]
      away_players.each do |player_name, hash_of_stats|
        player_name.each do |category, stat|
          if category == :number
            charlotte_numbers << stat
          end
        end
      end
      return charlotte_numbers
    else
      home_players.each do |player_name, hash_of_stats|
        # binding.pry
        player_name.each do |category, stat|
          if category == :number
            brooklyn_numbers << stat
          end
        end
      end
      return brooklyn_numbers
    end
  end

  def player_stats(player_name)
    #shows hash of players with their stats
    all_players.fetch(player_name)
  end

  def big_shoe_rebounds
    #returns rebounds for player with largest shoes
    all_players.each do |player|
      player.shoe_size
    end
  end

