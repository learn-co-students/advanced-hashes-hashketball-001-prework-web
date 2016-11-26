require 'pry'

def game_hash
    hash = {
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

def good_practices
    #binding pry practice
    game_hash.each do |location, team_data|
        binding.pry
        team_data.each do |attribute, data|
            binding.pry
            data.each do |data_item|
                binding.pry
            end
        end
    end
end

def num_points_scored(name)
    #when given player's name, return their scored points
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data.is_a?(Hash)
                data.each do |player, player_data|
                    if player == name
                        return player_data[:points]
                    end
                end
            end
        end
    end
end

def shoe_size(name)
    #when given player's name, return their shoe size
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data.is_a?(Hash)
                data.each do |player, player_data|
                    if player == name
                        return player_data[:shoe]
                    end
                end
            end
        end
    end
end

def team_colors(name)
    #when given team name, return array of team colors
    game_hash.each do |location, team_data|
        if team_data[:team_name] == name
            return team_data[:colors]
        end
    end
end

def team_names
    #return array of team names
    team_array = []
    game_hash.each do |location, team_data|
        team_array << team_data[:team_name]
    end
    team_array
end

def player_numbers(team)
    #when given team name, return array of players' numbers
    team_nums = []
    game_hash.each do |location, team_data|
        if team_data[:team_name] == team
            team_data.each do |key, value|
                if value.is_a?(Hash)
                    value.each do |stat, stat_num|
                        team_nums << stat_num[:number]
                    end
                end
            end
        end
    end
    team_nums
end

def player_stats(name)
    #when given player's name, return hash of their stats without including their name
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data.is_a?(Hash)
                data.each do |player, stats|
                    if player == name
                        return stats
                    end
                end
            end
        end
    end
end
    
def big_shoe_rebounds
    #return number of rebounds associated with the player who has the largest shoe size
    big_shoe = 0
    rebound = 0
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data.is_a?(Hash)
                data.each do |player, stats|
                    if big_shoe < stats[:shoe]
                        big_shoe = stats[:shoe]
                        rebound = stats[:rebounds]
                    end
                end
            end
        end
    end
    rebound
end