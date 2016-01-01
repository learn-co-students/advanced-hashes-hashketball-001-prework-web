
def game_hash
game_hash = {
            home: {
              team_name: "Brooklyn Nets",
              colors: ["Black", "White"],
              players: {
                player_name: ["Alan Anderson", "Reggie Evans", "Brook Lopez",
                              "Mason Plumlee", "Jason Terry"],
                number: [0, 30, 11, 1, 31],
                shoe: [16, 14, 17, 19, 15],
                points: [22, 12, 17, 26, 19],
                rebounds: [12, 12, 19, 12, 2],
                assists: [12, 12, 10, 6, 2],
                steals: [3, 12, 3, 3, 4],
                blocks: [1, 12, 1, 8, 11],
                slam_dunks: [1, 7, 15, 5, 1]
              }
            },

            away: {
              team_name: "Charlotte Hornets",
              colors: ["Turquoise", "Purple"],
              players: {
                player_name: ["Jeff Adrien", "Bismak Biyombo",
                              "DeSagna Diop", "Ben Gordon", "Brendan Haywood"],
                number: [4, 0, 2, 8, 33],
                shoe: [18, 16, 14, 15, 15],
                points: [10, 12, 24, 33, 6],
                rebounds: [1, 4, 12, 3, 12],
                assists: [1, 7, 12, 2, 12],
                steals: [2, 7, 4, 1, 22],
                blocks: [7, 15, 5, 1, 5],
                slam_dunks: [2, 10, 5, 0, 12],
              }
            }
}


end


def num_points_scored(player)
  hash = game_hash

  if hash[:home][:players][:player_name].include?(player)
    hash[:home][:players][:points][(hash[:home][:players][:player_name].index(player))]
  elsif hash[:away][:players][:player_name].include?(player)
    hash[:away][:players][:points][(hash[:away][:players][:player_name].index(player))]
  end

end

def shoe_size(player)
  hash = game_hash

  if hash[:home][:players][:player_name].include?(player)
    hash[:home][:players][:shoe][(hash[:home][:players][:player_name].index(player))]
  elsif hash[:away][:players][:player_name].include?(player)
    hash[:away][:players][:shoe][(hash[:away][:players][:player_name].index(player))]
  end

end

def team_colors(team)
  hash = game_hash

  if hash[:home][:team_name] == team
    hash[:home][:colors].map {|i| i.capitalize}
  elsif hash[:away][:team_name] == team
    hash[:away][:colors].map {|i| i.capitalize}
  end

end


def team_names
teams = [game_hash[:home][:team_name], game_hash[:home][:team_name]]
end

def player_numbers(team)

  if game_hash[:home][:team_name] == team
    game_hash[:home][:players][:number]
  elsif game_hash[:away][:team_name] == team
    game_hash[:away][:players][:number]
  end

end


def player_stats(player)
  stat_hash = {}

  idx = 0
  if game_hash[:home][:players][:player_name].include?(player)
    idx = (game_hash[:home][:players][:player_name].index(player))
    stat_hash[:number] = game_hash[:home][:players][:number][idx]
    stat_hash[:shoe] = game_hash[:home][:players][:shoe][idx]
    stat_hash[:points] = game_hash[:home][:players][:points][idx]
    stat_hash[:rebounds] = game_hash[:home][:players][:rebounds][idx]
    stat_hash[:assists] = game_hash[:home][:players][:assists][idx]
    stat_hash[:steals] = game_hash[:home][:players][:steals][idx]
    stat_hash[:blocks] = game_hash[:home][:players][:blocks][idx]
    stat_hash[:slam_dunks] = game_hash[:home][:players][:slam_dunks][idx]
  elsif game_hash[:away][:players][:player_name].include?(player)
    idx = (game_hash[:away][:players][:player_name].index(player))
    stat_hash[:number] = game_hash[:away][:players][:number][idx]
    stat_hash[:shoe] = game_hash[:away][:players][:shoe][idx]
    stat_hash[:points] = game_hash[:away][:players][:points][idx]
    stat_hash[:rebounds] = game_hash[:away][:players][:rebounds][idx]
    stat_hash[:assists] = game_hash[:away][:players][:assists][idx]
    stat_hash[:steals] = game_hash[:away][:players][:steals][idx]
    stat_hash[:blocks] = game_hash[:away][:players][:blocks][idx]
    stat_hash[:slam_dunks] = game_hash[:away][:players][:slam_dunks][idx]
  end

  stat_hash
end

def big_shoe_rebounds

  home_shoes = game_hash[:home][:players][:shoe]
  away_shoes = game_hash[:away][:players][:shoe]


  if home_shoes.max > away_shoes.max
    game_hash[:home][:players][:rebounds][home_shoes.index(home_shoes.max)]
  else
    game_hash[:away][:players][:rebounds][away_shoes.index(away_shoes.max)]
  end

end

