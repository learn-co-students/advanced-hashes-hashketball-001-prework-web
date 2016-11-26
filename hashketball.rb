# Write your code here!
require 'pry'


def game_hash
    gH = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players =>
                {
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
                    :slam_dunks => 5,
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
                        :slam_dunks => 0,
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
                }
        }
    }
    gH
    end


#def good_practices
#    game_hash.each do |location, team_data|
#        #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#        binding.pry
#        team_data.each do |attribute, data|
#            #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#            binding.pry
#            
#            #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#            data.each do |data_item|
#                binding.pry
#            end
#        end
#    end
#end
#


def num_points_scored(player_name)
    game_hash[:home][:players].each do |name, stats|
        #binding.pry
        if player_name == name
            return stats[:points]
            end
        end
    game_hash[:away][:players].each do |name, stats|
        #binding.pry
        if player_name == name
            return stats[:points]
            end
        end
    return nil
    end


def shoe_size(player_name)
    game_hash[:home][:players].each do |name, stats|
        #binding.pry
        if player_name == name
            return stats[:shoe]
        end
    end
    game_hash[:away][:players].each do |name, stats|
        #binding.pry
        if player_name == name
            return stats[:shoe]
        end
    end
    return nil
end


def team_colors(team_name)
    if game_hash[:home][:team_name] == team_name
        return game_hash[:home][:colors]
    elsif game_hash[:away][:team_name] == team_name
        return game_hash[:away][:colors]
        end
    return nil
    end

def team_names
    name_array = []
    game_hash.each do |name, info|
        name_array << info[:team_name]
        end
    name_array
    end

def player_numbers(team_name)
    number_array = []
    if team_name == game_hash[:home][:team_name]
        game_hash[:home][:players].each do |name, stats|
            number_array << stats[:number]
            end
    elsif team_name == game_hash[:away][:team_name]
        game_hash[:away][:players].each do |name, stats|
            number_array << stats[:number]
            end
        end
    number_array
end


def player_stats(player_name)
    game_hash[:home][:players].each do |name, stats|
        #binding.pry
        if player_name == name
            return stats
        end
    end
    game_hash[:away][:players].each do |name, stats|
        #binding.pry
        if player_name == name
            return stats
        end
    end
    return nil
end


def big_shoe_rebounds
    biggest_shoe_owner = ""
    shoe_size = 0
    rebound_number = 0
    game_hash[:home][:players].each do |name, stats|
        if stats[:shoe] > shoe_size
            biggest_shoe_owner = name
            shoe_size = stats[:shoe]
            rebound_number = stats[:rebounds]
            end
        end
    game_hash[:away][:players].each do |name, stats|
        if stats[:shoe] > shoe_size
            biggest_shoe_owner = name
            shoe_size = stats[:shoe]
            rebound_number = stats[:rebounds]
        end
    end
    rebound_number
    end

def most_points_scored
    highest_scorer = ""
    highest_score = 0
    game_hash[:home][:players].each do |name, stats|
        if stats[:points] > highest_score
            highest_scorer = name
            highest_score = stats[:points]
        end
    end
    game_hash[:away][:players].each do |name, stats|
        if stats[:points] > highest_score
            highest_scorer = name
            highest_score = stats[:points]
        end
    end
    highest_scorer
    end



puts most_points_scored














