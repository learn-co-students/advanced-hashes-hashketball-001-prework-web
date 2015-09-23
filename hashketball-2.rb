require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["black", "white"],
      players: {
        alan_anderson: {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        reggie_evans: {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        brook_lopez: {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        mason_plumlee: {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        jason_terry: {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["turquoise", "purple"],
      players: {  
        jeff_adrien: {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        bismak_biyombo: {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        desagna_diop: {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        ben_gordon: {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        brendan_haywood: {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |home_away, data|
    data.each do |details, attributes|
      if details == :players
        attributes.each do |player, stats|
          if player.to_s == player_name.downcase.split(" ").join("_")
             return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |home_away, data|
    data.each do |details, attributes|
      if details == :players
        attributes.each do |player, stats|
          if player.to_s == player_name.downcase.split(" ").join("_")
             return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |home_away, data|
    data.each do |details, attributes|
      if data[details] == team_name
        return data[:colors].map{|color| color.capitalize}
      end
    end
  end
end

def team_names
  teams = []
  game_hash.each do |home_away, data|
    data.each do |details, attributes|
      if details == :team_name
        teams << attributes
      end
    end
  end
  teams
end

def player_numbers(team_name)
  player_numbers = []
  game_hash.each do |home_away, data|
    data.each do |details, attributes|
      if attributes == team_name
        data[:players].each do |player, stats|
          player_numbers << stats[:number]
        end
      end
    end
  end
  player_numbers
end

def player_stats(player_name)
  game_hash.each do |home_away, data|
    data.each do |details, attributes|
      if details == :players
        attributes.each do |player, stats|
          if player.to_s == player_name.downcase.split(" ").join("_")
             return stats
           end
         end
       end
     end
   end
end

def big_shoe_rebounds
  largest_shoe_size = nil
  rebound_tracker = nil

  game_hash.each do |home_away, data|
    data.each do |details, attributes|
      if details == :players
        attributes.each do |player, stats|
          if largest_shoe_size == nil
            largest_shoe_size = stats[:shoe]
            rebound_tracker = stats[:rebounds]
          elsif stats[:shoe] > largest_shoe_size
            largest_shoe_size = stats[:shoe]
            rebound_tracker = stats[:rebounds]
          end
        end
      end
    end
  end

  rebound_tracker       
end
