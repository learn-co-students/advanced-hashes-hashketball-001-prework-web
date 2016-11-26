require 'pry'
# Write your code here!
def game_hash 
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans"=>{
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez"=>{
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee"=>{
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry"=>{
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        } 
      } #players
    }, # home
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien"=>{
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo"=>{
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop"=>{
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon"=>{
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood"=>{
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      } #players
    } #away
  }
end

def num_points_scored(name)
  game_hash.each_key do |team|
      game_hash[team][:players].each do |player, val|
      return val[:points] if player == name
    end
  end
  "whoops"
end

def shoe_size(name)
  game_hash.each_key do |team|
      game_hash[team][:players].each do |player, val|
      return val[:shoe] if player == name
    end
  end
  "whoops"
end

def team_colors(team)
  game_hash.each_key do |t|
    return game_hash[t][:colors] if game_hash[t][:team_name] == team
  end
end

def team_names
  names = [] 
  game_hash.each_key do |team|
    names << game_hash[team][:team_name]
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each_key do |t|
    #binding.pry
    if game_hash[t][:team_name] == team
      #binding.pry
      game_hash[t][:players].each do |player, data|
        #binding.pry
        numbers << game_hash[t][:players][player][:number]
        #binding.pry
      end
    end
  end
  numbers
end

def player_stats(player)
  game_hash.each_key do |team|
    #binding.pry
    game_hash[team][:players].each do |p, data|
      #binding.pry
      return data if p == player
    end
  end
  'whoops'
end

def big_shoe_rebounds
  plyr_w_biggest = ""
  big_size = 0
  game_hash.each_key do |team|
    game_hash[team][:players].each do |plyr, data|
      plyr_w_biggest, big_size = plyr, data[:shoe] if data[:shoe] > big_size
    end
  end
   game_hash.each_key do |team|
      game_hash[team][:players].each do |player, val|
      return val[:rebounds] if player == plyr_w_biggest
    end
  end
end
