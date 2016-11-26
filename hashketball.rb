require 'pry'                                

def game_hash
  details = {
    :home => {
      :team_name => "Brooklyn Nets",          
      :colors => ["Black", "White"],          
      :players => [
      {
        :player_name => "Alan Anderson",     
        :number => 0,                         
        :shoe => 16,                          
        :points => 22,                        # => 22
        :rebounds => 12,                      # => 12
        :assists => 12,                       # => 12
        :steals => 3,                         # => 3
        :blocks => 1,                         # => 1
        :slam_dunks => 1                      # => 1
      },                                      # => {:player_name=>"Alan Anderson", :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1}
      {
        :player_name => "Reggie Evans",       # => "Reggie Evans"
        :number => 30,                        # => 30
        :shoe => 14,                          # => 14
        :points => 12,                        # => 12
        :rebounds => 12,                      # => 12
        :assists => 12,                       # => 12
        :steals => 12,                        # => 12
        :blocks => 12,                        # => 12
        :slam_dunks => 7                      # => 7
      },                                      # => {:player_name=>"Reggie Evans", :number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7}
      {
        :player_name => "Brook Lopez",        # => "Brook Lopez"
        :number => 11,                        # => 11
        :shoe => 17,                          # => 17
        :points => 17,                        # => 17
        :rebounds => 19,                      # => 19
        :assists => 10,                       # => 10
        :steals => 3,                         # => 3
        :blocks => 1,                         # => 1
        :slam_dunks => 15                     # => 15
      },                                      # => {:player_name=>"Brook Lopez", :number=>11, :shoe=>17, :points=>17, :rebounds=>19, :assists=>10, :steals=>3, :blocks=>1, :slam_dunks=>15}
      {
        :player_name => "Mason Plumlee",      # => "Mason Plumlee"
        :number => 1,                         # => 1
        :shoe => 19,                          # => 19
        :points => 26,                        # => 26
        :rebounds => 12,                      # => 12
        :assists => 6,                        # => 6
        :steals => 3,                         # => 3
        :blocks => 8,                         # => 8
        :slam_dunks => 5                      # => 5
      },                                      # => {:player_name=>"Mason Plumlee", :number=>1, :shoe=>19, :points=>26, :rebounds=>12, :assists=>6, :steals=>3, :blocks=>8, :slam_dunks=>5}
      {
        :player_name => "Jason Terry",        # => "Jason Terry"
        :number => 31,                        # => 31
        :shoe => 15,                          # => 15
        :points => 19,                        # => 19
        :rebounds => 2,                       # => 2
        :assists => 2,                        # => 2
        :steals => 4,                         # => 4
        :blocks => 11,                        # => 11
        :slam_dunks => 1                      # => 1
      }] #end home players
    },   #end home team      
    :away => {
      :team_name => "Charlotte Hornets",      # => "Charlotte Hornets"
      :colors => ["Turquoise", "Purple"],     # => ["Turquoise", "Purple"]
      :players => [ {
        :player_name => "Jeff Adrien",        # => "Jeff Adrien"
        :number => 4,                         # => 4
        :shoe => 18,                          # => 18
        :points => 10,                        # => 10
        :rebounds => 1,                       # => 1
        :assists => 1,                        # => 1
        :steals => 2,                         # => 2
        :blocks => 7,                         # => 7
        :slam_dunks => 2                      # => 2
        },                                    # => {:player_name=>"Jeff Adrien", :number=>4, :shoe=>18, :points=>10, :rebounds=>1, :assists=>1, :steals=>2, :blocks=>7, :slam_dunks=>2}
        {
          :player_name => "Bismak Biyombo",   # => "Bismak Biyombo"
          :number => 0,                       # => 0
          :shoe => 16,                        # => 16
          :points => 12,                      # => 12
          :rebounds => 4,                     # => 4
          :assists => 7,                      # => 7
          :steals => 7,                       # => 7
          :blocks => 15,                      # => 15
          :slam_dunks => 10                   # => 10
        },                                    # => {:player_name=>"Bismak Biyombo", :number=>0, :shoe=>16, :points=>12, :rebounds=>4, :assists=>7, :steals=>7, :blocks=>15, :slam_dunks=>10}
        {
          :player_name => "DeSagna Diop",     # => "DeSagna Diop"
          :number => 2,                       # => 2
          :shoe => 14,                        # => 14
          :points => 24,                      # => 24
          :rebounds => 12,                    # => 12
          :assists => 12,                     # => 12
          :steals => 4,                       # => 4
          :blocks => 5,                       # => 5
          :slam_dunks => 5                    # => 5
        },                                    # => {:player_name=>"DeSagna Diop", :number=>2, :shoe=>14, :points=>24, :rebounds=>12, :assists=>12, :steals=>4, :blocks=>5, :slam_dunks=>5}
        {
          :player_name => "Ben Gordon",       # => "Ben Gordon"
          :number => 8,                       # => 8
          :shoe => 15,                        # => 15
          :points => 33,                      # => 33
          :rebounds => 3,                     # => 3
          :assists => 2,                      # => 2
          :steals => 1,                       # => 1
          :blocks => 1,                       # => 1
          :slam_dunks => 0                    # => 0
        },                                    # => {:player_name=>"Ben Gordon", :number=>8, :shoe=>15, :points=>33, :rebounds=>3, :assists=>2, :steals=>1, :blocks=>1, :slam_dunks=>0}
        {
          :player_name => "Brendan Haywood",  # => "Brendan Haywood"
          :number => 33,                      # => 33
          :shoe => 15,                        # => 15
          :points => 6,                       # => 6
          :rebounds => 12,                    # => 12
          :assists => 12,                     # => 12
          :steals => 22,                      # => 22
          :blocks => 5,                       # => 5
          :slam_dunks => 12                   # => 12
        }]                                    # => [{:player_name=>"Jeff Adrien", :number=>4, :shoe=>18, :points=>10, :rebounds=>1, :assists=>1, :steals=>2, :blocks=>7, :slam_dunks=>2}, {:player_name=>"Bismak Biyombo", :number=>0, :shoe=>16, :points=>12, :rebounds=>4, :assists=>7, :steals=>7, :blocks=>15, :slam_dunks=>10}, {:player_name=>"DeSagna Diop", :number=>2, :shoe=>14, :points=>24, :rebounds=>12, :assists=>12, :steals=>4, :blocks=>5, :slam_dunks=>5}, {:player_name=>"Ben Gordon", :numbe...
    }                                         # => {:team_name=>"Charlotte Hornets", :colors=>["Turquoise", "Purple"], :players=>[{:player_name=>"Jeff Adrien", :number=>4, :shoe=>18, :points=>10, :rebounds=>1, :assists=>1, :steals=>2, :blocks=>7, :slam_dunks=>2}, {:player_name=>"Bismak Biyombo", :number=>0, :shoe=>16, :points=>12, :rebounds=>4, :assists=>7, :steals=>7, :blocks=>15, :slam_dunks=>10}, {:player_name=>"DeSagna Diop", :number=>2, :shoe=>14, :points=>24, :rebounds=>12, :assists=>12...
  }                                           # => {:home=>{:team_name=>"Brooklyn Nets", :colors=>["Black", "White"], :players=>[{:player_name=>"Alan Anderson", :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1}, {:player_name=>"Reggie Evans", :number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7}, {:player_name=>"Brook Lopez", :number=>11, :shoe=>17, :points=>17, :rebounds=>19, :assists...
  end

def num_points_scored(player)
  points = 0
  game_hash.each do |loc,team|
    team[:players].each do |k, v|
      if k[:player_name] == player
        points = k[:points]
      end
    end
  end
  points
end

def shoe_size(player)
  shoe = 0
  game_hash.each do |loc,team|
    team[:players].each do |k, v|
      if k[:player_name] == player
        shoe = k[:shoe]
      end
    end
  end
  shoe
end

def team_colors(team_color)
  color = []
  game_hash.each do |loc,team|
    if team[:team_name] == team_color
      color = team[:colors]
    end
  end
  color
end

def team_names
  teams = []
  game_hash.each do |loc,team|
    teams << team[:team_name]
  end
  teams
end

def player_numbers(team_nums)
  nums = []
  game_hash.each do |loc,team|
    if team_nums == team[:team_name]
      team[:players].each do |k, v|
          nums << k[:number]
      end
    end
  end
  nums
end

def player_stats(player)
  game_hash.each do |loc,team|
    team[:players].each do |k, v|
      if k[:player_name] == player
        return k.select{|x,y| x!=:player_name}
      end
    end
  end
end

def big_shoe_rebounds
  rebounds = 0                                           # => 0
  big_shoe_size = 0                                      # => 0
  game_hash.each do |loc,team|                           # => {:home=>{:team_name=>"Brooklyn Nets", :colors=>["Black", "White"], :players=>[{:player_name=>"Alan Anderson", :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1}, {:player_name=>"Reggie Evans", :number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7}, {:player_name=>"Brook Lopez", :number=>11, :shoe=>17, :points=>17, :rebounds=>1...
    team[:players].each do |k, v|                        # => [{:player_name=>"Alan Anderson", :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1}, {:player_name=>"Reggie Evans", :number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7}, {:player_name=>"Brook Lopez", :number=>11, :shoe=>17, :points=>17, :rebounds=>19, :assists=>10, :steals=>3, :blocks=>1, :slam_dunks=>15}, {:player_name=>"Ma...
      if big_shoe_size == 0 || k[:shoe] > big_shoe_size  # => true, false, true, true, false, false, false, false, false, false
      big_shoe_size = k[:shoe]                           # => 16, 17, 19
      rebounds = k[:rebounds]                            # => 12, 19, 12
      end                                                # => 12, nil, 19, 12, nil, nil, nil, nil, nil, nil
    end                                                  # => [{:player_name=>"Alan Anderson", :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1}, {:player_name=>"Reggie Evans", :number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7}, {:player_name=>"Brook Lopez", :number=>11, :shoe=>17, :points=>17, :rebounds=>19, :assists=>10, :steals=>3, :blocks=>1, :slam_dunks=>15}, {:player_name=>"Ma...
  end                                                    # => {:home=>{:team_name=>"Brooklyn Nets", :colors=>["Black", "White"], :players=>[{:player_name=>"Alan Anderson", :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1}, {:player_name=>"Reggie Evans", :number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7}, {:player_name=>"Brook Lopez", :number=>11, :shoe=>17, :points=>17, :rebounds=>1...
  rebounds                                               # => 12
end