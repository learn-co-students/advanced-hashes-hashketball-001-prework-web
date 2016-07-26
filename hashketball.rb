

def game_hash


hash =  
{
  :home => 
  {
    :team_name => "Brooklyn Nets",
    :colors =>["Black", "White"],
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

  },
  :away => 
  {
    :team_name => "Charlotte Hornets",
    :colors =>["Turquoise", "Purple"],
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
        :slam_dunks =>2
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

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
   
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
          
      end
    end
  end
end


#this way (below) is way cleaner than the "official" way in the solutiom? 
#I have coded both just to make sure I understand the logic of the "solution version"
#ah, I guess if there were many options for home/away, this method would not be feasible 

def num_points_scored_alt(name)
  if game_hash[:home][:players][name] != nil
    return game_hash[:home][:players][name][:points]
  elsif game_hash[:away][:players][name] != nil
    return game_hash[:away][:players][name][:points]
  else
  puts "enter a valid name, yo!"
  end
end

#^ tip was fetch
#http://ruby-doc.org/core-2.2.0/Hash.html#method-i-fetch

def num_points_scored(name)
  game_hash.each do |location, data|
    data.each do |key, value|
      if key == :players
        value.each do |person, data|
          if person == name
            data.each do |points, data|
              if points == :points
                return data
              end
            end
          end
        end
      end
    end
  end
end



def shoe_size(playa)
  game_hash.each do |location, data|
    data.each do |key, data|
      if key == :players
        data.each do |name, data|
          if name == playa
            data.each do |attribute, data|
              if attribute == :shoe
                return data
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, data|
    data.each do |attributes, data1|
        if data1 == team
          return game_hash[location][:colors]
        end
    end
  end
end

def team_names
  array = []
  game_hash.each do |location, data|
    data.each do |attribute, values|
      if attribute == :team_name
       array << values
      end
    end
  end
  array
end

def player_numbers(team)
  array = []
  game_hash.each do |location, alt|
    alt.each do |keys, data|
      if data == team
        game_hash[location][:players].each do |name, stat|
          stat.each do |type, number|
            if type == :number
              array << number 
            end
          end
        end
      end
    end
  end
  array
end

def player_stats(name)
  game_hash.each do |location, alt|
    alt.each do |attribute, data|
      if attribute == :players
        data.each do |person, stats|
          if person == name
            return stats
          end
        end
      end
    end
  end
end


def big_shoe_rebounds
shoe_hash = {}
  game_hash.each do |location, info|
    info.each do |attributes, data|
      if attributes == :players
        data.each do |name, stats|
          stats.each do |type, value|
            if type == :shoe
              shoe_hash[name] = value
            end
          end
        end
      end
    end
  end
  game_hash.each do |location, data|
    data.each do |key, value|
      if key == :players
        value.each do |person, data|
          if person == shoe_hash.max[0]
            data.each do |points, data|
              if points == :rebounds
                return data
              end
            end
          end
        end
      end
    end
  end
end


def most_points_scored
points_hash = {}
  game_hash.each do |k, v|
    game_hash[k][:players].each do |name, data|
      points_hash[name] = game_hash[k][:players][name][:points]
    end
  end
  x = points_hash.max_by {|k,v| v}
  x[0]
end

def winning_team
  points_hash = {}
  game_hash.each do |team_place, v|
    game_hash[team_place][:players].each do |name, data|
      points_hash[team_place] = 0
      points_hash[team_place] += game_hash[team_place][:players][name][:points]
    end
  end
  if points_hash[:home] >= points_hash[:away]
    game_hash[:home][:team_name]
  elsif points_hash[:home] <= points_hash[:away]
    game_hash[:away][:team_name]
  else
    puts "They scored the same amount of points!"
  end
end

def player_with_longest_name
longest_name = ""
  game_hash.each do |team_place, v|
    game_hash[team_place][:players].each do |name, data|
      if name.delete(' ').size > longest_name.size
        longest_name = name
      end
    end
  end
longest_name
end

def long_name_steals_a_ton?
longest_name = ""
  game_hash.each do |team_place, v|
    game_hash[team_place][:players].each do |name, data|
      if name.delete(' ').size > longest_name.size
        longest_name = name
      end
    end
  end
longest_name

most_steals = ["", 0]
  game_hash.each do |team_place, v|
    game_hash[team_place][:players].each do |name, data|
      if game_hash[team_place][:players][name][:steals] > most_steals[1]
        most_steals = [name, game_hash[team_place][:players][name][:steals]]
      end
    end
  end
  longest_name == most_steals[0]
end





#http://stackoverflow.com/questions/6040494/how-to-find-the-key-of-the-largest-value-hash



          
      






