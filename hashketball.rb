require 'pry'

def game_hash
  { home: 
    {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:
        {
          "Alan Anderson" => 
            {
              number: 0,
              shoe: 16,
              points: 22,
              rebounds: 12,
              assists: 12,
              steals: 3,
              blocks: 1,
              slam_dunks: 1
            },
          "Reggie Evans" =>
            {
              number: 30,
              shoe: 14,
              points: 12,
              rebounds: 12,
              assists: 12,
              steals: 12,
              blocks: 12,
              slam_dunks: 7
            },
          "Brook Lopez" =>
            {
              number: 11,
              shoe: 17,
              points: 17,
              rebounds: 19,
              assists: 10,
              steals: 3,
              blocks: 1,
              slam_dunks: 15
            },          
          "Mason Plumlee" =>
            {
              number: 1,
              shoe: 19,
              points: 26,
              rebounds: 12,
              assists: 6,
              steals: 3,
              blocks: 8,
              slam_dunks: 5
            },          
          "Jason Terry" =>
            {
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
    away: 
    {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:
        {
          "Jeff Adrien" =>
            {
              number: 4,
              shoe: 18,
              points: 10,
              rebounds: 1,
              assists: 1,
              steals: 2,
              blocks: 7,
              slam_dunks: 2
            },
          "Bismak Biyombo" =>
            {
              number: 0,
              shoe: 16,
              points: 12,
              rebounds: 4,
              assists: 7,
              steals: 7,
              blocks: 15,
              slam_dunks: 10
            },          
          "DeSagna Diop" =>
            {
              number: 2,
              shoe: 14,
              points: 24,
              rebounds: 12,
              assists: 12,
              steals: 4,
              blocks: 5,
              slam_dunks: 5
            },          
          "Ben Gordon" =>
            {
              number: 8,
              shoe: 15,
              points: 33,
              rebounds: 3,
              assists: 2,
              steals: 1,
              blocks: 1,
              slam_dunks: 0
            },          
          "Brendan Haywood" =>
            {
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

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(player)
  game_hash.each do |location, team_data|
    return team_data[:players][player][:points] if team_data[:players].include?(player)
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    return team_data[:players][player][:shoe] if team_data[:players].include?(player)
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == team
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:players].collect do |player, data|
        data[:number]
      end
    end
  end
end

def player_stats(player)
  game_hash.each do |location, team_data|
    return team_data[:players][player] if team_data[:players].include?(player)
  end
end

def all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def player_shoe_sizes
  shoe_sizes = {}
  all_players.each do |player, stats|
    shoe_sizes[player] = stats[:shoe]
  end
  shoe_sizes
end

def biggest_shoe_player
  player_shoe_sizes.max_by{|key, value| value}[0]
end

def big_shoe_rebounds
  big_shoe_player = biggest_shoe_player
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      return stats[:rebounds] if player == big_shoe_player
    end
  end
end

def most_points_scored
  player_points_hash = {}
  all_players.each do |player, stats|
    player_points_hash[player] = stats[:points]
  end

  player_points_hash.max_by{|key, value| value}[0]
end

def winning_team
  totals = { }
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if totals[team_data[:team_name]].nil?
        totals[team_data[:team_name]] = stats[:points]
      else
        totals[team_data[:team_name]] += stats[:points]
      end
    end
  end
  totals.max_by{|key, value| value}[0]
end


def player_with_longest_name
  longest_name = nil
  longest_length = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if player.length > longest_length
        longest_name = player
        longest_length = player.length
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  player_with_most_steals = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals] 
        player_with_most_steals = player
      end
    end
  end
  player_with_longest_name == player_with_most_steals
end