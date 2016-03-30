# Write your code here!
def game_hash
  game_hash={
    home: {
      team_name: "Brooklyn Nets", 
      colors: ["Black", "White"], 
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1},

        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7},

        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15},

        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5},

        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1},
      }
    },
    away: {
      team_name: "Charlotte Hornets", 
      colors: ["Turquoise", "Purple"], 
      players: {
        "Jeff Adrien"=> {      
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2},

        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10},

        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5},

        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0},

          "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12},
      }
    }
  }
end

def num_points_scored(player)
  if game_hash[:away][:players].include?player
    game_hash[:away][:players][player][:points]
  elsif game_hash[:home][:players].include?player
    game_hash[:home][:players][player][:points]
  end
end

def shoe_size(player)
  if game_hash[:away][:players].include?player
    game_hash[:away][:players][player][:shoe]
  elsif game_hash[:home][:players].include?player
    game_hash[:home][:players][player][:shoe]
  end
end

def team_colors(team)
  if game_hash[:home][:team_name].include?team
    game_hash[:home][:colors]
  elsif game_hash[:away][:team_name].include?team
    game_hash[:away][:colors]   
  end
end

def team_names
  a=[]
  a<<game_hash[:home][:team_name]
  a<<game_hash[:away][:team_name]
end

def player_numbers(team)
  b=[]
  c=[]
  if game_hash[:home][:team_name].include?team 
    game_hash[:home][:players].each do |name,stat|
        stat.each do |cat,num|
          if cat==:number
            b<<num
         end
       end
     end
    b
  elsif game_hash[:away][:team_name].include?team 
    game_hash[:away][:players].each do |name,stat|
      stat.each do |cat,num|
         if cat==:number
         c<<num
         end
       end
     end 
     c
   end
end

def player_stats(player)
  if game_hash[:away][:players].include?player  
    game_hash[:away][:players][player]
  elsif game_hash[:home][:players].include?player 
    game_hash[:home][:players][player]
  end
end

def big_shoe_rebounds
  num = 0
  play_name = nil
  game_hash[:home][:players].each do |name,stat|
    stat.each do |cat, val|
      if cat == :shoe && val > num
        num = val
        play_name = name
      end
    end
  end
  game_hash[:home][:players][play_name][:rebounds] 
end

def most_points_scored
  num = 0
  play_name = nil
  game_hash[:home][:players].each do |name,stat|
    stat.each do |cat, val|
      if cat == :points && val > num
        num = val
        play_name = name
      end
    end
  end
  game_hash[:away][:players].each do |name,stat|
    stat.each do |cat, val|
      if cat == :points && val > num
        num = val
        play_name = name
      end
    end
  end
  play_name
end

def winning_team
  awy_pnts = 0
  hme_pnts = 0
  game_hash[:home][:players].each do |plyr, stat|
    game_hash[:home][:players][plyr].each do |cat, int|
      if cat == :points
        hme_pnts += int
      end
    end
  end 
  game_hash[:away][:players].each do |plyr, stat|
    game_hash[:away][:players][plyr].each do |cat, int|
      if cat == :points
        awy_pnts += int
      end
    end
  end 
  if hme_pnts > awy_pnts
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]    
  end
end  

def player_with_longest_name
  name_length = 0
  ply_name = nil
  game_hash[:home][:players].each do |plyr, stat|
    if plyr.length > name_length
      name_length = plyr.length
      ply_name = plyr 
    end
  end 
  game_hash[:away][:players].each do |plyr, stat|
    if plyr.length > name_length
      name_length = plyr.length
      ply_name = plyr 
    end
  end 
  ply_name
end  

def long_name_steals_a_ton?
  if game_hash[:away][:players][player_with_longest_name][:steals] > 10
    true 
  elsif game_hash[:home][:players][player_with_longest_name][:steals] > 10
    true
  end 
end


