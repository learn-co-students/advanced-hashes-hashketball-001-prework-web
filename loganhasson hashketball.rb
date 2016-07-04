Skip to content
 
 
Search…
All gists
GitHub
Sign up for a GitHub account Sign in
Create a gist now
Instantly share code, notes, and snippets.
 Star 0  Fork 1 @loganhassonloganhasson/hashketball.rb
Created 3 years ago
Embed  
<script src="https://gist.github.com/loganhasson/6771853.js"></script>
  Download ZIP
 Code  Revisions 1  Forks 1
Raw  hashketball.rb
# Hashketball Nests
#
# Great news! You're going to an NBA game! The only catch is that you've been
# volunteered to keep stats at the game.
#
# Using Nested Hashes, define a game, with two teams, their players, and the players stats:
#
# The game has two teams.
#
# A team has:
# - A name
# - Two colors
#
# Each team should have at least 5 players
#
# Each player should have a:
# - name
# - number (like their jersey number)
# - shoe size
#
# Each player should have the following stats:
# - points
# - rebounds
# - assists
# - steals
# - blocks
# - slam dunks

game = {
  :home => { :team_name => "Charlotte Hornets",
             :colors => ["Turquoise", "Purple"],
             :players => [
               {:player_name => "Jeff Adrien",
                :number => 4,
                :shoe_size => 18,
                :stats => {
                  :points => 10,
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks => 7,
                  :slam_dunks => 2
                 }
                },
               {:player_name => "Bismak Biyombo",
                :number => 0,
                :shoe_size => 16,
                :stats => {
                  :points => 12,
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 7,
                  :blocks => 15,
                  :slam_dunks => 10
                  }
                },
               {:player_name => "DeSagna Diop",
                :number => 2,
                :shoe_size => 14,
                :stats => {
                  :points => 24,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5
                  }
                },
               {:player_name => "Ben Gordon",
                :number => 8,
                :shoe_size => 15,
                :stats => {
                  :points => 33,
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0
                  }
                },
               {:player_name => "Brendan Haywood",
                :number => 33,
                :shoe_size => 15,
                :stats => {
                  :points => 6,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 22,
                  :blocks => 5,
                  :slam_dunks => 12
                  }
                }
              ]    
          },
  :away => { :team_name => "Brooklyn Nets",
             :colors => ["Black", "White"],
             :players => [
               {:player_name => "Alan Anderson",
                :number => 0,
                :shoe_size => 16,
                :stats => {
                  :points => 22,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1
                  }
                },
               {:player_name => "Reggie Evans",
                :number => 30,
                :shoe_size => 14,
                :stats => {
                  :points => 12,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7
                  }
                },
               {:player_name => "Brook Lopez",
                :number => 11,
                :shoe_size => 17,
                :stats => {
                  :points => 17,
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15
                  }
                },
               {:player_name => "Mason Plumlee",
                :number => 1,
                :shoe_size => 19,
                :stats => {
                  :points => 26,
                  :rebounds => 12,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5
                  }
                },
               {:player_name => "Jason Terry",
                :number => 31,
                :shoe_size => 15,
                :stats => {
                  :points => 19,
                  :rebounds => 2,
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1
                  }
                }
               ]
  
  }
}

# Using the power of Ruby, and the Hashes you created above, answer the following questions:
# Return the number of points scored for any player:

def points_scored(player, game)
  game[:home][:players].each do |player_hash|
    return player_hash[:stats][:points] if player_hash[:player_name] == player
  end

  game[:away][:players].each do |player_hash|
    return player_hash[:stats][:points] if player_hash[:player_name] == player
  end
end

puts "# Points Scored by Jason Terry #"
puts points_scored("Jason Terry", game)
puts ""

# Return the shoe size for any player:

def shoe_size(player, game)
  game[:home][:players].each do |player_hash|
    return player_hash[:shoe_size] if player_hash[:player_name] == player
  end

  game[:away][:players].each do |player_hash|
    return player_hash[:shoe_size] if player_hash[:player_name] == player
  end
end

puts "# Shoe Size of Brook Lopez #"
puts shoe_size("Brook Lopez", game)
puts ""

# Return both colors for any team:

def get_colors(team_name, game)
  return game[:home][:colors] if game[:home][:team_name] == team_name
  return game[:away][:colors] if game[:away][:team_name] == team_name
end

puts "# Team Colors, Brooklyn Nets #"
puts get_colors("Brooklyn Nets", game).inspect
puts ""

# Return both teams names:

def who_is_playing(game)
  team_names = []
  team_names << game[:home][:team_name]
  team_names << game[:away][:team_name]
  team_names
end

puts "# Teams #"
puts who_is_playing(game).inspect
puts ""

# Return all the player numbers for a team:

def get_roster(team_name, game)
  roster = []
  if game[:home][:team_name] == team_name
    game[:home][:players].each do |player_hash|
      roster << player_hash[:player_name]
    end
  elsif game[:away][:team_name] == team_name
    game[:away][:players].each do |player_hash|
      roster << player_hash[:player_name]
    end
  end
  roster
end

puts "# Charlotte Hornets Roster #"
puts get_roster("Charlotte Hornets", game)
puts ""

# Return all the stats for a player:

def get_stats(player_name, game)
  game[:home][:players].each do |player_hash|
    return player_hash[:stats] if player_hash[:player_name] == player_name
  end

  game[:away][:players].each do |player_hash|
    return player_hash[:stats] if player_hash[:player_name] == player_name
  end
end

puts "# Reggie Evans' Stats #"
puts get_stats("Reggie Evans", game)
puts ""

# Return the rebounds for the player with the largest shoe size

def big_foot_rebounds(game)
  biggest_shoe_name = ""
  biggest_shoe_size = 0
  #figure out who has the biggest shoe
  game[:home][:players].each do |player_hash|
    if player_hash[:shoe_size] > biggest_shoe_size
      biggest_shoe_size = player_hash[:shoe_size]
      biggest_shoe_name = player_hash[:player_name]
    end
  end
  game[:away][:players].each do |player_hash|
    if player_hash[:shoe_size] > biggest_shoe_size
      biggest_shoe_size = player_hash[:shoe_size]
      biggest_shoe_name = player_hash[:player_name]
    end
  end

  # get that player's rebounds
  rebounds_arr = []
  rebounds_arr << biggest_shoe_name
  game[:home][:players].each do |player_hash|
     rebounds_arr << player_hash[:stats][:rebounds] if player_hash[:player_name] == biggest_shoe_name
  end

  game[:away][:players].each do |player_hash|
    rebounds_arr << player_hash[:stats][:rebounds] if player_hash[:player_name] == biggest_shoe_name
  end
  rebounds_arr
end

puts "# Rebounds of Player with Biggest Feet #"
puts big_foot_rebounds(game).inspect
puts ""


# Bonus Questions: define methods to return the answer to the following questions:
# Which player has the most points?

def who_is_boss(game)
  most_points = 0
  most_points_player = ""
  game[:home][:players].each do |player_hash|
    if player_hash[:stats][:points] > most_points
      most_points = player_hash[:stats][:points]
      most_points_player = player_hash[:player_name]
    end
  end
  game[:away][:players].each do |player_hash|
    if player_hash[:stats][:points] > most_points
      most_points = player_hash[:stats][:points]
      most_points_player = player_hash[:player_name]
    end
  end

  points_hash = {most_points_player => most_points}
end

puts "# Player with Most Points #"
puts who_is_boss(game).inspect
puts ""

# Which team has the most points?

def who_is_winning(game)
  home_points = 0
  away_points = 0

  game[:home][:players].each do |player_hash|
    home_points += player_hash[:stats][:points]
  end

  game[:away][:players].each do |player_hash|
    away_points += player_hash[:stats][:points]
  end

  home_points > away_points ? {"Home: #{game[:home][:team_name]}" => home_points} : {"Away: #{game[:away][:team_name]}" => away_points}
end

puts "# Which Team is Winning #"
puts who_is_winning(game).inspect
puts ""

# Which player has the longest name?

def yo_name_funny(game)
  longest_name = ""

  game[:home][:players].each do |player_hash|
    longest_name = player_hash[:player_name] if player_hash[:player_name].length > longest_name.length
  end

  game[:away][:players].each do |player_hash|
    longest_name = player_hash[:player_name] if player_hash[:player_name].length > longest_name.length
  end

  longest_name
end

puts "# Player With Longest Name #"
puts yo_name_funny(game).inspect
puts ""

# Super Bonus:
# Write a method that returns true if the player with the longest name had the most steals:

def letters_equal_skill?(game)
  longest_name = yo_name_funny(game)
  most_steals = 0
  most_steals_name = ""
  game[:home][:players].each do |player_hash|
    if player_hash[:stats][:steals] > most_steals
      most_steals = player_hash[:stats][:steals]
      most_steals_name = player_hash[:player_name]
    end
  end

  game[:away][:players].each do |player_hash|
    if player_hash[:stats][:steals] > most_steals
      most_steals = player_hash[:stats][:steals]
      most_steals_name = player_hash[:player_name]
    end
  end

  longest_name == most_steals_name ? true : false
end

puts "# Does the Player with the Longest Name Have the Most Steals? #"
puts letters_equal_skill?(game)
puts ""
Sign up for free to join this conversation on GitHub. Already have an account? Sign in to comment
Status API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Contact Help