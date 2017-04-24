# Write your code here!


#### -------- Game Hash -------- ###
def game_hash

  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: {
        'Alan Anderson' => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        'Reggie Evans' => {number: 30,
                            shoe: 14,
                            points: 12,
                            rebounds: 12,
                            assists: 12,
                            steals: 12,
                            blocks: 12,
                            slam_dunks: 7},
        'Brook Lopez' => {number: 11,
                            shoe: 17,
                            points: 17,
                            rebounds: 19,
                            assists: 10,
                            steals: 3,
                            blocks: 1,
                            slam_dunks: 15},
        'Mason Plumlee' => {number: 1,
                            shoe: 19,
                            points: 26,
                            rebounds: 12,
                            assists: 6,
                            steals: 3,
                            blocks: 8,
                            slam_dunks: 5},
        'Jason Terry' => {number: 31,
                            shoe: 15,
                            points: 19,
                            rebounds: 2,
                            assists: 2,
                            steals: 4,
                            blocks: 11,
                            slam_dunks: 1}
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        'Jeff Adrien' => {number: 4,
                            shoe: 18,
                            points: 10,
                            rebounds: 1,
                            assists: 1,
                            steals: 2,
                            blocks: 7,
                            slam_dunks: 2},
        'Bismak Biyombo' => {number: 0,
                            shoe: 16,
                            points: 12,
                            rebounds: 4,
                            assists: 7,
                            steals: 7,
                            blocks: 15,
                            slam_dunks: 10},
        'DeSagna Diop' => {number: 2,
                            shoe: 14,
                            points: 24,
                            rebounds: 12,
                            assists: 12,
                            steals: 4,
                            blocks: 5,
                            slam_dunks: 5},
        'Ben Gordon' => {number: 8,
                            shoe: 15,
                            points: 33,
                            rebounds: 3,
                            assists: 2,
                            steals: 1,
                            blocks: 1,
                            slam_dunks: 0},
        'Brendan Haywood' => {number: 33,
                            shoe: 15,
                            points: 6,
                            rebounds: 12,
                            assists: 12,
                            steals: 22,
                            blocks: 5,
                            slam_dunks: 12}
      }
    }
  }

end


#### -------- Returns Points Scored -------- ###

def num_points_scored(players_name)
  game_hash.each do |location, full_team_stats|
    full_team_stats.each do |stat_cat, stat|
      if stat_cat.to_s == 'players'
        stat.each do |player_name, player_stat_cat|
          if player_name.to_s == players_name
            player_stat_cat.each do |stat_cat, stat|
              if stat_cat.to_s == 'points'
              return stat
            end
            end
          end
        end
      end
    end
  end
end


#### -------- Returns Player Shoe Size -------- ###

def shoe_size(players_name)
  game_hash.each do |location, full_team_stats|
    full_team_stats.each do |stat_cat, stat|
      if stat_cat.to_s == 'players'
        stat.each do |player_name, player_stat_cat|
          if player_name.to_s == players_name
            player_stat_cat.each do |stat_cat, stat|
              if stat_cat.to_s == 'shoe'
              return stat
            end
            end
          end
        end
      end
    end
  end
end


#### -------- Returns Team Colors -------- ###

def team_colors(team)
  game_hash.each do |location, full_team_stats|
    full_team_stats.each do |stat_cat, stat|
      if stat == team
        full_team_stats.each do |stat_cat, stat|
          if stat_cat.to_s == "colors"
            return stat
          end
        end
      end
    end
  end
end


#### -------- Returns Team Names -------- ###

def team_names
  teams = []
  game_hash.each do |location, full_team_stats|
    full_team_stats.each do |full_team_stats, stat_cat|
      if full_team_stats.to_s == "team_name"
        teams.push(stat_cat)
      end
    end
  end
  return teams
end



#### -------- Returns Team Jersey Numbers -------- ###

def player_numbers(team)
  numbers = []

  game_hash.each do |location, teams|
    location_holder = ''
    teams.each do |stat_cat, stat|
      if stat == team
        location_holder = location
      end
      if stat_cat.to_s == "players" && location_holder.size > 0
        stat.each do |player, player_stat|
          player_stat.each do |key, value|
            if key.to_s == "number"
              numbers.push(value)
            end
          end
        end
      end
    end

  end
  return numbers
end




#### -------- Returns Complete Player Stat -------- ###

def player_stats(player)
  game_hash.each do |location, team|
    team.each do |stat_cat, stat|
      if stat_cat.to_s == "players"
        stat.each do |name, player_stat|
          if name == player
            return player_stat
          end
        end
      end
    end
  end
end


#### -------- Returns Number of Rebounds of Player with Biggest Shoe Size -------- ###

def big_shoe_rebounds
  shoe_size = 0
  player_rebounds = 0

  game_hash.each do |location, team|
    team.each do |stat_cat, stat|
      if stat_cat.to_s == 'players'
        stat.each do |player, player_stat|
          player_stat.each do |key, value|
            if key.to_s == 'shoe' && shoe_size < value
              shoe_size = value
            end
            if key.to_s == 'rebounds' 
              player_rebounds = value
            end
          end 
        end
      end
    end
  end
  return player_rebounds
end