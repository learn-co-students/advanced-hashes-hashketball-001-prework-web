require 'pry'

# Write your code here!
def game_hash 
  {home: 
    {team_name: "Brooklyn Nets", colors: ["Black", "White"], 
      players: {:AlanAnderson=> 
        {player_name: "Alan Anderson", number: "0", shoe: "16", points: "22", 
          rebounds: "12", assists: "12", steals: "3", blocks: "1", slam_dunks: "1"}, 
          :ReggieEvans=> {player_name: "Reggie Evans", number: "30", shoe: "14", points: "12", 
          rebounds: "12", assists: "12", steals: "12", blocks: "12", slam_dunks: "7"}, 
          :BrookLopez=> {player_name: "Brook Lopez", number: "11", shoe: "17", points: "17", 
          rebounds: "19", assists: "10", steals: "3", blocks: "1", slam_dunks: "15"},
          :MasonPlumlee=> {player_name: "Mason Plumlee", number: "1", shoe: "19", points: "26", 
          rebounds: "12", assists: "6", steals: "3", blocks: "8", slam_dunks: "5"},
          :JasonTerry=> {player_name: "Jason Terry", number: "31", shoe: "15", points: "19", 
          rebounds: "2", assists: "2", steals: "4", blocks: "11", slam_dunks: "1"}
          }}, 
away: 
    {team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"], 
      players: {:JeffAdrien=> 
        {player_name: "Jeff Adrien", number: "4", shoe: "18", points: "10", 
          rebounds: "1", assists: "1", steals: "2", blocks: "7", slam_dunks: "2"}, 
          :BismakBiyombo=> {player_name: "Bismak Biyombo", number: "0", shoe: "16", points: "12", 
          rebounds: "4", assists: "7", steals: "7", blocks: "15", slam_dunks: "10"}, 
          :DeSagnaDiop=> {player_name: "DeSagna Diop", number: "2", shoe: "14", points: "24", 
          rebounds: "12", assists: "12", steals: "4", blocks: "5", slam_dunks: "5"},
          :BenGordon=> {player_name: "Ben Gordon", number: "8", shoe: "15", points: "33", 
          rebounds: "3", assists: "2", steals: "1", blocks: "1", slam_dunks: "0"},
          :BrendanHaywood=> {player_name: "Brendan Haywood", number: "33", shoe: "15", points: "6", 
          rebounds: "12", assists: "12", steals: "22", blocks: "5", slam_dunks: "12"}
          }}}

end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |dude, info|
      if info[:player_name] == name
      return info[:points].to_i
end
end
end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |dude, info|
      if info[:player_name] == name
      return info[:shoe].to_i
end
end
end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    team_data.each do |datapoint, data|
      if data == team
        return team_data[:colors]
      end
    end
  end
end

def team_names
  teamnames=[]
  game_hash.each do |location, team_data|
    team_data.each do |datapoint, data|
      if datapoint == :team_name
teamnames << data
end
end
end
return teamnames
end

def player_numbers(name)
  jerseynums=[]
  game_hash.each do |location, team_data|
    team_data.each do |datapoint, data|
      if data == name 
        team_data[:players].each do |dude, info|
         jerseynums << info[:number].to_i
end
end
end
end
return jerseynums
end

def player_stats(name)
  stats = {}
  statsintegers={}
  game_hash.each do |location, team_data|
    team_data[:players].each do |players, info|
        info.each do |category, value|
            if value == name 
              info.each do |category, value|
                stats[category] = value 
              end
            end
        end
      end
    end
    stats.delete_if do |key, val|
      val == name 
    end
    stats.each do |key, val|
     statsintegers[key] = val.to_i
    end
  return statsintegers 
end

def largest_shoe_size
  shoes = {}
  shoesize=0
  largestshoesbelongto = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, info|
      shoes[info[:player_name]] = info[:shoe]
    end
  end
  shoes.each do |key, val|
if val.to_i > shoesize 
  shoesize=val.to_i
  largestshoesbelongto.unshift(key) 
end
end
return largestshoesbelongto[0]
end

def big_shoe_rebounds 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, info|
      if info[:player_name] == largest_shoe_size
        return info[:rebounds].to_i
      end
    end
  end
end

    
