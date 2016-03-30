require "pry"


def game_hash
{
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => {
            "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
            "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
            "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
            "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
            "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
        }
    },
    :away => {
        :team_name => "Charlotte Hornets",
        :colors => ["Turquoise", "Purple"],
        :players => {
            "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
            "Bismak Biyombo"=> {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
            "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
            "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
            "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
        }
    }
}
    
     
end


def num_points_scored(name)
    game_hash.each do |home_away, tcp|
        tcp.each do |tcp, tcp_details|
            if tcp == :players
                tcp_details.each do |player, attributes|
                    if player == name
                        return attributes[:points]
                    end
                end
            end
        end
    end
    "Player not found."
end

def shoe_size(name)
    game_hash.each do |key1, value1|
        value1.each do |key2, value2|
            if key2 == :players
                value2.each do |key3, value3|
                    if key3 == name
                        return value3[:shoe]
                    end
                end
            end
        end
    end
    "Player not found."
end
        
def team_colors(team)
    game_hash.each do |key1, value1|
        if value1[:team_name] == team
        return game_hash[key1][:colors]
        end
    end
    "Team not found."
end

def team_names
    game_hash.collect do |key1, value1| #value1 represents the HASH not the three symbols in that hash. That's why you callvalue1brefore[:teamname]
    value1[:team_name]
    end
end

def player_numbers(team)
    names = []
    game_hash.each do |key1, value1|
        if value1[:team_name] == team
        value1.each do |key2, value2|
            if key2 == :players
            value2.each do |key3, value3|
                names << value3[:number]
            end
            end
        end
        end
    end
    names
end

def player_stats(name)
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if key2 == :players
        value2.each do |key3, value3|
          if key3 == name
            return value3
          end
        end
      end
    end
  end
end

def big_shoe_rebounds 
  big_shoe = 0
  associated_rebounds = 0
  game_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if value2.class == Hash              #same function as if key2 == :players
        value2.each do |key3, value3|
          if value3[:shoe] > big_shoe
            big_shoe = value3[:shoe]
            associated_rebounds = value3[:rebounds]
          end
        end
      end
    end
  end 
  associated_rebounds 
end

        
        









                
            
            


