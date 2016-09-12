require 'pry'

# Write your code here!
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => "0",
          :shoe => "16",
          :points => "22",
          :rebounds => "12",
          :assists => "12",
          :steals => "3",
          :blocks => "1",
          :slam_dunks => "1"
        },
        "Reggie Evans" => {
          :number => "30",
          :shoe => "14",
          :points => "12",
          :rebounds => "12",
          :assists => "12",
          :steals => "12",
          :blocks => "12",
          :slam_dunks => "7"
        },
        "Brook Lopez" => {
          :number => "11",
          :shoe => "17",
          :points => "17",
          :rebounds => "19",
          :assists => "10",
          :steals => "3",
          :blocks => "1",
          :slam_dunks => "15"
        },
        "Mason Plumlee" => {
          :number => "1",
          :shoe => "19",
          :points => "26",
          :rebounds => "12",
          :assists => "6",
          :steals => "3",
          :blocks => "8",
          :slam_dunks => "5"
        },
        "Jason Terry" => {
          :number => "31",
          :shoe => "15",
          :points => "19",
          :rebounds => "2",
          :assists => "2",
          :steals => "4",
          :blocks => "11",
          :slam_dunks => "1"
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => "4",
          :shoe => "18",
          :points => "10",
          :rebounds => "1",
          :assists => "1",
          :steals => "2",
          :blocks => "7",
          :slam_dunks => "2"
        },
        "Bismak Biyombo" => {
          :number => "0",
          :shoe => "16",
          :points => "12",
          :rebounds => "4",
          :assists => "7",
          :steals => "7",
          :blocks => "15",
          :slam_dunks => "10"
        },
        "DeSagna Diop" => {
          :number => "2",
          :shoe => "14",
          :points => "24",
          :rebounds => "12",
          :assists => "12",
          :steals => "4",
          :blocks => "5",
          :slam_dunks => "5"
        },
        "Ben Gordon" => {
          :number => "8",
          :shoe => "15",
          :points => "33",
          :rebounds => "3",
          :assists => "2",
          :steals => "1",
          :blocks => "1",
          :slam_dunks => "0"
        },
        "Brendan Haywood" => {
          :number => "33",
          :shoe => "15",
          :points => "6",
          :rebounds => "12",
          :assists => "12",
          :steals => "22",
          :blocks => "5",
          :slam_dunks => "12"
        }
      }
    }
  }
end

def num_points_scored(str)
  points = nil
  game_hash.each do |location, team_data|
    team_data.each do |team_attribute, detail|
       if team_attribute == :players
         detail.each do |name, stats|
           if name == str
             points = stats[:points].to_i
           end
         end
       end
    end
  end
  points
end

def shoe_size(str)
  shoe_size = nil
  game_hash.each do |location, team_data|
    team_data.each do |team_attribute, detail|
       if team_attribute == :players
         detail.each do |name, stats|
           if name == str
             shoe_size = stats[:shoe].to_i
           end
         end
       end
    end
  end
  shoe_size
end

def team_colors(str)
  colors = nil
  game_hash.each do |location, team_data|
    team_data.each do |team_attribute, detail|
       if detail == str
         colors = team_data[:colors]
       end
    end
  end
  colors
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    team_data.each do |data, detail|
      if data == :team_name
        names << detail
      end
    end
  end
  names
end

def player_numbers(str)
  numbers = []
  game_hash.each do |location, team_details|
     if team_details[:team_name] == str
       team_details.each do |team_attribute, attribute_value|
         if team_attribute == :players
           attribute_value.each do |name, stats|
             numbers << stats[:number].to_i
           end
         end
       end
     end
   end
   numbers.sort
 end

 def player_stats(str)
 	stats = {}
 	game_hash.each do |location, team_details|
 		team_details.each do |team_attribute, attribute_detail|
 			if team_attribute == :players
 				attribute_detail.each do |name, player_details|
 					if name == str
 						player_details.each do |key, value|
 							stats[key] = value.to_i
 						end
 					end
 				end
 			end
 		end
 	end
 	stats
 end

 def big_shoe_rebouds
 	biggest_shoe = 0
 	rebounds = 12
 	game_hash.each do |location, team_details|
 		location.each do |team_attribute, attribute_detail|
 			if team_attribute == :players
 				attribute_detail.each do |name, stats|
 					if stats[:shoe] > biggest_shoe
 						stats[:rebounds] = rebounds
 					end
 				end
 			end
 		end
 	end
 end
