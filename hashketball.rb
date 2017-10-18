def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {:name=>"Alan Anderson", :number=>"0", :shoe=>"16", :points=>"22", :rebounds=>"12", :assists=>"12", :steals=>"3", :blocks=>"1", :slam_dunks=>"1"},
        {:name=>"Reggie Evans", :number=>"30", :shoe=>"14", :points=>"12", :rebounds=>"12", :assists=>"12", :steals=>"12", :blocks=>"12", :slam_dunks=>"7"},
        {:name=>"Brook Lopez", :number=>"11", :shoe=>"17", :points=>"17", :rebounds=>"19", :assists=>"10", :steals=>"3", :blocks=>"1", :slam_dunks=>"15"},
        {:name=>"Mason Plumlee", :number=>"1", :shoe=>"19", :points=>"26", :rebounds=>"12", :assists=>"6", :steals=>"3", :blocks=>"8", :slam_dunks=>"5"},
        {:name=>"Jason Terry", :number=>"31", :shoe=>"15", :points=>"19", :rebounds=>"2", :assists=>"2", :steals=>"4", :blocks=>"11", :slam_dunks=>"1"}
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {:name=>"Jeff Adrien", :number=>"4", :shoe=>"18", :points=>"10", :rebounds=>"1", :assists=>"1", :steals=>"2", :blocks=>"7", :slam_dunks=>"2"},
        {:name=>"Bismak Biyombo", :number=>"0", :shoe=>"16", :points=>"12", :rebounds=>"4", :assists=>"7", :steals=>"7", :blocks=>"15", :slam_dunks=>"10"},
        {:name=>"DeSagna Diop", :number=>"2", :shoe=>"14", :points=>"24", :rebounds=>"12", :assists=>"12", :steals=>"4", :blocks=>"5", :slam_dunks=>"5"},
        {:name=>"Ben Gordon", :number=>"8", :shoe=>"15", :points=>"33", :rebounds=>"3", :assists=>"2", :steals=>"1", :blocks=>"1", :slam_dunks=>"0"},
        {:name=>"Brendan Haywood", :number=>"33", :shoe=>"15", :points=>"6", :rebounds=>"12", :assists=>"12", :steals=>"22", :blocks=>"5", :slam_dunks=>"12"}
      ]
    }
  }
end

def num_points_scored(target_player)
  points = nil

  game_hash.each do |team, team_info|
    team_info.each do |team_info, players_array|
      if team_info == :players

        players_array.each do |item|

          item.each do |k,v|
            if k == :name && item[k] == target_player
              points = item[:points].to_i
            end
          end

          
        end
      end
    end
  end
  points
end

def shoe_size(target_player)
  size = nil

  game_hash.each do |team, team_info|
    team_info.each do |team_info, players_array|
      if team_info == :players

        players_array.each do |item|

          item.each do |k,v|
            if k == :name && item[k] == target_player
              size = item[:shoe].to_i
            end
          end

          
        end
      end
    end
  end
  size
end

def team_colors(selected_team)
  colors = nil

  game_hash.each do |team, team_info|
    team_info.each do |team_info, value|
      if team_info == :team_name
        if game_hash[team][team_info] == selected_team
          colors = game_hash[team][:colors]
        end
      end
    end
  end
  colors
end

def team_names
  name_of_teams = []
  game_hash.each do |team, team_info|
    team_info.each do |team_info, value|
      if team_info == :team_name
        name_of_teams << value
      end
    end
  end
  name_of_teams
end


def player_numbers(selected_team)
  all_player_numbers = []

  game_hash.each do |team, team_info|
    team_info.each do |team_info, value|
      if game_hash[team][:team_name] == selected_team
        if game_hash[team][:players] == value
          players_array = value
          players_array.each do |item|
            item.each do |k,v|
              if k == :number
                all_player_numbers << v.to_i
              end
            end
          end
        end
      end
    end
  end

  all_player_numbers
end


def player_stats(selected_player)
  selected_players_stats = nil

  game_hash.each do |team, team_info|
    team_info.each do |team_info, value|
      if team_info == :players
        value.each do |item|
          item.each do |k,v|
            if k == :name
              if v == selected_player
                selected_players_stats = item
              end
            end
          end
        end
      end
    end
  end

  selected_players_stats.delete(:name)
  return_hash = {}
  selected_players_stats.each do |k,v|
    return_hash[k] = v.to_i
  end
  return_hash
end

def big_shoe_rebounds
  biggest_shoe = [0]
  biggest_shoe_size_player = []
  current_player = ""

  game_hash.each do |team, team_info|
    team_info.each do |team_info, value|
      if team_info == :players
        value.each do |item|

          item.each do |k,v|
            if k == :name
              current_player = v
            end


            if k == :shoe
              if v.to_i > biggest_shoe.last
                biggest_shoe << v.to_i
                biggest_shoe_size_player << current_player
              end
            end
          end

        end
      end
    end
  end

  biggest_shoe_size_player = biggest_shoe_size_player.last
  number_of_rebounds = nil

  game_hash.each do |team, team_info|
    team_info.each do |team_info, value|
      if team_info == :players
        value.each do |hash|
          hash.each do |k,v|
            
            if v == biggest_shoe_size_player
                number_of_rebounds = hash[:rebounds].to_i
            end

          end
        end
      end
    end
  end

 number_of_rebounds
end

























