require 'pry'

def game_hash
  {:home => {
    :team_name => "Brooklyn Nets",
    :colors =>["Black","White"],
    :players =>{
      :alan_stats =>
        {
        :name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      :reggie_stats =>
        {
        :name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      :brook_stats =>
        {
        :name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      :mason_stats =>
        {
        :name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      :jason_stats =>
        {
        :name => "Jason Terry",
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
    :colors =>["Turquoise","Purple"],
    :players =>{
      :jeff_stats =>
        {
        :name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      :bismak_stats =>
        {
        :name => "Bismak Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      :desagna_stats =>
        {
        :name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      :ben_stats =>
        {
        :name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      :brendan_stats =>
        {
        :name => "Brendan Haywood",
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

def num_points_scored(name)
  points_scored = nil
  game_hash.each do |location,item|
    item[:players].each do |player,player_hash|
      if player_hash[:name] == name
        points_scored = player_hash[:points]
      end
    end
  end
  points_scored
end

def shoe_size(name)
  shoe = nil
  game_hash.each do |location,item|
    item[:players].each do |player,player_hash|
      if player_hash[:name] == name
        shoe = player_hash[:shoe]
      end
    end
  end
  shoe
end

def team_colors(team_name)
  colors = []
  game_hash.each do |location,item|
    if item[:team_name] == team_name
      colors << item[:colors]
    end
  end
  colors.flatten
end

def team_names
  names = []
  game_hash.each do |location,item|
    names << item[:team_name]
  end
  names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, item|
    if item[:team_name] == team_name
      item[:players].each do |player,player_hash|
        numbers << player_hash[:number]
      end
    end
  end
  numbers
end

def player_stats(name)
  stat_hash = {}
  game_hash.each do |location,item|
    item[:players].each do |player,player_hash|
      if player_hash[:name] == name
        stat_hash = player_hash
      end
    end
  end
  stat_hash.delete_if {|cat, value| cat == :name}
end

def big_shoe_rebounds
  max_player = nil
  game_hash.each do |location,item|
    item[:players].each do |player, player_hash|
      max_player = player_hash
      max_player = player_hash if player_hash[:shoe] > max_player[:shoe]
    end
  end
  max_player[:rebounds]
end










