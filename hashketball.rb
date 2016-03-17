# Write your code here!
def game_hash
  hash = {
    :home =>
      {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => {
          "Alan Anderson" =>
          {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
            },
          "Reggie Evans" =>
            {
              :number => 30,
              :shoe => 14,
              :points => 12,
              :rebounds => 12,
              :assists => 12,
              :steals => 12,
              :blocks => 12,
              :slam_dunks => 7
              },
          "Brook Lopez" =>
            {
              :number => 11,
              :shoe => 17,
              :points => 17,
              :rebounds => 19,
              :assists => 10,
              :steals => 3,
              :blocks => 1,
              :slam_dunks => 15
              },
          "Mason Plumlee" =>
            {
              :number => 1,
              :shoe => 19,
              :points => 26,
              :rebounds => 12,
              :assists => 6,
              :steals => 3,
              :blocks => 8,
              :slam_dunks => 5
              },
          "Jason Terry" =>
            {
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
    :away =>
      {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players =>
          {
          "Jeff Adrien" =>
          {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
            },
          "Bismak Biyombo" =>
            {
              :number => 0,
              :shoe => 16,
              :points => 12,
              :rebounds => 4,
              :assists => 7,
              :steals => 7,
              :blocks => 15,
              :slam_dunks => 10
              },
          "DeSagna Diop" =>
            {
              :number => 2,
              :shoe => 14,
              :points => 24,
              :rebounds => 12,
              :assists => 12,
              :steals => 4,
              :blocks => 5,
              :slam_dunks => 5
              },
          "Ben Gordon" =>
            {
              :number => 8,
              :shoe => 15,
              :points => 33,
              :rebounds => 3,
              :assists => 2,
              :steals => 1,
              :blocks => 1,
              :slam_dunks => 0
              },
          "Brendan Haywood" =>
            {
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

def num_points_scored(player)
  game = game_hash

  game.each do |team, properties|
    if game[team][:players][player]
        return game[team][:players][player][:points]
    end
  end
end

def shoe_size(player)
  game_hash.each do |team, properties|
    if game_hash[team][:players][player]
      size = game_hash[team][:players][player][:shoe]
      return size
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, properties|
    if game_hash[team][:team_name][team_name]
      return game_hash[team][:colors]
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |team, properties|
    team_names << game_hash[team][:team_name]
  end
  team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |team, properties|
      if game_hash[team][:team_name] == team_name
        game_hash[team][:players].each do |player, stats|
        number = game_hash[team][:players][player][:number]
        jersey_numbers << number
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  return_stats = {}
  game_hash.each do |team, properties|
    game_hash[team][:players].each do |player, stats|
      if player == player_name
        return_stats = stats
      end
    end
  end
  return_stats
end

def big_shoe_rebounds
  largest_shoe_size = 0
  largest_shoe_player = ""
  rebounds = 0
  game_hash.each do |team, properties|
    game_hash[team][:players].each do |player, stats|
      if game_hash[team][:players][player][:shoe] > largest_shoe_size
        largest_shoe_size = game_hash[team][:players][player][:shoe]
        largest_shoe_player = player
        rebounds = game_hash[team][:players][player][:rebounds]
      end
    end
  end
  rebounds
end




