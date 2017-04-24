# Write your code here!
require 'pry'

def game_hash
 hash = {
    home:{
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: {
            "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks:1, slam_dunks: 1},
            "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks:12, slam_dunks: 7},
            "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks:1, slam_dunks: 15},
            "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks:8, slam_dunks: 5},
            "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks:11, slam_dunks: 1}
        }
    },
    away:{
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: {
            "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks:7, slam_dunks: 2},
            "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks:15, slam_dunks: 10},
            "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks:5, slam_dunks: 5},
            "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks:1, slam_dunks: 0},
            "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks:5, slam_dunks: 12}
        }       
    }
 }   
 
 hash   
end

def num_points_scored(name)
    final = 0
    game_hash.each do |k, v|
        v.each do |k2, v2|
            if k2.to_s == "players"
              v2.each do |k3, v3|
                if k3 == name
                    final = v3[:points]
                end
             end
            end
        end
    end
    final
end


def shoe_size(name)
    final = 0
    game_hash.each do |k, v|
        v.each do |k2, v2|
            if k2.to_s == "players"
              v2.each do |k3, v3|
                if k3 == name
                    final = v3[:shoe]
                end
             end
            end
        end
    end
    final
end

def team_colors(name)
    final = []
    temp = ""
    game_hash.each do |k,v|
        if v.has_value?(name) 
            v.each do |k2, v2|
                if k2 == :colors
                    final << v2
                end
            end
        end
    end
    final.flatten
end

def team_names
    final = []
    game_hash.each do |k,v|
        v.each do |k2, v2|
            if k2 == :team_name
                final << v2
            end
        end
    end
    final
end

def player_numbers(team_name)
    final = []
    temp = ""
    game_hash.each do |k,v|
        v.each do |k2, v2|
            if v2 == team_name
                game_hash[k][:players].each do |ke,ve|
                    final << ve[:number]
                end
            end
        end
    end
    final.flatten
end

def player_stats(name)
hash = {}
    game_hash.each do |k,v|
        v.each do |k2, v2|
            if k2 == :players
                v2.each do |k3, v3|
                    if k3 == name
                        hash = v3
                    end
                end
            end
        end
    end    
     hash
end

def big_shoe_rebounds
 size = 0 
 final = 0  
    game_hash.each do |k,v|
        game_hash[k][:players].each do |k2,v2|
            if v2[:shoe] >size
                size = v2[:shoe]
            end
        end
    end

    game_hash.each do |k,v|
        game_hash[k][:players].each do |k2,v2|
            v2.each do |k3, v3|
                if  v2[:shoe] == size
                    final = v2[:rebounds]
                end
            end
        end
    end
    final
 end

def most_points_scored
    points = {:name => "blank", :points => 0}
    game_hash.each do |k,v|
        game_hash[k][:players].each do |k2,v2|
            if v2[:points] > points[:points]
                points[:name] = k2
                points[:points] = v2[:points]
            end
        end
    end
    points[:name]
end

def winning_team
    score = {}
    team = ""
    sum = 0
    game_hash.each do |k,v|
        game_hash[k][:players].each do |k2,v2|
            team = game_hash[k][:team_name]
            sum = sum + v2[:points]
            score[team] = sum
        end
        sum =0
    end
    temp = 0
    score.each do |k,v|
        if v > temp
            team = k
            temp = v
        end
    end
 team
end

def player_with_longest_name
  name = {}  
    game_hash.each do |k,v|
        game_hash[k][:players].each do |k2,v2|
            name[k2] = k2.length
        end
    end
hash = {name: "blank", length: 0}
    name.each do |k,v|
        if v > hash[:length]
            hash[:name] = k
            hash[:length] = v
        end
    end
    hash[:name]
end

def long_name_steals_a_ton?
    name = player_with_longest_name
    steals = 0
    final = false
    game_hash.each do |k,v|
        game_hash[k][:players].each do |k2,v2|
            if k2 == name
                steals = v2[:steals]
            end
        end
    end

    game_hash.each do |k,v|
        v[:players].each do |k2, v2|
            if k2 != name
                if v2[:steals] < steals
                    final = true 
                end
            end
        end
    end
    
    final
end

long_name_steals_a_ton?