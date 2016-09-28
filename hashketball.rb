require 'pry'

def game_hash
  game_hash = { 
    :home => 
    {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => 
    [ { :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1 }, 
      { :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7 }, 
      { :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15 }, 
      { :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5 }, 
      { :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1 }      
    ] },

   :away => 
    {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => 
    [ { :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2}, 
      { :player_name => "Bismak Biyombo",
        :number => 0,
        :shoe =>  16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10}, 
      { :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5}, 
      { :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0}, 
      { :player_name => "Brendan Haywood",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12}      
    ] }
  }
end

def num_points_scored(player_name)
  num_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            num_points = player[:points]
          end
        end
      end
    end
  end
  num_points
end

def shoe_size(player_name)
  shoe_size = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            shoe_size = player[:shoe]
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  colors = ""
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team_name
      colors = game_hash[location][:colors]
    end
  end
  colors
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_names << game_hash[location][:team_name]
  end  
  team_names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data| 
        if attribute == :players
          data.each do |player|
            numbers << player[:number]
          end
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  stats_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            stats_hash = player 
            stats_hash.delete(:player_name)
          end
        end
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds
  players_and_sizes = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          players_and_sizes[player[:player_name]] = player[:shoe]
        end
      end
    end
  end

  big_shoe = (players_and_sizes.sort_by {|name, size| size})[(players_and_sizes.length - 1)][0]
  big_shoe_rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == big_shoe
            big_shoe_rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  big_shoe_rebounds
end

def most_points_scored
  players_and_scores = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          players_and_scores[player[:player_name]] = player[:points]
        end
      end
    end
  end
  big_scorer = (players_and_scores.sort_by {|name, score| score})[players_and_scores.length - 1][0]
end

def winning_team
  nets_score = 0
  hornets_score = 0  
  game_hash.each do |location, team_data|
    if team_data[:team_name] == "Brooklyn Nets"
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            nets_score += player[:points]
          end
        end
      end
    elsif team_data[:team_name] == "Charlotte Hornets"
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            hornets_score += player[:points]
          end
        end
      end     
    end
  end
  if nets_score > hornets_score
    "Brooklyn Nets"
  else
    "Charlotte Hornets"
  end
end

def player_with_longest_name
  players_and_name_length = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          players_and_name_length[player[:player_name]] = player[:player_name].length
        end
      end
    end
  end
  longest_name = (players_and_name_length.sort_by {|name, name_length| name_length})[players_and_name_length.length - 1][0]
end

def long_name_steals_a_ton?
  players_and_steals = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          players_and_steals[player[:player_name]] = player[:steals]
        end
      end
    end
  end
  most_steals = (players_and_steals.sort_by {|name, steals| steals})[players_and_steals.length - 1][0]
  player_with_longest_name == most_steals
end
