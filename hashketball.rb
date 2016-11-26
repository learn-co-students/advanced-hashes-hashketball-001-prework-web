require 'pry'

# Write your code here!
def game_hash
  team = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :player_name => "Alan Anderson",
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
        :player_name => "Reggie Evans",
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
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
      "Mason Plumlee"  => {
        :player_name => "Mason Plumlee",
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
        :player_name => "Jason Terry",
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
        :player_name => "Jeff Adrien",
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
        :player_name => "Bismak Biyombo",
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
        :player_name => "DeSagna Diop",
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
        :player_name => "Ben Gordon",
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
        :player_name => "Brendan Haywood",
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


def num_points_scored(players_name)
  points_scored = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players
        specifics.each do |name, stats|
          if name == players_name
            stats.each do |stat_point, stat_result|
              if stat_point == :points
                points_scored << stat_result
              end
            end
          end
        end
      end
    end
  end
  points_scored.join.to_i
end


def shoe_size(players_name)
  size = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players 
        specifics.each do |name, stats|
          if name == players_name
            stats.each do |stat_point, stat_result|
              if stat_point == :shoe
                size << stat_result
              end
            end
          end
        end
      end
    end
  end
  size.join.to_i
end


def team_colors(team_name)
  colors = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if specifics == team_name
          colors << data[:colors]
      end
    end
  end
  colors.flatten
end

def team_names
  names = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :team_name
        names << specifics
      end
    end
  end
  names
end


def player_numbers(team)
  numbers = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if specifics == team
        data[:players].each do |name, stat|
          stat.each do |stat_point, stat_result|
            if stat_point == :number
              numbers << stat_result
            end
          end
        end
      end
    end
  end
  numbers
end

#player_numbers("Brooklyn Nets")

def player_stats(player_name)
  stats = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players
        specifics.each do |name, stat|
          if name == player_name
            stats << stat
          end
        end
      end
    end
  end
  stats[0].delete_if do |key, value|
    key == :player_name
  end
  stats[0]
end

def big_shoe_rebounds
  shoe_size = []
  rebound_num = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players
        specifics.each do |name, stats|
          shoe_size << stats[:shoe]
        end
      end
    end
  end
  shoe_size = shoe_size.sort.reverse
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players
        specifics.each do |name, stats|
          stats.each do |stat_point, stat_result|
            if stat_point == :shoe
              if shoe_size[0] == stat_result
                rebound_num << stats[:rebounds]
              end
            end
          end
        end
      end
    end
  end
  rebound_num.join.to_i
end

def most_points_scored
  highest_points_player = []
  high_scores = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players
        specifics.each do |name, stats|
          high_scores << stats[:points]
        end
      end
    end
  end
  high_scores = high_scores.sort.reverse
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players
        specifics.each do |name, stats|
          if high_scores[0] == stats[:points]
            highest_points_player << name
          end
        end
      end
    end
  end
  highest_points_player.join
end

def winning_team
  team_scores_array = []
  teams = []
  game_hash.each do |location, data|
    team_scores = []
    data.each do |categories, specifics|
      if categories == :team_name
        teams << specifics
      end
      if categories == :players
        specifics.each do |name, stats|
          stats.each do |stat_point, stat_result|
            if stat_point == :points
              team_scores << stat_result
            end
          end
        end
      end
    end
    team_scores_array[team_scores_array.size] = team_scores
  end
  each_team_total = []
  team_scores_array.each do |all_scores|
    sum = 0
    all_scores.each do |each_score|
      sum += each_score
    end
    each_team_total[each_team_total.size] = sum
  end
  return teams[0] if each_team_total[0] > each_team_total[1]
  return teams[1] if each_team_total[1] > each_team_total[0]
end

def player_with_longest_name
  names = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players
        specifics.each do |name, stats|
          names << name
        end
      end
    end
  end
  name_lengths_sort = names.sort_by{|i| i.length}.reverse
  name_lengths_sort[0]
end

def long_name_steals_a_ton?
  most_steals_name = []
  player_steals = []
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players
        specifics.each do |name, stats|
          stats.each do |stat_point, stat_result|
            if stat_point == :steals
              player_steals << stat_result
            end
          end
        end
      end
    end
  end
  player_steals = player_steals.sort.reverse
  game_hash.each do |location, data|
    data.each do |categories, specifics|
      if categories == :players
        specifics.each do |name, stats|
          stats.each do |stat_point, stat_result|
            if stat_point == :steals
              if player_steals[0] == stat_result
                most_steals_name << name
              end
            end
          end
        end
      end
    end
  end
  return true if most_steals_name.join == player_with_longest_name
  return false if most_steals_name.join != player_with_longest_name
end


