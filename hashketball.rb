def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
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
     :colors => ["Turquoise", "Purple"],
     :players => {
       "Jeff Adrien" => {
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2
       },
       "Bismak Biyombo" => {
         :number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 7,
         :blocks => 15,
         :slam_dunks => 10
       },
       "DeSagna Diop" => {
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
       },
       "Ben Gordon" => {
         :number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0
       },
       "Brendan Haywood" => {
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
   game_hash.each do |location,team_data|
     game_hash[location][:players].each do |player, stats|
    	 if player == name
    		 return stats[:points]
    	 end
     end
   end
 end

def shoe_size(name)
  game_hash.each do |location,team_data|
    game_hash[location][:players].each do |player, stats|
      if player == name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location,team_data|
   if game_hash[location][:team_name] == team
        return game_hash[location][:colors]
    end
  end
end

def team_names
  names = []
      names << game_hash[:home][:team_name]
      names << game_hash[:away][:team_name]
  names
end

def player_numbers(team)
  numbers = []
	game_hash.each do |location, team_data|
		if game_hash[location][:team_name] == team
			game_hash[location][:players].each do |player,data|
				numbers << data[:number]
			end
		end
	end
  numbers
end

def player_stats(name)
  game_hash.each do |location,team_data|
    game_hash[location][:players].each do |player, stats|
      if player == name
        return stats
      end
    end
  end
end


# Got a type error "no implicit conversion of Symbol into Integer" here.
# I will revisit this as my understanding grows.
#def big_shoe_rebounds
#  biggest = [{:shoe => nil}]
#  game_hash.each do |place, team|
#    team.each do |attribute, data|
#      if attribute == :players
#        data.each do |player|
#          if biggest[:shoe][0] == nil || player[:shoe][0] > biggest[:shoe][0]
#            biggest = player
#            end
#          end
#        end
#      end
#    end
#  biggest[:rebounds]
#end

# For now, I will borrow another method that I think is less elegant, but passes:
def big_shoe_rebounds
  biggest = [0, ""] # I feel like this method shouldn't need a variable for rebounds...
  game_hash.each do |loc, team_data|
    team_data[:players].each do |player, stats|
      if stats[:shoe] > biggest[0]
         biggest = [stats[:shoe], stats[:rebounds]]
      end
    end
  end
  biggest[1] #...but should access the rebounds value of the player directly?
end
