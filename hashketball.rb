require 'pry'
# Write your code here!
def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
       "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
       "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
       "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
       "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
       "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
       "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
       "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10},
       "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
       "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
       "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12}]
    }
  }
end



def num_points_scored(player)
  game = game_hash
  game.each do |team, team_hash|
    team_hash.each do |key, values|
      if key == :players
        values.each do |players|
          if players.include?(player)
            points = players[player][:points]
            return points
          end
        end #do
      end #if
    end #do
  end #do
end #do

def shoe_size(player)
  game = game_hash
  game.each do |team, team_hash|
    team_hash.each do |key, values|
      if key == :players
        values.each do |players|
          if players.include?(player)
            size = players[player][:shoe]
            return size
          end
        end #do
      end #if
    end #do
  end #do
end #do

def team_colors(team_name)
  game = game_hash
  game.each do |team, team_hash|
    return team_hash[:colors] if team_hash.values.include?(team_name)
  end
end

def team_names
  game = game_hash
  team_names = []
  game.each do |team, team_hash|
    team_names << team_hash[:team_name]
  end
  team_names
end

def player_numbers(team_name)
  game = game_hash
  numbers = []
  game.each do |team, team_hash|
    if team_hash.values.include?(team_name)
      team_hash.each do |key, values|
        if key == :players
          values.each do |players|
            players.each do |player, stats|
              numbers << stats[:number]
            end #do
          end #do
        end #if
      end #do
    end #if
  end #game.each
  numbers
end #method

def player_stats(player_name)
  game = game_hash
  game.each do |team, team_hash|
    team_hash.each do |key, values|
        if key == :players
          values.each do |players|
            players.each do |player, stats|
              return stats if player == player_name
              #binding.pry
            end #do
          end #do
        end #if
    end #do
  end #game.each
end #method

def get_players(game_hash)
  players = []
  game_hash.each do |team, team_hash|
    team_hash.each do |key, values|
      if key == :players
        values.each do |players_hash|
          players_hash.each{|k, v| players << k}
        end #do
      end #if
    end #do
  end #do
  players
end #method

def big_shoe_rebounds
  game = game_hash
  players = get_players(game_hash)
  big_shoe = 0
  rebounds = 0
  players.each do |player|
    stats = player_stats(player)
    rebounds = stats[:rebounds] if stats[:shoe] > big_shoe
  end
  rebounds

end
