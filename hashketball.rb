# Write your code here!
require 'pry'

def game_hash

  stats = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
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
        },
      }, #:players
    }, #:home
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
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
        },
      }, #:players
    },
  }

end

def num_points_scored(player)

  answer = 0

  game_hash.each do |side,side_hash|
    side_hash.each do |info,result|
      if result.is_a?(Hash)
        result.each do |player_name,stat|
          #binding.pry
          if player_name == player
            #binding.pry
            stat.each do |stat,number|
              if stat == :points
                answer = number
              end
            end
          end
        end
      end
    end
  end

  answer

end

def shoe_size(player)

  answer = 0

  game_hash.each do |side,side_hash|
    side_hash.each do |info,result|
      if result.is_a?(Hash)
        result.each do |player_name,stat|
          #binding.pry
          if player_name == player
            #binding.pry
            stat.each do |stat,number|
              if stat == :shoe
                answer = number
              end
            end
          end
        end
      end
    end
  end

  answer

end

def team_colors(team_name)

  answer = []

  game_hash.each do |side,side_hash|
    side_hash.each do |info,result|
      if info == :colors
        answer = result
      elsif result != team_name
        break
      end
    end
  end

  answer

end

def team_names

  answer = []

  answer << game_hash[:home][:team_name]
  answer << game_hash[:away][:team_name]

  answer
end

def player_numbers(team_name)

  answer = []

  game_hash.each do |side,side_hash|
    if side_hash[:team_name] == team_name
      #binding.pry
      side_hash.each do |info,result|
        if result.is_a?(Hash)
          result.each do |player_name,stats|
            stats.each do |stat,number|
              if stat == :number
                answer << number
              end
            end
          end
        end
      end
    end
  end

  answer

end

def player_stats(player)

  answer = {}

  game_hash.each do |side,side_hash|
    side_hash.each do |info,result|
      if result.is_a?(Hash)
        result.each do |player_name,stats|
          if player_name == player
            answer = stats
          end
        end
      end
    end
  end

  answer

end

def big_shoe_rebounds

  biggest_shoe = ["player",0]

  game_hash.each do |side,side_hash|
      side_hash.each do |info,result|
        if result.is_a?(Hash)
          result.each do |player_name,stats|
            stats.each do |stat,number|
              if stat == :shoe && number > biggest_shoe[1]
                biggest_shoe = [player_name,number]
              end
            end
          end
        end
      end
  end

  answer = 0

  game_hash.each do |side,side_hash|
    side_hash.each do |info,result|
      if result.is_a?(Hash)
        result.each do |player_name,stats|
          if player_name == biggest_shoe[0]
            stats.each do |stat,number|
              if stat == :rebounds
                answer = number
              end
            end
          end
        end
      end
    end
  end

  answer

end
