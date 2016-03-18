def game_hash
  abc={
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => [],
      :players => {
        :Alan_Anderson => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
          }
        }
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => [],
      :players => {
      }

    }
    }
  return abc
end

def num_points_scored(abc)
  xyz ={
    "Jeff Adrien" => 10,
    "Bismak Biyombo" => 12,
    "DeSagna Diop" => 24,
    "Ben Gordon" => 33,
    "Brendan Haywood" => 6,
    "Alan Anderson" => 22,
    "Reggie Evans" => 12,
    "Brook Lopez" => 17,
    "Mason Plumlee" => 26,
    "Jason Terry" => 19
    }
  return xyz[abc]

end


def shoe_size(abc)
  xyz={
    "Jeff Adrien" => 18,
    "Bismak Biyombo" => 16,
    "DeSagna Diop" => 14,
    "Ben Gordon" => 15,
    "Brendan Haywood" => 15,
    "Alan Anderson" => 16,
    "Reggie Evans" => 14,
    "Brook Lopez" => 17,
    "Mason Plumlee" => 19,
    "Jason Terry" => 15
    }
  return xyz[abc]

end


def team_colors(abc)
  xyz={
    "Brooklyn Nets" => ["Black", "White"],
    "Charlotte Hornets" => ["Turquoise", "Purple"]
    }
  return xyz[abc].each {|i| i}
end



def team_names
  return game_hash.collect {|i, g| g[:team_name]}
end

def player_numbers(abc)
  xyz={
   "Charlotte Hornets"  => [0, 2, 4, 8, 33],
    "Brooklyn Nets" => [0, 1, 11, 30, 31]
    }
  return xyz[abc]


end

def player_stats(abc)
  xyz = { "Jeff Adrien" => {
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
      },
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
  return xyz[abc]
end

def big_shoe_rebounds
    xyz={
    "Jeff Adrien" => 18,
    "Bismak Biyombo" => 16,
    "DeSagna Diop" => 14,
    "Ben Gordon" => 15,
    "Brendan Haywood" => 15,
    "Alan Anderson" => 16,
    "Reggie Evans" => 14,
    "Brook Lopez" => 17,
    "Mason Plumlee" => 19,
    "Jason Terry" => 15
    }
  shoe_size=0
  name=""
  xyz.each do |i,g|
    if g>shoe_size
      shoe_size=g
      name=i
    end

  end
  return player_stats(name)[:rebounds]

end

big_shoe_rebounds