require "pry"

def game_hash
game_hash = {
    :home => {
      :team_name => ["Brooklyn Nets"],
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" =>  {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" =>  {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals =>  3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" =>  {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" =>  {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        },
      },
    },
    :away => {
      :team_name => ["Charlotte Hornets"],
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" =>  {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" =>  {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" =>  {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals =>  4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" =>  {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" =>  {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals =>22,
          :blocks => 5,
          :slam_dunks => 12
      }
    }
  }
}
end

def num_points_scored(name)
  player = []
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
          data.each do |x, y|
              if x == name
                  return y[:points]
              end
          end
      end
  end
end

def shoe_size(name)
  player = []
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
          data.each do |x, y|
              if x == name
                  return y[:shoe]
              end
          end
      end
  end
end

def team_colors(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
        if data == [name]
          shit = []
          shit = game_hash[location][:colors]
          return shit
      end
    end
  end
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        shit = game_hash[location][attribute][0]
        names.push(shit)
      end
    end
  end
  return names
end

def player_numbers(name)
  numbers = []
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      data.collect do |x, y|
      if x == name
        t = game_hash[location][:players]
        t.each do |i, j|
          numbers.push(j[:number])
        end
      end
      end
    end
  end
  return numbers
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      data.each do |x, y|
        if x == name
          return game_hash[location][attribute][x]
        end
      end
    end
  end
end
#
# def big_shoe_rebounds
#   game_hash.each do |location, team_data|
#     team_data.each do |attribute, data|
#       data.each do |x, y|
#         if
#     #    y.each do |f, c|
#     #    binding.pry
#   #    end
#       end
#     end
#   end
# end
#big_shoe_rebounds

def big_shoe_rebounds
    players = []
    shoe_sizes = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |x, y|
                    players.push(x)
                    shoe_sizes.push(data[x][:shoe])
                end
            end
        end
    end
    #this gives you the index of the max value
    max = shoe_sizes.each_with_index.max[1]
    f = players[max]
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        data.each do |x, y|
          if x == f
            return y[:rebounds]
          end
        end
      end
    end
end
