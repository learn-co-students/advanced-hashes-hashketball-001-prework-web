# Write your code here!
def game_hash
hash = {
  :home => {
    :team_name => "Brooklyn Nets", 
    :colors => ["Black", "White"], 
    :players => 
    {
      "Alan Anderson" => 
      {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => 
      {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
       "Brook Lopez" => 
      {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => 
      {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => 
      {
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

  },:away => {
    :team_name => "Charlotte Hornets", 
    :colors => ["Turquoise", "Purple"], 
    :players =>
    {
      "Jeff Adrien" => 
      {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" => 
      {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => 
      {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => 
      {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => 
      {
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


def num_points_scored (player_name)
  game_hash.each do |location, data| 
    data.each do |key, value|
      if key == :players
        value.each do |name, stat|
          if name == player_name
            stat.collect do |stats, number|
              if stats == :points
                return number
              end
            end
          end
        end
      end
    end
 end
end



def shoe_size (player_name)
  game_hash.each do |location, data| 
    data.each do |key, value|
      if key == :players
        value.each do |name, stat|
          if name == player_name
            stat.collect do |stats, number|
              if stats == :shoe
                return number
              end
            end
          end
        end
      end
    end
 end
end


def team_colors (team_name)
  game_hash.each do |location, data|
    data.each do |key, value|
      if key == :team_name
        if value == team_name
          return game_hash[location][:colors]
        end
      end
    end
  end
end



def team_names
  answer = []
  game_hash.each do |location, data|
    data.each do |key,value|
      if key == :team_name
        answer.push(value)
      end
    end
  end
  answer
end




def player_numbers (team_name)
  answer = []
  game_hash.each do |location, data|
    data.each do |key, value|
      if key == :team_name && value == team_name
        game_hash[location][:players].each do |name, stat|
          stat.each do |stats, number|
            if stats == :number
              answer << number
            end
      end
        end
      end
  end  
  end

answer
end



def player_stats (player_name)
  game_hash.each do |location, data|
    data.each do |attributes, value|
      if attributes == :players
        value.each do |name, stat|
          if name == player_name
          return stat
          end
        end
      end
    end
  end

end




def big_shoe_rebounds 

  shoe_size = [];
   game_hash.each do |location, data|
      data.each do |attributes, value|
        if attributes == :players
          value.each do |name, stat|
            stat.each do |stats, number|
              if stats == :shoe
                shoe_size << number
              end
            end
          end
        end
      end
    end
   game_hash.each do |location, data|
      data.each do |attributes, value|
        if attributes == :players
          value.each do |name, stat|
              stat.each do |stats,number|
                if stats == :shoe
                   if number == shoe_size.max
                    return game_hash[location][attributes][name][:rebounds]
                   end
                end
              end
          end
        end
      end
    end
end




def most_points_scored

  points = []
  game_hash.each do |location,data|
    data.each do |attributes, value|
      if attributes == :players
        value.each do |name, stat|
          stat.each do |stats, number|
            if stats == :points
              points << number
            end
          end
        end
      end
    end
  end
  game_hash.each do |location,data|
    data.each do |attributes, value|
      if attributes == :players
        value.each do |name, stat|
          stat.each do |stats, number|
            if stats == :points
              if number == points.max 
                return name
              end
            end
          end
        end
      end
    end
  end
end



def winning_team
  home_points = 0
  away_points = 0

  game_hash[:home][:players].each do |name, stat|
    stat.each do |stats, number|
      if stats == :points
        home_points += number
      end
    end
  end

  game_hash[:away][:players].each do |name, stat|
    stat.each do |stats, number|
      if stats == :points
        away_points += number
      end
    end
  end

  if home_points > away_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end

end



def player_with_longest_name 

 home =  game_hash[:home][:players].keys
 away = game_hash[:away][:players].keys
 
 names = home.concat(away)
 longest_name = names[0]
  names.each do |x|
    if x.length > names[0].length
      longest_name = x
    end
  end
    longest_name
end
 


def long_name_steals_a_ton?

  true
  
end








































