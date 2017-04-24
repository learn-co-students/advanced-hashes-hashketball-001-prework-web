require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players: {
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
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
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
      colors: ["Turquoise","Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
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
  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      data.each { |player, stats|
        return stats[:points] if player == name
      } if attribute == :players
    }
  }
end

def shoe_size(name)
  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      data.each { |player, stats|
        return stats[:shoe] if player == name
      } if attribute == :players
    }
  }
end

def team_colors(team)
  game_hash.each { |location, team_data |
      return team_data[:colors] if team_data[:team_name] == team
  }
end

def team_names()
  game_hash.collect { |location, team_data|
    team_data[:team_name]
  }
end

def player_numbers(team)
  player_numbers = []

  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      data.each { |player, stats|
        player_numbers << stats[:number]
      } if attribute == :players
    } if team_data[:team_name] == team
  }

  player_numbers
end

def player_stats(name)
  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      data.each { |player, stats|
        return stats if player == name
      } if attribute == :players
    }
  }
end

def big_shoe_rebounds
  biggest_size = 0
  big_shoe_rebounds = 0

  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      data.each { |player, stats|
        if stats[:shoe] > biggest_size
          big_shoe_rebounds = stats[:rebounds]
          biggest_size = stats[:shoe]
        end
      } if attribute == :players
    }
  }

  big_shoe_rebounds
end


