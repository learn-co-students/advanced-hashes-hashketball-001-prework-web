def game_hash
game_hash = {
  :home=>{
  :team_name=>"Brooklyn Nets",
  :colors=>["Black", "White"],
  :players=>{
    "Alan Anderson"=>{:number=>0, :shoe=>16, :points=>22, :rebounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1},
    "Reggie Evans"=>{:number=>30, :shoe=>14, :points=>12, :rebounds=>12, :assists=>12, :steals=>12, :blocks=>12, :slam_dunks=>7},
    "Brook Lopez"=>{:number=>11, :shoe=>17, :points=>17, :rebounds=>19, :assists=>10, :steals=>3, :blocks=>1, :slam_dunks=>15},
    "Mason Plumlee"=>{:number=>1, :shoe=>19, :points=>26, :rebounds=>12, :assists=>6, :steals=>3, :blocks=>8, :slam_dunks=>5},
    "Jason Terry"=>{:number=>31, :shoe=>15, :points=>19, :rebounds=>2, :assists=>2, :steals=>4, :blocks=>11, :slam_dunks=>1}
    }
  },
 :away=>{
  :team_name=>"Charlotte Hornets",
  :colors=>["Turquoise", "Purple"],
  :players=>{
    "Jeff Adrien"=>{:number=>4, :shoe=>18, :points=>10, :rebounds=>1, :assists=>1, :steals=>2, :blocks=>7, :slam_dunks=>2},
    "Bismak Biyombo"=>{:number=>0, :shoe=>16, :points=>12, :rebounds=>4, :assists=>7, :steals=>7, :blocks=>15, :slam_dunks=>10},
    "DeSagna Diop"=>{:number=>2, :shoe=>14, :points=>24, :rebounds=>12, :assists=>12, :steals=>4, :blocks=>5, :slam_dunks=>5},
    "Ben Gordon"=>{:number=>8, :shoe=>15, :points=>33, :rebounds=>3, :assists=>2, :steals=>1, :blocks=>1, :slam_dunks=>0},
    "Brendan Haywood"=>{:number=>33, :shoe=>15, :points=>6, :rebounds=>12, :assists=>12, :steals=>22, :blocks=>5, :slam_dunks=>12}
    }
  }
}
game_hash
end

def num_points_scored(players)
  a=[]
  game_hash.each do |status, team|
    if game_hash[status]
       team.each do |attributes, summary|
         if attributes==:players
         summary.each do |player, data|
          if player==players
            data.each do |data, ans|
              if data==:points
                a<<ans
              end
            end
          end
         end
        end
       end
     end
end
a.pop
end

def shoe_size(players)
  a=[]
  game_hash.each do |status, team|
       team.each do |attributes, summary|
         if attributes==:players
         summary.each do |player, data|
          if player==players
            data.each do |data, ans|
              if data==:shoe
                a<<ans
              end
            end
          end
         end
        end
       end
     end
a.pop
end


def team_colors(team_name)
d=[]
e=''

game_hash.each do |k1, v1|  
    v1.each do |k2, v2|
      if v2==team_name
        e=k1
      end
    end
  end
  game_hash[e][:colors].collect { |e|  d << e}
  d
end



def team_names
e=[]
game_hash.each do |k1, v1|  
    v1.each do |k2, v2|
      if k2==:team_name
        e << v2
      end
    end
  end
e
end

def player_numbers(team)
e=[]
f=''
game_hash.each do |k1, v1|  
    v1.each do |k2, v2|
      if v2==team
        f=k1
      end
    end
  end
game_hash[f][:players].each do |k3,v3|
  v3.each do |k4,v4|
    if k4==:number
    e << v4
    end
  end
end
e.sort

end

def player_stats(player)
  g=[]
  h=''
  game_hash.each do |k1, v1|  
    v1.each do |k2, v2|
      if k2==:players
        v2.each do |k3, v3|
          if k3==player
           h=k1
          end
        end
      end
    end
  end
  game_hash[h][:players][player].each { |e| e}
end


def big_shoe_rebounds
   shoe_sizes = []
    game_hash.collect do |location, team|
      team[:players].collect do |attribute, data|
        shoe_sizes << data[:shoe]
        if team[:players][attribute][:shoe] == shoe_sizes.max
          return team[:players][attribute][:rebounds]
        end
      end
    end
  end
# Write your code here!

big_shoe_rebounds


