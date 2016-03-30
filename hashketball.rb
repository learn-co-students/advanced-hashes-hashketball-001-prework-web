# Write your code here!
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          num_points_scored: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          num_points_scored: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          num_points_scored: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          num_points_scored: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          num_points_scored: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          num_points_scored: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          num_points_scored: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          num_points_scored: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          num_points_scored: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          num_points_scored: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored(player)
  points = 0
  game_hash.each do |team,data|
    data[:players].each do |p|
      if p.values.include?(player)
        points = p[:num_points_scored]
      end
    end
  end
  points
end

def shoe_size(player)
  shoe = 0
  game_hash.each do |team, data|
    data[:players].each do |p|
      if p.values.include?(player)
        shoe = p[:shoe]
      end
    end
  end
  shoe
end

def team_colors(team)
  colors = ""
  game_hash.each do |t,d|
    if d[:team_name] == team
      colors = d[:colors]
    end
  end
  colors
end

def team_names
    game_hash.map do |t,d|
          d[:team_name]
            end
end

def player_numbers(team)
  jerseys = []
  game_hash.each do |t,d|
    if d[:team_name] == team
      d[:players].each do |p|
        p.each do |k,v|
          if k == :number
            jerseys << v
          end
        end
      end
    end
  end
  jerseys
end

def player_stats(player)
  result = {}
  game_hash.each do |t,d|
    d[:players].each do |p|
      if p.values.include?(player)
        p.delete_if { |k,v| k == :player_name }
        p[:points] = p[:num_points_scored]
        p.delete_if { |k,v| k == :num_points_scored }
        result = p
      end
    end
  end
  result
end

def shoes
  new = {}
  game_hash.each do |t,d|
    d[:players].each do |p|
      name = p[:player_name]
      shoe = p[:shoe]
      new[name] = shoe
    end
  end
  new
end

def big_shoe_rebounds
  player = shoes.sort_by {|k,v| v}.last[0]
  player_stats(player)[:rebounds]
end
