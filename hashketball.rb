
def game_hash

game_hash = { :home => {team_name: "Brooklyn Nets",
                        colors: ["Black", "White"],
                    players: { "Alan Anderson" => {number: 0,
                                          shoe: 16,
                                          points: 22,
                                          rebounds: 12,
                                          assists: 12,
                                          steals: 3,
                                          blocks: 1,
                                          slam_dunks: 1},
                      "Reggie Evans" => {number: 30,
                                         shoe: 14,
                                         points: 12,
                                         rebounds: 12,
                                         assists: 12,
                                         steals: 12,
                                         blocks: 12,
                                         slam_dunks: 7},
                     "Brook Lopez" => {number: 11,
                                         shoe: 17,
                                         points: 17,
                                         rebounds: 19,
                                         assists: 10,
                                         steals: 3,
                                         blocks: 1,
                                         slam_dunks: 15},
                     "Mason Plumlee" => {number: 1,
                                         shoe: 19,
                                         points: 26,
                                         rebounds: 12,
                                         assists: 6,
                                         steals: 3,
                                         blocks: 8,
                                         slam_dunks: 5},
                     "Jason Terry" => {number: 31,
                                         shoe: 15,
                                         points: 19,
                                         rebounds: 2,
                                         assists: 2,
                                         steals: 4,
                                         blocks: 11,
                                         slam_dunks: 1}}},
           :away => {team_name: "Charlotte Hornets",
                    colors: ["Turquoise", "Purple"],
                    players: { "Jeff Adrien" => {number: 4,
                                                   shoe: 18,
                                                   points: 10,
                                                   rebounds: 1,
                                                   assists: 1,
                                                   steals: 2,
                                                   blocks: 7,
                                                   slam_dunks: 2},
                               "Bismak Biyombo" => {number: 0,
                                                  shoe: 16,
                                                  points: 12,
                                                  rebounds: 4,
                                                  assists: 7,
                                                  steals: 7,
                                                  blocks: 15,
                                                  slam_dunks: 10},
                              "DeSagna Diop" => {number: 2,
                                                  shoe: 14,
                                                  points: 24,
                                                  rebounds: 12,
                                                  assists: 12,
                                                  steals: 4,
                                                  blocks: 5,
                                                  slam_dunks: 5},
                              "Ben Gordon" => {number: 8,
                                                  shoe: 15,
                                                  points: 33,
                                                  rebounds: 3,
                                                  assists: 2,
                                                  steals: 1,
                                                  blocks: 1,
                                                  slam_dunks: 0},
                              "Brendan Haywood" => {number: 33,
                                                  shoe: 15,
                                                  points: 6,
                                                  rebounds: 12,
                                                  assists: 12,
                                                  steals: 22,
                                                  blocks: 5,
                                                  slam_dunks: 12}}}}
game_hash
end



def num_points_scored(playername)
  points = 0
  game_hash.each do |loc,upper|
    upper.each do |k,pnames|
      if k == :players
        pnames.each do |names,stats|
          if names == playername
            stats.each do |stat,value|
              if stat == :points
                points = value
              end
            end
          end
        end
      end
    end
  end
  points
end




def shoe_size(playername)
  size = 0
  game_hash.each do |loc,upper|
    upper.each do |k,pnames|
      if k == :players
        pnames.each do |names,stats|
          if names == playername
            stats.each do |stat,value|
              if stat == :shoe
                size = value
              end
            end
          end
        end
      end
    end
  end
  size
end




def team_colors(teamname)
  color_array=[]
  if game_hash[:home][:team_name]==teamname
    color_array = game_hash[:home][:colors]
  elsif game_hash[:away][:team_name]==teamname
    color_array = game_hash[:away][:colors]
  else
    puts "That team is not in this game."
  end
  color_array
end





def team_names
  team_name_array = []
  game_hash.each do |loc,upper|
    upper.each do |k,v|
      if k == :team_name
        team_name_array << v
      end
    end
  end
  team_name_array
end





def player_numbers(teamname)
  jerseys=[]
  if game_hash[:home][:team_name]==teamname
      game_hash[:home].each do |k,pnames|
        if k == :players
          pnames.each do |names,stats|
            stats.each do |stat,value|
                if stat == :number
                  jerseys << value
                end
              end
            end
          end
        end
  elsif game_hash[:away][:team_name]==teamname
    game_hash[:away].each do |k,pnames|
      if k == :players
        pnames.each do |names,stats|
          stats.each do |stat,value|
              if stat == :number
                jerseys << value
              end
            end
          end
        end
      end
  else
    puts "That team is not in this game."
  end
  jerseys
end




def player_stats(playername)
  stats = {}
  if game_hash[:home][:players].keys.include?(playername)
    stats = game_hash[:home][:players][playername]
  elsif game_hash[:away][:players].keys.include?(playername)
    stats = game_hash[:away][:players][playername]
  else
    puts "That player is not in this game."
  end
  stats
end


def big_shoe_rebounds
  bigarray = []
  splitarray = []
  game_hash.each do |loc,upper|
    upper.each do |k,pnames|
      if k == :players
        pnames.each do |names,stats|
          #bigarray << names
            stats.each do |stat,value|
              if stat == :shoe
                bigarray << value
              end
              if stat == :rebounds
                bigarray << value
              end
            end
          end
        end
      end
    end
  bigarray
  splitarray = bigarray.each_slice(2).to_a
  splitarray.sort!
  splitarray.flatten!
  splitarray[-1]

end
