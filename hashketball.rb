# Write your code here!
require 'pry'
require 'benchmark'

def game_hash
  game_hash = {
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
        }
      }
    }
  }
end

def all_teamsplayers_extractor
  extracted_players_array = Array.new
  extracted_players_array = game_hash.collect {|team, info| info.collect {|players,attributes| players == :players ? game_hash[team][players] : nil}}.flatten.compact
  array_to_hash_outputer = {}
  i = 0
  while i < extracted_players_array.size do
    if array_to_hash_outputer.size == 0
      array_to_hash_outputer = extracted_players_array[i]
    else array_to_hash_outputer = array_to_hash_outputer.merge(extracted_players_array[i])
    end
    i += 1
  end
  array_to_hash_outputer
end

def num_points_scored(player_name)
  check_method_result = all_teamsplayers_extractor[player_name]
  if check_method_result == nil
    return nil
  else return check_method_result[:points]
  end
end

def shoe_size(player_name)
  check_method_result = all_teamsplayers_extractor[player_name]
  if check_method_result == nil
    return nil
  else return check_method_result[:shoe]
  end
end

def team_colors(team_name)
  teams_array = game_hash.values
  i = 0

  while i < teams_array.size do
    if teams_array[i][:team_name] == team_name
      return teams_array[i][:colors]
    end
    i += 1
  end
end

def team_names
  teams_array = game_hash.values
  teams_array.collect {|item| item[:team_name]}
end

def player_numbers(team_name,key = :number)
  teams_array = game_hash.values
  teams_array.collect {|item| item[:team_name]}
  i = 0

  while i < teams_array.size do
    if teams_array[i][:team_name] == team_name
      b = teams_array[i].collect do |teaminfo, info|
    		if teaminfo == :players
    			info.collect{|players, value| value[key]}
    		end
    	end
      return b.compact.flatten.sort
    end
    i += 1
  end
end

def get_max_index(key, playerreturn = false)
  if playerreturn
    local_teams_hash = all_teamsplayers_extractor
    player_index = local_teams_hash.invert.keys.collect {|item,val| item[key]}.index(local_teams_hash.invert.keys.collect {|item,val| item[key]}.max)
    if player_index == nil
      return nil
    else return local_teams_hash.keys[player_index]
    end
  elsif playerreturn
    local_teams_hash = all_teamsplayers_extractor
    return local_teams_hash.invert.keys.collect {|item,val| item[key]}.index(local_teams_hash.invert.keys.collect {|item,val| item[key]}.max)
  end
end


def player_stats(player_name)
all_teamsplayers_extractor[player_name]
end

def big_shoe_rebounds
  identified_player = get_max_index(:shoe, true)
  all_teamsplayers_extractor[identified_player][:rebounds]
end

def most_points_scored
  get_max_index(:points,true)
end

def get_each_teams_stats(key = :points, return_team_name = false)

  extractor = game_hash.collect do |teams,info|
    info.collect do |players, attribute|
      if players == :players
        attribute.collect do |player,stats|
          stats[key]
        end
      end
    end
  end

  if return_team_name
    teams_results = extractor.flatten(1).compact
    team_names_extractor = game_hash.collect do |teams,info|
	     info.collect do |teaminfo,vals|
		      if teaminfo == :team_name
			         vals
		      end
	     end
    end
    winning_team_index = teams_results.index(teams_results.sort[-1])
    return team_names_extractor.flatten.compact[winning_team_index]

  elsif return_team_name
    return extractor.flatten(1).compact.sort[-1]
  end
end

def winning_team
  get_each_teams_stats(:points,true)
end

def player_with_longest_name
  players_name_list = all_teamsplayers_extractor.keys
  players_name_lengths = players_name_list.collect {|item| item.length}
  winning_name_length = players_name_lengths.sort[-1]
  winning_player = players_name_list[players_name_lengths.index(winning_name_length)]
end

#n = 10000
#Benchmark.bm do |x|
#  x.report {n.times do num_points_scored("Alan Anderson");a="1";end}
#  x.report {n.times do num_points_scored_unlocalized("Alan Anderson");a="1";end}
#end
