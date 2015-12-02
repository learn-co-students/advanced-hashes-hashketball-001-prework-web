require 'pry'

def game_hash
    games = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black","White"],
            :players => [
                                {:player_name => "Alan Anderson",
                                :number => 0,
                                :shoe => 16,
                                :points => 22,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 3,
                                :blocks => 1,
                                :slam_dunks => 1 },

                                {:player_name => "Reggie Evans",
                                :number => 30,
                                :shoe => 14,
                                :points => 12,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 12,
                                :blocks => 12,
                                :slam_dunks => 7},

                                {:player_name => "Brook Lopez",
                                :number => 11,
                                :shoe => 17,
                                :points => 17,
                                :rebounds => 19,
                                :assists => 10,
                                :steals => 3,
                                :blocks => 1,
                                :slam_dunks => 15},

                                {:player_name => "Mason Plumlee",
                                :number => 1,
                                :shoe => 19,
                                :points => 26,
                                :rebounds => 12,
                                :assists => 6,
                                :steals => 3,
                                :blocks => 8,
                                :slam_dunks => 5},

                                {:player_name => "Jason Terry",
                                :number => 31,
                                :shoe => 15,
                                :points => 19,
                                :rebounds => 2,
                                :assists => 2,
                                :steals => 4,
                                :blocks => 11,
                                :slam_dunks => 1}]
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise","Purple"],
            :players => [
                                {:player_name => "Jeff Adrien",
                                :number => 4,
                                :shoe => 18,
                                :points => 10,
                                :rebounds => 1,
                                :assists => 1,
                                :steals => 2,
                                :blocks => 7,
                                :slam_dunks => 2},

                                {:player_name => "Bismak Biyombo",
                                :number => 0,
                                :shoe => 16,
                                :points => 12,
                                :rebounds => 4,
                                :assists => 7,
                                :steals => 7,
                                :blocks => 15,
                                :slam_dunks => 10},

                                {:player_name => "DeSagna Diop",
                                :number => 2,
                                :shoe => 14,
                                :points => 24,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 4,
                                :blocks => 5,
                                :slam_dunks => 5},

                                {:player_name => "Ben Gordon",
                                :number => 8,
                                :shoe => 15,
                                :points => 33,
                                :rebounds => 3,
                                :assists => 2,
                                :steals => 1,
                                :blocks => 1,
                                :slam_dunks => 0 },

                                {:player_name => "Brendan Haywood",
                                :number => 33,
                                :shoe => 15,
                                :points => 6,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 22,
                                :blocks => 5,
                                :slam_dunks => 12}]
        }

    }
    return games
end

def num_points_scored(player)
  games = game_hash
  points_scored = nil

  games.collect do |team, team_data|
    team_data.collect do |attributes, data|
      if attributes == :players
        data.each do |player_hash|
          if player_hash[:player_name] == player
            points_scored = player_hash[:points]
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(player)
  games = game_hash
  shoe_man = nil

  games.collect do |team, team_data|
    team_data.collect do |attributes, data|
      if attributes == :players
        data.each do |player_hash|
          if player_hash[:player_name] == player
            shoe_man = player_hash[:shoe]
          end
        end
      end
    end
  end
  shoe_man
end

def team_colors(team_name)
  games = game_hash
  colors = []

  games.collect do |team, team_data|
    team_data.collect do |attributes, data|
      if attributes == :colors
        data.each do |team_color|
          if games[team][:team_name] == team_name
            colors << team_color
          end
        end
      end
    end
  end
  colors
end

def team_names
  games = game_hash
  team_name_array = []

  games.collect do |team, team_data|
    team_data.collect do |attributes, data|
      if attributes == :team_name
        team_name_array << data
      end
    end
  end
  team_name_array
end

def player_numbers(team_name)
  games = game_hash
  team_jerseys = []

  games.each do |team, team_data|
    team_data.each do |attributes, data|
      if attributes == :players
        data.each do |player_hash|
          player_hash.each do |att, val|
            if games[team][:team_name] == team_name
              team_jerseys << player_hash[:number]
            end
          end
        end
      end
    end
  end
  team_jerseys = team_jerseys.uniq
end

def player_stats(player)
  games = game_hash
  stats = {}

  games.collect do |team, team_data|
    team_data.collect do |attributes, data|
      if attributes == :players
        data.each do |player_hash|
          if player_hash[:player_name] == player
            stats = player_hash
          end
        end
      end
    end
  end
  stats.delete_if do |x, y|
    x == :player_name
  end
  stats
end

def big_shoe_rebounds
  games = game_hash
  big_shoe_size = 0
  big_shoe_name = ""
  rebound = nil

  games.collect do |team, team_data|
    team_data.collect do |attributes, data|
      if attributes == :players
        data.each do |player_hash|
          player_hash.each do |att, val|
            if att == :shoe
              if player_hash[:shoe] > big_shoe_size
                big_shoe_size = player_hash[:shoe]
                big_shoe_name = player_hash[:player_name]
              end
            end
          end
        end
      end
    end
  end
  games.collect do |team, team_data|
    team_data.collect do |attributes, data|
      if attributes == :players
        data.each do |player_hash|
          if player_hash[:player_name] == big_shoe_name
            rebound = player_hash[:rebounds]
          end
        end
      end
    end
  end
  rebound
end
