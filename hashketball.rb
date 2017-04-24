# Write your code here!
def game_hash
  values = {
    :home => {
      :team_name => "Brooklyn Nets",
         :colors => ["Black", "White"],
        :players => [
        {
         :player_name => "Alan Anderson" ,
              :number => 0 ,
                :shoe => 16 ,
              :points => 22 ,
            :rebounds => 12 ,
             :assists => 12 ,
              :steals => 3 ,
              :blocks => 1 ,
          :slam_dunks => 1
        },
        {
         :player_name => "Reggie Evans" ,
              :number => 30 ,
                :shoe => 14 ,
              :points => 12 ,
            :rebounds => 12 ,
             :assists => 12 ,
              :steals => 12 ,
              :blocks => 12 ,
          :slam_dunks => 7
        },
        {
         :player_name => "Brook Lopez" ,
              :number => 11 ,
                :shoe => 17 ,
              :points => 17 ,
            :rebounds => 19 ,
             :assists => 10 ,
              :steals => 3 ,
              :blocks => 1 ,
          :slam_dunks => 15
        },
        {
         :player_name => "Mason Plumlee" ,
              :number => 1 ,
                :shoe => 19 ,
              :points => 26 ,
            :rebounds => 12 ,
             :assists => 6 ,
              :steals => 3 ,
              :blocks => 8 ,
          :slam_dunks => 5
        },
        {
         :player_name => "Jason Terry" ,
              :number => 31 ,
                :shoe => 15 ,
              :points => 19 ,
            :rebounds => 2 ,
             :assists => 2 ,
              :steals => 4 ,
              :blocks => 11 ,
          :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
         :colors => ["Turquoise", "Purple"],
        :players => [
        {
         :player_name => "Jeff Adrien" ,
              :number => 4 ,
                :shoe => 18 ,
              :points => 10 ,
            :rebounds => 1 ,
             :assists => 1 ,
              :steals => 2 ,
              :blocks => 7 ,
          :slam_dunks => 2
        },
        {
         :player_name => "Bismak Biyombo" ,
              :number => 0 ,
                :shoe => 16 ,
              :points => 12 ,
            :rebounds => 4 ,
             :assists => 7 ,
              :steals => 7 ,
              :blocks => 15 ,
          :slam_dunks => 10
        },
        {
         :player_name => "DeSagna Diop" ,
              :number => 2 ,
                :shoe => 14 ,
              :points => 24 ,
            :rebounds => 12 ,
             :assists => 12 ,
              :steals => 4 ,
              :blocks => 5 ,
          :slam_dunks => 5
        },
        {
         :player_name => "Ben Gordon" ,
              :number => 8 ,
                :shoe => 15 ,
              :points => 33 ,
            :rebounds => 3 ,
             :assists => 2 ,
              :steals => 1 ,
              :blocks => 1 ,
          :slam_dunks => 0
        },
        {
         :player_name => "Brendan Haywood" ,
              :number => 33 ,
                :shoe => 15 ,
              :points => 6 ,
            :rebounds => 12 ,
             :assists => 12 ,
              :steals => 22 ,
              :blocks => 5 ,
          :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(player)
  get_player_by_name(player)[:points]
end

def shoe_size(player)
  get_player_by_name(player)[:shoe]
end

def team_colors(team)
  get_team_by_name(team)[:colors]
end

def team_names
  names = []

  game_hash.each do |location, team_data|
    names << team_data[:team_name]
  end

  names
end

def player_numbers(team)
  numbers = []
  team_hash = get_team_by_name(team)

  team_hash[:players].each do |index|
    numbers << index[:number]
  end

  numbers
end

def player_stats(player)
  get_player_by_name(player).select { |k, v| k != :player_name }
end

def big_shoe_rebounds
  largest_shoe_size = get_max_shoe_size

  player = get_player_by_shoe_size(largest_shoe_size)

  player[:rebounds]
end

def most_points_scored
  max_points = get_all_points(game_hash).max

  player = get_player_by_points(max_points)

  player[:player_name]
end

def winning_team
  # get each team, calculate their score, determine winner, return team
  home_players = game_hash[:home][:players]
  home_score = home_players.collect { |player| player[:points] }.reduce(:+)
  away_players = game_hash[:away][:players]
  away_score = away_players.collect { |player| player[:points] }.reduce(:+)

  home_score > away_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  players = get_all_players
  player_names = players.map { |player| player[:player_name] }

  longest = player_names.inject do |memo, name|
    memo.length > name.length ? memo : name
  end

  longest
end

def long_name_steals_a_ton?
  players = get_all_players
  longest_name = player_with_longest_name
  most_steals = get_max_steals

  players.each do |player|
    return true if player[:player_name] == longest_name && player[:steals] == most_steals
  end
end

def get_all_points(points_hash)
  points = []

  points_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |p|
          points << p[:points]
        end
      end
    end
  end

  points
end

def get_max_shoe_size
  shoe_sizes = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |p|
          shoe_sizes << p[:shoe]
        end
      end
    end
  end

  shoe_sizes.sort[-1]
end

def get_all_players
  players = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        players << data
      end
    end 
  end

  players.flatten
end

def get_team_by_name(team)
  result_object = {}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        result_object = team_data if data == team
      end
    end
  end

  result_object
end

def get_player_by_name(player)
  result_object = {}

  game_hash.each do | location, team_data |
    team_data.each do | attribute, data |
      if attribute == :players
        data.each do |p|
          if p[:player_name] == player
            result_object = p
          end
        end
      end
    end
  end

  result_object
end

def get_player_by_shoe_size(size)
  result_object = {}

  game_hash.each do | location, team_data |
    team_data.each do | attribute, data |
      if attribute == :players
        data.each do |p|
          if p[:shoe] == size
            result_object = p
          end
        end
      end
    end
  end

  result_object
end

def get_player_by_points(points)
  result_object = {}

  game_hash.each do | location, team_data |
    team_data.each do | attribute, data |
      if attribute == :players
        data.each do |p|
          if p[:points] == points
            result_object = p
          end
        end
      end
    end
  end

  result_object
end

def get_max_steals
  result_object = []

  game_hash.each do | location, team_data |
    team_data.each do | attribute, data |
      if attribute == :players
        data.each do |p|
          result_object << p[:steals]
        end
      end
    end
  end

  result_object.sort[-1]
end