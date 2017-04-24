require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        :Alan_Anderson => {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        :Reggie_Evans => {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        :Brook_Lopez => {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        :Mason_Plumlee => {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        :Jason_Terry => {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        },
      }
    }, 
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        :Jeff_Adrien => {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        :Bismak_Biyombo => {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        :DeSagna_Diop => {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        :Ben_Gordon => {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        :Brendan_Haywood => {
          :player_name => "Brendan Haywood",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        },
      }
    }
  }
end


def num_points_scored(player)
  nameSym = player.split(" ").join("_").to_sym #convert player name to a symbol, with underscores replacing spaces
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash) #if value does not contain a hash, move on to the next key in the hash
      data1.each do |data2, info2|
        if info2.is_a?(Hash)
          info2.each do |value3, stat3|
            if value3 == nameSym
              stat3.each do |stat4, value4|
                if stat4 == :points
                  return value4
                end
              end
            end
          end
        end
      end
    end
  end
end


def shoe_size(player_name) #see #num_points_scored for details on how this method works
  nameSym = player_name.split(" ").join("_").to_sym
  game_hash.each do |team1, team_data1| #level 1 of hash
    if team_data1.is_a?(Hash)
      team_data1.each do |team_data2, values2| #level 2 of hash
        if values2.is_a?(Hash)
          values2.each do |value3, attribute3| #level 3 of hash
            if value3 == nameSym
              attribute3.each do |stat4, value4|
                if stat4 == :shoe
                  return value4
                end
              end
            end
          end
        end
      end
    end 
  end
end

def team_colors(team_name)
  game_hash.each do |team1, team_data1|
    if team_data1.is_a?(Hash)
      team_data1.each do |team_data2, team_info2|
        if game_hash[team1][team_data2] == team_name
          return game_hash[team1][:colors]
        end
      end
    end
  end
end


def team_names
  array = []
  game_hash.each do |team1, team_data1|
    team_data1.each do |team_data2, values2|
      if team_data2 == :team_name
        array << game_hash[team1][team_data2]
      end
    end
  end
  array
end

def player_numbers(team_name)
  array = [] #create an array to store jersey numbers
  game_hash.each do |team1, data1| #start enumrating over the first level (teams and team data)
    data1.each do |data2, info2|
      if info2.include?(team_name) #if the hash value contains the team name, iterate down into it 
        if data1.is_a?(Hash) #if the value is a hash, iterate on it, otherwise move onto the next one
          data1.each do |data2, info2|
            if info2.is_a?(Hash)
              info2.each do |value3, attribute3|
                if attribute3.is_a?(Hash)
                  attribute3.each do |stat4, value4|
                    if stat4 == :number
                      array << value4 #addit to the array
                    end
                  end
                end
              end
            end
          end
        end
      return array #return the array of jersey numbers for the team
      end
    end
  end
end


def player_stats(player)
  nameSym = player.split(" ").join("_").to_sym #convert player name to a symbol, with underscores replacing spaces
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash) #if value does not contain a hash, move on to the next key in the hash
      data1.each do |data2, info2|
        if info2.is_a?(Hash)
          info2.each do |value3, stat3|
            if value3 == nameSym
              stat3.delete_if do |stat4, value4|
                stat4 == :player_name
              end
              return stat3
            end
          end
        end
      end
    end
  end
end


def collect_shoes #the output of this method is called in #big_shoe_rebounds
  array = []
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash) #if value does not contain a hash, move on to the next key in the hash
      data1.each do |data2, info2|
        if info2.is_a?(Hash)
          info2.each do |value3, stat3|
            if stat3.is_a?(Hash)
              stat3.each do |stat4, value4|
                if stat4 == :shoe
                  array << value4
                end
              end
            end
          end
        end
      end
    end
  end
  return array.max
end



def big_shoe_rebounds
  shoe = collect_shoes #take the first (largest) number of the array
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash) #if value does not contain a hash, move on to the next key in the hash
      data1.each do |data2, info2|
        if info2.is_a?(Hash)
          info2.each do |value3, stat3|
            if stat3.is_a?(Hash)
              stat3.each do |stat4, value4|
                if shoe == game_hash[team1][data2][value3][:shoe] #check to see if the player's shoe size is equal to the shoe size we stored earlier
                  return game_hash[team1][data2][value3][:rebounds] #return rebounds for that player
                end
              end
            end
          end
        end
      end
    end
  end
end

#
##
### BONUS QUESTIONS
##
#

def collect_points #the output of this method is called in #most_points_scored
  array = []
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash)
      data1.each do |data2, teaminfo2|
        if teaminfo2.is_a?(Hash)
          teaminfo2.each do |teaminfo3, value3|
            if value3.is_a?(Hash)
              value3.each do |stat4, value4|
                if stat4 == :points
                  array << value4
                end
              end
            end
          end
        end
      end
    end
  end
  return array.max
end


def most_points_scored #uses the output from #collect_points
  points = collect_points
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash)
      data1.each do |data2, info2|
        if info2.is_a?(Hash)
          info2.each do |info3, value3|
            if value3.is_a?(Hash)
              value3.each do |stat4, value4|
                if points == game_hash[team1][data2][info3][:points]
                  return game_hash[team1][data2][info3][:player_name]
                end
              end
            end
          end
        end
      end
    end
  end
end


def winning_team
  # first, create variables for storing team name and team points
  home_name = ""
  away_name = ""
  home_points = 0 
  away_points = 0
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash)
      data1.each do |data2, info2|
        if data2 == :team_name && team1 == :home #if we're in the :home hash, store the home team name
          home_name = info2
        else data2 == :team_name && team1 == :away #if we're in the :away hash, store the away team name
          away_name = info2
        end
        if info2.is_a?(Hash)
          info2.each do |info3, value3|
            if value3.is_a?(Hash)
              value3.each do |stat4, value4|
                if stat4 == :points && team1 == :home #if we're in the :home hash, store home poionts
                  home_points += value4
                elsif stat4 == :points && team1 == :away #if we're in the :away hash store away points
                  away_points += value4
                else
                  next
                end
              end
            end
          end
        end
      end
    end
  end
  if home_points > away_points #return whichever team has the most points after comparison
    return home_name
  else
    return away_name
  end
end


def player_length_int(player) #convert the player's name (string) into an integer after summing the codpeoints of each character
  array = player.split(%r{\s*})
  count = 0
  array.each do |letter|
    count += letter.ord
  end
  return count
end

def collect_players #collect all players, add their codepoint name length sum to an array, then return the largest one
  array = []
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash)
      data1.each do |data2, info2|
        if info2.is_a?(Hash)
          info2.each do |info3, value3|
            if value3.is_a?(Hash)
              value3.each do |stat4, value4|
                if stat4 == :player_name
                  array << player_length_int(value4)
                end
              end
            end
          end
        end
      end
    end
  end
  longestname = array.max
  return longestname
end


def player_with_longest_name #iterate over the hash again and check for a match between output of #collect_players and each player codepoint sum
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash)
      data1.each do |data2, info2|
        if info2.is_a?(Hash)
          info2.each do |info3, value3|
            if value3.is_a?(Hash)
              value3.each do |stat4, value4|
                if stat4 == :player_name && collect_players == player_length_int(value4)
                  return value4
                end
              end
            end
          end
        end
      end
    end
  end
end



#
##
### SUPER BONUS QUESTION
##
#


def collect_steals #collect all the steals from the hash and return the largest number
  array = []
  game_hash.each do |team1, data1|
    if data1.is_a?(Hash)
      data1.each do |data2, info2|
        if info2.is_a?(Hash)
          info2.each do |info3, value3|
            if value3.is_a?(Hash)
              value3.each do |stat4, value4|
                if stat4 == :steals
                  array << value4
                end
              end
            end
          end
        end
      end
    end
  end
  return array.max
end

def long_name_steals_a_ton? #return true if the output of #player_with_longest_name has the most number of steals
  points = collect_steals #output of #collect_steals
  player = player_with_longest_name #output of player_with_longest_name
  game_hash.each do |team1, data1| 
    if data1.is_a?(Hash)
      data1.each do |data2, info2|
        if info2.is_a?(Hash)
          info2.each do |info3, value3|
            if value3.is_a?(Hash)
              value3.each do |stat4, value4|
                if stat4 == :steals && value4 == points && game_hash[team1][data2][info3][:player_name] == player
                  return true
                end
              end
            end
          end
        end
      end
    end
  end
end



