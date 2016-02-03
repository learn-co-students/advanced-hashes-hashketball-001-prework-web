require 'pry'
#Write your code here!
def game_hash
 game = {
   :home => {
     :team_name => "Brooklyn Nets",
     :colors => ["Black", "White"],
     :players => [
       {
         :player_name => "Alan Anderson",
         :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1
       },
       {
         :player_name => "Reggie Evans",
         :number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12,
         :slam_dunks => 7
       },
       {
         :player_name => "Brook Lopez",
         :number => 11,
         :shoe => 17,
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15
       },
       {
         :player_name => "Mason Plumlee",
         :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 12,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5
       },
       {
         :player_name => "Jason Terry",
         :number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1
       }
     ]
   },
   :away => {
     :team_name => "Charlotte Hornets",
     :colors => ["Turquoise", "Purple"],
     :players => [
       {
         :player_name => "Jeff Adrien",
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2
       },
       {
         :player_name => "Bismak Biyombo",
         :number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 7,
         :blocks => 15,
         :slam_dunks => 10
       },
       {
         :player_name => "DeSagna Diop",
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
       },
       {
         :player_name => "Ben Gordon",
         :number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0
       },
       {
         :player_name => "Brendan Haywood",
         :number => 33,
         :shoe => 15,
         :points => 6,
         :rebounds => 12,
         :assists => 12,
         :steals => 22,
         :blocks => 5,
         :slam_dunks => 12
       }
     ]
   }
 }
end

def get_players
  game_hash.fetch(:home).fetch(:players) + game_hash.fetch(:away).fetch(:players)
  #binding.pry
end

def get_teams
  [game_hash.fetch(:home),game_hash.fetch(:away)]
end

def get_team_info(t_name)
  get_teams.find {|team| team.fetch(:team_name)==t_name}
end

def get_player_stats(p_name)
  get_players.find {|player| player.fetch(:player_name)==p_name}
end

def num_points_scored(p_name)
  get_player_stats(p_name).fetch(:points)
end

def shoe_size(p_name)
  get_player_stats(p_name).fetch(:shoe)
end

def team_colors(t_name)
  get_teams.find {|team| team.fetch(:team_name) == t_name}.fetch(:colors)
end

def team_names
  get_teams.collect{|team| team.fetch(:team_name)}
end

def player_numbers(t_name)
  get_team_info(t_name).fetch(:players).collect{|player| player.fetch(:number)}
end

def player_stats(p_name)
  stats_w_name = get_player_stats(p_name)
  stats_w_name.delete(:player_name)
  stats_w_name
end

def big_shoe_rebounds
  player_w_biggest_foot = biggest_shoe
  biggest_shoe.fetch(:rebounds)
end

def biggest_shoe
  get_players.sort_by {|player| player.fetch(:shoe)}.last
end

def most_points_scored
  player_w_most_points = get_players.sort_by {|player| player.fetch(:points)}.last
  player_w_most_points.fetch(:player_name)
end

def team_score(team)
  score = 0
  game_hash.fetch(team).fetch(:players).each {|player| score += player.fetch(:points)}
  score
end

def winning_team
  team_score(:home) > team_score(:away) ? game_hash.fetch(:home).fetch(:team_name) : game_hash.fetch(:away).fetch(:team_name)
end

def player_with_longest_name
  get_players.sort_by {|player| player.fetch(:player_name).length}.last.fetch(:player_name)
end

def player_with_most_steals
  player_w_most_steals = get_players.sort_by {|player| player.fetch(:steals)}.last
  player_w_most_steals.fetch(:player_name)
end

def long_name_steals_a_ton?
  player_with_most_steals == player_with_longest_name
end