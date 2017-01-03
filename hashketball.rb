require 'pry'
require 'pry-nav'

def game_hash
  game = {}
  
  game[:home] = {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: []
  }
  game[:away] = {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: []    
  }
  
    alan_anderson = {
    "Alan Anderson" => {
      :player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :num_points_scored => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
    }
  }
  
    reggie_evans = {
    "Reggie Evans" => {
      :player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :num_points_scored => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
    }
  }
  
    brook_lopez = {
    "Brook Lopez" => {
      :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :num_points_scored => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
    }
  }
  
    mason_plumlee = {
    "Mason Plumlee" => {
      :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :num_points_scored => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
    }
  }
  
    jason_terry = {
    "Jason Terry" => {
      :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :num_points_scored => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
    }
  }
  
    jeff_adrien = {
    "Jeff Adrien" => {
      :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :num_points_scored => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
    }
  }
  
    bismak_biyombo = {
    "Bismak Biyombo" => {
      :player_name => "Bismak Biyombo",
      :number => 0,
      :shoe => 16,
      :num_points_scored => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
    }
  }
  
    desagna_diop = {
    "DeSagna Diop" => {
      :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :num_points_scored => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
    }
  }
  
    ben_gordon = {
    "Ben Gordon" => {
      :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :num_points_scored => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
    }
  }
  
    brendan_haywood = {
    "Brendan Haywood" => {
      :player_name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :num_points_scored => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
    }
  }
  
  hometeam = game[:home][:players]
  awayteam = game[:away][:players]
  
  hometeam[0] = alan_anderson
  hometeam[1] = reggie_evans
  hometeam[2] = brook_lopez
  hometeam[3] = mason_plumlee
  hometeam[4] = jason_terry
  awayteam[0] = jeff_adrien
  awayteam[1] = bismak_biyombo
  awayteam[2] = desagna_diop
  awayteam[3] = ben_gordon
  awayteam[4] = brendan_haywood

  game
  
end

def num_points_scored(player)
  
  selected = grab_player(player)
  selected[0][player][:num_points_scored]
  
end

def shoe_size(player)
  
  selected = grab_player(player)
  selected[0][player][:shoe]

end

def team_colors(team)
  
  hometeam = game_hash()[:home]
  awayteam = game_hash()[:away]

  if team == hometeam[:team_name]
    hometeam[:colors]
  elsif team == awayteam[:team_name]
    awayteam[:colors]
  else
    "Unknown Colors"
  end
    
end

def grab_player(player)
  
  hometeam = game_hash()[:home][:players]
  awayteam = game_hash()[:away][:players]
  
  selected = []
  
  selector = lambda do |hash|  
    hash.each { |n, v| selected << hash if n == player }
  end
  
  hometeam.each &selector
  awayteam.each &selector
  
  selected
  
end

def team_names
  teams = []
  teams[0] = game_hash()[:home][:team_name]
  teams[1] = game_hash()[:away][:team_name]
  teams
end

def player_numbers(team)
 
  hometeam = game_hash()[:home]
  awayteam = game_hash()[:away]
  jersey_numbers = []

  get_numbers = -> i { i.each { |k,v| jersey_numbers << v[:number]  } }

  if team == hometeam[:team_name]
    hometeam[:players].each &get_numbers
  else 
    awayteam[:players].each &get_numbers
  end
  
  jersey_numbers
  
end

def player_stats(player)
  stats_hash = grab_player(player)[0][player] 
  stats_hash.delete(:player_name)
  stats_hash[:points] = stats_hash.delete(:num_points_scored)
  stats_hash
end

def big_shoe_rebounds
  
  hometeam = game_hash[:home][:players]
  awayteam = game_hash[:away][:players]
  shoes_rebounds = []
  
  
  get_shoes_and_rebounds = -> player_stats do 
    player_stats.each do |player, stats|
      shoes_rebounds << { shoe: stats[:shoe], rebounds: stats[:rebounds] }
    end
  end
  
  hometeam.each &get_shoes_and_rebounds
  awayteam.each &get_shoes_and_rebounds
  
  shoes_rebounds.sort_by { |i| i[:shoe] }.last[:rebounds]
  
end



