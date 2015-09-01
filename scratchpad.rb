def big_shoe_rebounds
  shoe_array = []
  game_hash.each do |home_or_away, team_data|
    team_data.each do |team_key, team_value|
      if team_key == :players
        game_hash[home_or_away][:players].each do |name, stats|
          stats.each do |stat_key, stat_value| 
            if stat_key == :shoe
              shoe_array << stat_value
            end
          end          
        end
      end
    end
  end
  shoe_array.sort!.reverse!
  biggest_shoe = shoe_array[0]

#next find who has :shoe[value] == biggest_shoe


end