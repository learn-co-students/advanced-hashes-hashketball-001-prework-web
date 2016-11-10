def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["black", "white"],
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
        }]
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["turquoise", "purple"],
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
        }]
    }
  }
end

def stat_query(player, stat)
  output = nil
  game_hash.each do |team, att|
    game_hash[team][:players].each do |plyr_att|
      plyr_att.has_value?(player) ? output = plyr_att.fetch(stat).to_i : nil
    end
  end
  output
end

def num_points_scored(player)
  stat_query(player, :points)
end

def shoe_size(player)
  stat_query(player, :shoe)
end

def team_colors(team)
  output = nil
  game_hash.each do |team_list, att|
    if att[:team_name] == team
      output = att[:colors].map { |x| x.capitalize }
    end
  end
  output
end

def team_names
  output = []
  game_hash.each { |team, att| output << att[:team_name] }
  output
end

def player_numbers(team)
  output = []
  game_hash.each do |team_list, att|
    if att[:team_name] == team
       att[:players].each { |plyr_att, val| output << plyr_att[:number].to_i }
    end
  end
  output
end

def player_stats(player)
  output = nil
  game_hash.each do |team, att|
    game_hash[team][:players].each do |plyr_att|
      if plyr_att.has_value?(player)
        output = plyr_att.select { |key, val| key != :player_name }
      end
    end
  end
  output
end

# test passes, but could be optimized
def big_shoe_rebounds
  shoe_sizes = []
  output = nil
  game_hash.each do |team, att|
    game_hash[team][:players].each { |k, v| shoe_sizes << k[:shoe] }
    game_hash[team][:players].each { |k, v|
      k[:shoe] == shoe_sizes.sort.pop ? output = k[:rebounds] : nil }
  end
  output  
end