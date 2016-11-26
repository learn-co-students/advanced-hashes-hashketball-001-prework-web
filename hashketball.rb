def game_hash 
  {
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
      colors: ["Turquoise", "Purple"],
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

def team_names
  names = []
  game_hash.each do |location, team_data|
    names << team_data[:team_name]
  end
  names
end

def big_shoe_rebounds
  name = biggest_shoe_player
  get_player_data(name, :rebounds)
end

def biggest_shoe_player
  bigshoe = 0
  name = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |playername, playerdata|
      if playerdata[:shoe] > bigshoe
        bigshoe = playerdata[:shoe]
        name = playername
      end
    end
  end
  name
end

def player_stats(name)
  pdata = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |playername, playerdata|
      if name == playername
        pdata = playerdata
      end
    end
  end
  pdata
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |playername, p_attribute|
        numbers << p_attribute[:number]
      end
    end
  end
  numbers
end

def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      colors = team_data[:colors]
    end
  end
  colors
end

def num_points_scored(name)
  get_player_data(name, :points)
end

def shoe_size(name)
  get_player_data(name, :shoe)
end

def get_player_data(name, p_attribute)
  x = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |playername, playerdata|
      if name == playername
        x = playerdata[p_attribute]
      end
    end
  end
  x
end