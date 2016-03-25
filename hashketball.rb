# Write your code here!

def game_hash
game_hash =
    {
:home => {
  :team_name => "Brooklyn Nets",
  :colors => ["Black", "White"],
  :players => {
    :"Alan Anderson" =>{
      :player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals =>3,
      :blocks => 1,
      :slam_dunks =>1
      },
    :"Reggie Evans" =>{
      :player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
    :"Brook Lopez" =>{
      :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks =>1,
      :slam_dunks => 15
      },
    :"Mason Plumlee" =>{
      :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
    :"Jason Terry" =>{
      :player_name => "Jason Terry",
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
    :"Jeff Adrien" => {
      :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
    :"Bismak Biyombo" => {
      :player_name => "Bismak Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
    :"DeSagna Diop" => {
      :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
    :"Ben Gordon" => {
      :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
    :"Brendan Haywood" => {
      :player_name => "Brendan Haywood",
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

def num_points_scored(player_name)
  values = []
game_hash.each do |location, teaminfo|
  teaminfo.each do |namecolorplayer, info|
    if info.class == Hash

      info.each do |playername, stats|
        if playername = player_name
          values.push(stats.values)
        end
      end
      else
    end
  end
end
values
values.each do |x|
  if x.include?(player_name) == true
    return x[3]
  end
end
end

def shoe_size(player_name)
  values = []
game_hash.each do |location, teaminfo|
  teaminfo.each do |namecolorplayer, info|
    if info.class == Hash

      info.each do |playername, stats|
        if playername = player_name
          values.push(stats.values)
        end
      end
      else
    end
  end
end
values.each do |x|
  if x.include?(player_name) == true
    return x[2]
  end
end
end

def team_colors(team_name)
  colorsarray = []
  teamarray = []
game_hash.each do |location, teaminfo|
  teaminfo.each do |namecolorplayer, info|
    if info.class == Array
       colorsarray.push(info)
      colorsarray
    end
    if info.class == String
      teamarray.push(info)
      teamarray
    end
 end
end
teamarray.each do |name|
  if name == team_name
    indexx = teamarray.find_index(name)
    return colorsarray[indexx]
  end
end
end

def team_names
  teamarray = []
game_hash.each do |location, teaminfo|
  teaminfo.each do |namecolorplayer, info|
    if info.class == String
      teamarray.push(info)
      teamarray
    end
 end
end
teamarray
end

def player_numbers(team_name)
 values = []
game_hash.each do |location, teaminfo|
  teaminfo.each do |namecolorplayer, info|
    if info.class == Hash
      info.each do |x, y|
        y.each do |key, value|
          if key ==:number
            values.push(value)
          end
        end
      end
    end
  end
end
netsnumbers = []
netsnumbers.push(values[0..4]).flatten!
hornetsnumbers = []
hornetsnumbers.push(values[5..9]).flatten!
if team_name == "Brooklyn Nets"
  netsnumbers
   elsif team_name == "Charlotte Hornets"
  hornetsnumbers
end
end

def player_stats(player_name)
names = []
stats = []

game_hash.each do |location, teaminfo|
  teaminfo.each do |namecolorplayer, info|
    if info.class == Hash
      names.push(info.keys)
      stats.push(info.values)
    end
  end
end
names.flatten!
names.collect! do |x|
  x.to_s
end
newstats = []
stats.each do |hashofstats|
  hashofstats.each do |x|
   newstats.push(x.delete_if {|key, value| key == :player_name})
 end
end
names.each do |name|
  if name == player_name
    indexx = names.find_index(name)
    return newstats[indexx]
    else
  end
end
end

def big_shoe_rebounds
shoesizesarray = []
reboundsarray = []

game_hash.each do |location, teaminfo|
  teaminfo.each do |teamcolorplayer, values|
    if values.class == Hash
      values.each do |x,y|
        y.each do |key, value|
          if key == :shoe
            shoesizesarray.push(value)
          end
          if key == :rebounds
            reboundsarray.push(value)
          end
        end
      end
    end
  end
end
biggestshoe = shoesizesarray.max
indexx = shoesizesarray.find_index(biggestshoe)
return reboundsarray[indexx]
end











