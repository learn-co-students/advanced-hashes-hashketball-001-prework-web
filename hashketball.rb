require 'pry'

def game_hash
            {home: 
                  {team_name: ["Brooklyn Nets"], 
                   colors: ["Black", "White"], 
                   players: {"Alan Anderson": {
                                                player_name: "Alan Anderson",
                                                number: 0,
                                                shoe: 16,
                                                points: 22,
                                                rebounds: 12,
                                                assists: 12,
                                                steals: 3,
                                                blocks: 1,
                                                slam_dunks: 1},
                             "Reggie Evans": {
                                               player_name: "Reggie Evans",
                                               number: 30,
                                               shoe: 14,
                                               points: 12,
                                               rebounds: 12,
                                               assists: 12,
                                               steals: 12,
                                               blocks: 12,
                                               slam_dunks: 7},
                             "Brook Lopez": {
                                               player_name: "Brook Lopez", 
                                               number: 11,
                                               shoe: 17,
                                               points: 17,
                                               rebounds: 19,
                                               assists: 10,
                                               steals: 3,
                                               blocks: 1,
                                               slam_dunks: 15},
                            "Mason Plumlee": {
                                               player_name: "Mason Plumlee", 
                                               number: 1,
                                               shoe: 19,
                                               points: 26, 
                                               rebounds: 12,
                                               assists: 6,
                                               steals: 3,
                                               blocks: 8,
                                               slam_dunks: 5},
                            "Jason Terry": {
                                               player_name: "Jason Terry",
                                               number: 31,
                                               shoe: 15,
                                               points: 19,
                                               rebounds: 2,
                                               assists: 2,
                                               steals: 4,
                                               blocks: 11,
                                               slam_dunks: 1}
                            }},
             away:
                  {team_name: ["Charlotte Hornets"], 
                   colors: ["Turquoise", "Purple"], 
                   players:{"Jeff Adrien": {
                                            player_name: "Jeff Adrien", 
                                            number: 4,
                                            shoe: 18,
                                            points: 10,
                                            rebounds: 1,
                                            assists: 1,
                                            steals: 2,
                                            blocks: 7,
                                            slam_dunks: 2},
                            "Bismak Biyombo": {
                                            player_name: "Bismak Biyombo", 
                                            number: 0,
                                            shoe: 16,
                                            points: 12,
                                            rebounds: 4,
                                            assists: 7,
                                            steals: 7,
                                            blocks: 15,
                                            slam_dunks: 10},
                            "DeSagna Diop": {
                                            player_name: "DeSagna Diop", 
                                            number: 2,
                                            shoe: 14,
                                            points: 24,
                                            rebounds: 12,
                                            assists: 12,
                                            steals: 4,
                                            blocks: 5,
                                            slam_dunks: 5},
                             "Ben Gordon": {               
                                             player_name: "Ben Gordon", 
                                             number: 8,
                                             shoe: 15,
                                             points: 33, 
                                             rebounds: 3,
                                             assists: 2,
                                             steals: 1,
                                             blocks: 1,
                                             slam_dunks: 0},
                             "Brendan Haywood": {                 
                                             player_name: "Brendan Haywood", 
                                             number: 33,
                                             shoe: 15,
                                             points: 6,
                                             rebounds: 12,
                                             assists: 12,
                                             steals: 22,
                                             blocks: 5,
                                             slam_dunks: 12}
                            }
            }}
end


def num_points_scored(str)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      data.each do |data_item, score|
        if data_item == str.to_sym
          return score[:points]
        end
      end
    end
  end
end

def shoe_size(str)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      data.each do |data_item, score|
        if data_item == str.to_sym
          return score[:shoe]
        end
      end
    end
  end
end


def team_colors(str)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      data.each do |item|
        if item == str
         return game_hash[location][:colors]
        end
      end
    end
  end
end

def team_names
  team_name_array = []
  game_hash.each do |location, team_data|
    team_data.each do |key, value|
      if key == :team_name
        team_name_array << value
      end
    end
  end
  team_name_array.flatten
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, location_data|
    if location_data[:team_name].pop == team_name
      location_data.each do |attribute, attribute_data|
         if attribute == :players
          attribute_data.each do |key, value|
          numbers << value[:number]
          end
         end
       end
    end
  end
  numbers
end

def player_stats(name)
  player_stat = {}
  game_hash.each do |location, location_data|
    location_data.each do |attribute, attribute_data|
      attribute_data.each do |key, value|
        if key == name.to_sym
          player_stat = value
        end
      end
    end
  end
 player_stat.delete(:player_name)
 player_stat
end

def big_shoe_rebounds
  sizes = []
  max_size = 0
  game_hash.each do |location, location_data|
    location_data.each do |attribute, attribute_data|
      attribute_data.each do |key, value|
        if attribute == :players
         sizes << value[:shoe]
        end
        max_size = sizes.max 
        if attribute == :players && value[:shoe] == max_size
          return value[:rebounds]
        end
      end
    end
  end
end


def most_points_scored
  score = []
  max_score = 0
  game_hash.each do |location, location_data|
    location_data.each do |attribute, attribute_data|
      attribute_data.each do |key, value|
        if attribute == :players
         score << value[:points]
        end
        max_score = score.max 
        if attribute == :players && value[:points] == max_score
          return value[:player_name]
        end
      end
    end
  end
end


def winning_team
  score_away = []
  score_home = []
  total_score_home = 0
  total_score_away = 0
  game_hash.each do |location, location_data|
    case location
    when :home
      location_data.each do |attribute, attribute_data|
        attribute_data.each do |key, value|
         if attribute == :players
           score_home << value[:points]
        end
           total_score_home = score_home.inject(0) {|total, score| total + score}
        end
      end 
    else
      location_data.each do |attribute, attribute_data|
        attribute_data.each do |key, value|
         if attribute == :players
           score_away << value[:points]
        end
           total_score_away = score_away.inject(0) {|total, score| total + score}
        end
      end
    end
  end
  puts "Total score at home: #{total_score_home} & Total score away: #{total_score_away}"
end


