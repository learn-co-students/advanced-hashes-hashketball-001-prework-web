require 'pry'
def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ['Black','White'],
      players: {
              "Alan Anderson" =>{
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks:1
              },
              "Reggie Evans" => {
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7
              },
              "Brook Lopez" =>{
                number: 11,
                shoe:17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15
              },
              "Mason Plumlee" =>{
                number: 1,
                shoe:19,
                points: 26,
                rebounds: 12,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5
              },
              "Jason Terry" =>{
                number: 31,
                shoe:15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1
              }
      }
    },
    away:{
      team_name: "Charlotte Hornets",
      colors: ['Turquoise','Purple'],
      players: {
        "Jeff Adrien" =>{
          number: 4,
          shoe:18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" =>{
          number: 0,
          shoe:16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" =>{
          number: 2,
          shoe:14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" =>{
          number: 8,
          shoe:15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },        
        "Brendan Haywood" =>{
          number: 33,
          shoe:15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        },   
      }
    }
  }
end 

def num_points_scored(player_name)
  game_hash.each do |location,data|
    data.each do |keys,values|
      if values.is_a?(Hash)
        values.each do |key,value|
          if key == player_name
            return value[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location,data|
    data.each do |keys,values|
      if values.is_a?(Hash)
        values.each do |key,value|
          if key == player_name
            return value[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location,data|
    if data[:team_name] == team
        return data[:colors]
    end
  end
end

def team_names
  collection = []
  game_hash.each do |location,data|
    collection << data[:team_name]
    end
  collection
end

def player_numbers(teams)
  collection = []
  game_hash.each do |location,data|
    if data[:team_name] == teams
      data.each do |key,values|
      if values.is_a?(Hash)
          values.each do |key,value|
            collection << value[:number]
          end
        end
      end
    end
  end
  collection.sort
end

def player_stats(player_name)
  game_hash.each do |location,data|
    data.each do |key,value|
      if value.is_a?(Hash)
        value.each do |name,stat|
          if name == player_name
            return stat
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = 0
  rebound = 0
 game_hash.each do |location,data|
    data.each do |key,value|
      if value.is_a?(Hash)
        value.each do |name,stat|
          if big_shoe < stat[:shoe]
            big_shoe = stat[:shoe]
            rebound = stat[:rebounds]
          end
        end
      end
    end
  end
  rebound
end

p big_shoe_rebounds

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
 
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         attribute.each do |data_item|
#             binding.pry
#             'yes'
#       end
#     end
#   end
# end





