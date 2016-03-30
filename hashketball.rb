# Write your code here!
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["black", "white"],
      players: 
      {
        alan: {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        reggie: {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        brook: {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        mason: {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        jason: {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["turquoise", "purple"],
      players: 
      {
        jeff: {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        bismak: {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        desagna: {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        ben: {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        brendan: {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)
  hash = game_hash
  nameID = name.split(" ")[0].downcase
  if hash[:home][:players].any? {|idKey, value|idKey.to_s == nameID}
    return hash[:home][:players][nameID.to_sym][:points]
  elsif hash[:away][:players].any? {|idKey, value| idKey.to_s == nameID}
    return hash[:away][:players][nameID.to_sym][:points]
  end
end

def shoe_size(name)
  hash = game_hash
  nameID = name.split(" ")[0].downcase
  if hash[:home][:players].any? {|idKey, value|idKey.to_s == nameID}
    return hash[:home][:players][nameID.to_sym][:shoe]
  elsif hash[:away][:players].any? {|idKey, value| idKey.to_s == nameID}
    return hash[:away][:players][nameID.to_sym][:shoe]
  end
end

def team_colors(team_name)
  hash = game_hash
  if team_name == "Brooklyn Nets"
    hash[:home][:colors].collect {|color|
      color.capitalize
    }
  elsif team_name == "Charlotte Hornets"
    hash[:away][:colors].collect {|color|
      color.capitalize
    }
  end
end

def team_names
  hash = game_hash
  team_names = []
  hash.each {|team, attributes|
    attributes.each {|key, value|
      if key == :team_name
        team_names << value
      end
    }
  }
  team_names
end

def player_numbers(team_name)
  hash = game_hash
  player_numbers = []
  hash.each {|team, wtv|
    if hash[team][:team_name] == team_name
      hash[team][:players].each {|id, stats|
        player_numbers << stats[:number]
      }
    end
  }
  player_numbers
end

def player_stats(name)
  hash = game_hash
  nameID = name.split(" ")[0].downcase
  if hash[:home][:players].any? {|id, val| id == nameID.to_sym}
    hash[:home][:players][nameID.to_sym].delete_if {|stat| stat == :player_name}
  elsif hash[:away][:players].any? {|id, val| id == nameID.to_sym}
    hash[:away][:players][nameID.to_sym].delete_if {|stat| stat == :player_name}
  end
end

def big_shoe_rebounds
  hash = game_hash
  # initialize default value of biggest shoesize
  biggestShoeSize = 0
  hash.each {|team, teamdata|
    teamdata[:players].each {|id, stats|
      if biggestShoeSize == 0
        biggestShoeSize = stats[:shoe]
      else
        if biggestShoeSize < stats[:shoe]
          biggestShoeSize = stats[:shoe]
        end
      end
    }
  }
  thePlayer = []
  hash.each {|team, teamdata|
    thePlayer = teamdata[:players].find {|k, v|
      v[:shoe] == biggestShoeSize
    }
    if thePlayer != nil
      return thePlayer[1][:rebounds]
    end
  }

  thePlayer[1][:rebounds]
end



