# Write your code here!

def game_hash
game_hash = {
   :home => {
     :team_name => 'Brooklyn Nets',
     :colors => ["Black", "White"],
     :players => {
        "Alan Anderson" => { :number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1 },
        "Reggie Evans" => { :number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7 },
        "Brook Lopez" => { :number=>11, :shoe=>17, :points=>17, :rebounds=>19, :assists=>10, :steals=>3, :blocks=>1, :slam_dunks=>15 },
        "Mason Plumlee" => { :number=>1, :shoe=>19, :points=>26, :rebounds=>12, :assists=>6, :steals=>3, :blocks=>8, :slam_dunks=>5 },
        "Jason Terry" => { :number=>31, :shoe=>15, :points=>19, :rebounds=>2, :assists=>2, :steals=>4, :blocks=>11, :slam_dunks=>1 }
     }
   },

   :away => {
     :team_name => 'Charlotte Hornets',
     :colors => ["Turquoise", "Purple"],
     :players => {
        "Jeff Adrien" => { :number=>4, :shoe=>18, :points=>10, :rebounds=>1, :assists=>1, :steals=>2, :blocks=>7, :slam_dunks=>2 },
        "Bismak Biyombo" => { :number=>0, :shoe=>16, :points=>12, :rebounds=>4, :assists=>7, :steals=>7, :blocks=>15, :slam_dunks=>10 },
        "DeSagna Diop" => { :number=>2, :shoe=>14, :points=>24, :rebounds=>12, :assists=>12, :steals=>4, :blocks=>5, :slam_dunks=>5 },
        "Ben Gordon" => { :number=>8, :shoe=>15, :points=>33, :rebounds=>3, :assists=>2, :steals=>1, :blocks=>1, :slam_dunks=>0 },
        "Brendan Haywood" => { :number=>33, :shoe=>15, :points=>6, :rebounds=>12, :assists=>12, :steals=>22, :blocks=>5, :slam_dunks=>12 }
     }
   }
  }
end


def num_points_scored(name) 
  g_hash = game_hash
  result = nil
  g_hash.each do |location, team_data|
    team_data.each do |team_key, team_value|
      if team_key == :players
        team_value.collect do |player_name, play_stat|
	  result = play_stat[:points] if player_name == name 
	end
      end
    end
  end
  result
end

def shoe_size(name)
  g_hash = game_hash
  result = nil
  g_hash.each do |location, team_data|
    team_data.each do |team_key, team_value|
      if team_key == :players
        team_value.collect do |player_name, play_stat|
	  result = play_stat[:shoe] if player_name == name 
	end
      end
    end
  end
  result

end

def team_colors(team_name)
  g_hash = game_hash
  result = nil
  g_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      result = team_data[:colors] 
    end
  end
  result
end

def team_names
  g_hash = game_hash
  g_hash.collect do |location, team_data|
   team_data[:team_name]
  end 
end

def player_numbers(team_name)
  g_hash = game_hash
  results = []
  g_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players 
          data.collect do |item_key, item_value|
	    results << item_value[:number] 
          end
        end 
      end
    end
  end
  results
end


def player_stats(player_name)
   g_hash = game_hash
   results = {}
   g_hash.each do |location,team_data|
     team_data.each do |attribute, data|
       if attribute == :players 
 	 data.each do |player, player_data|
	   if player == player_name
	     results = player_data
           end
	 end
       end
     end
   end
   results
end

def big_shoe_rebounds
  g_hash = game_hash
  shoe_size_array = []
  rebounds_array =[] 
  biggest_shoe_rebound = nil
  g_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
         data.each do |player, player_data|
 	    rebounds_array.push({player_data[:shoe]=>player_data[:rebounds]})
	    player_data.map do |k, v|
 	      if k == :shoe
		shoe_size_array.push(v)
	      end
            end 
         end
      end
    end
  end
  biggest_shoe = shoe_size_array.max
  rebounds_array.each do | rebound |
    rebound.each do |rebound_key, rebound_value|
	if rebound_key == biggest_shoe
	  biggest_shoe_rebound = rebound_value
	end
    end
  end
  biggest_shoe_rebound
end


def most_points_scored
  g_hash = game_hash
  points_array = []
  player_points = {}
  result = nil
  g_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
 	  player_points[player] = player_data[:points]
	  player_data.each do |k, v|
	    if k == :points
              points_array.push(v)
            end
	  end 
        end
      end  
    end
  end
  highest_point = points_array.max
  player_points.each do |player, points|
    if points == highest_point
       result = player
    end
  end 
  result
end

def winning_team 
  g_hash = game_hash
  team = {}
  g_hash.each do |location, team_data|
    team_name = ''
    scores = []
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_name = data
      end
      if attribute == :players
 	data.each do |k, player_data|
   	  player_data.each do |attr, v|
	    if attr == :points
              scores.push(v)
            end
 	  end
	end
      end
    end 
    team[team_name] = scores.inject(:+)
  end
  #team
  score_max = team.map{|k,v| v}.max
  team.map{|k,v| k if v==score_max}.compact.join("")
end

def player_with_longest_name
  g_hash = game_hash
  player_hash = {}
  g_hash.each do |location, team_data|
   team_data.each do |attribute, data|
     if attribute == :players
       data.each do |player, player_data|
         player_hash[player] = player.length
       end
     end
   end 
  end
  max_length = player_hash.map{|k,v| v}.max
  player_hash.map{|k,v| k if v==max_length}.compact.join("")
end

def long_name_steals_a_ton?
  g_hash = game_hash
  player_hash = {}
  g_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
 	data.each do |player, player_data|
	  player_data.each do |k,v|
 	    if k == :steals
 	      player_hash[player] = v
	    end
	  end
	end
      end
    end
  end
  max_steal = player_hash.map{|k,v| v}.max
  max_steal_player = player_hash.map{|k,v| k if v==max_steal}.compact.join("")
  if max_steal_player == player_with_longest_name
    return true
  else
    return false
  end
end


