require 'pry'
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        alan_anderson: {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists:12,
          steals:3,
          blocks:1,
          slam_dunks:1
          },

        reggie_evans: {
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

        brook_lopez: {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals:3,
          blocks:1,
          slam_dunks:15
          },

        mason_plumlee: {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists:6,
          steals:3,
          blocks:8,
          slam_dunks:5
          },

        jason_terry: {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists:2,
          steals:4,
          blocks:11,
          slam_dunks:1
        }
      }
    },

   away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {

        jeff_adrien: {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists:1,
          steals:2,
          blocks:7,
          slam_dunks:2
          },

        bismak_biyombo: {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists:7,
          steals:7,
          blocks:15,
          slam_dunks:10
        },

        desagna_diop: {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists:12,
          steals:4,
          blocks:5,
          slam_dunks:5,
          },

        ben_gordon: {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists:2,
          steals:1,
          blocks:1,
          slam_dunks:0
          },

        brendan_haywood: {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists:12,
          steals:22,
          blocks:5,
          slam_dunks:12
        }
      }
    }
  }
end




def num_points_scored(player_name)
  player_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |key_name, stats|
          stats.each do |key, value|
            if key == :player_name && value == player_name
              player_points = stats[:points]
            end
          end
        end
      end
    end
  end
  player_points
end

def shoe_size(player_name)
  points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |key_name, stats|
          stats.each do |key, value|
            if key == :player_name && value == player_name
              points = stats[:shoe]
            end
          end
        end
      end
    end
  end
  points
end

def team_colors(team_name)
  points = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:colors].each do |x|
        points << x
      end
    end
  end
  points
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_names << data
      end
    end
  end
  team_names
end

def player_numbers(player_name)
  points = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == player_name
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |key_name, stats|
            stats.each do |key, value|
              if key == :number
                points << value.to_i
              end
            end
          end
        end
      end
    end
  end
  points
end

def player_stats(player_name)
  points = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |key_name, stats|
          stats.each do |key, value|
            if key == :player_name && value == player_name
              points = stats.delete_if do |k, v|
                k == :player_name
              end
            end
          end
        end
      end
    end
  end
  points
end

def big_shoe_rebounds

home = game_hash[:home][:players]
away = game_hash[:away][:players]
both_teams = home.merge(away)

big_shoe = both_teams.collect do |key, value|
  value[:shoe]
  end.max 
    both_teams.each do |key, value|
  if value[:shoe] == big_shoe
    return value[:rebounds]
    end
  end
end


##bonus

def most_points_scored

end

def winning_team

end

def player_with_longest_name

end

def most_steals

end


def long_name_steals_a_ton?

end











