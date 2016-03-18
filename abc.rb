def game_hash
  abc=Hash.new

  abc={
    #:home => {
     # :team_name => "Brooklyn Nets",
      #:colors => [],
      #:players => {
       # :Alan_Anderson => {
        #  :number => 0,
         # :shoe => 16,
          #:points => 22,
          #:rebounds => 12,
          #:assists => 12,
          #:steals => 3,
          #:blocks => 1,
          #:slam_dunks => 1
          #}
       # }
      #},
    :away => {
      :team_name => "Charlotte Hornets",
      :slam_dunks => 1
      }

    }
  #puts abc.class
  return abc

end
def team_colors(abc)
  xyz={
    "Brooklyn Nets" => ["Black", "White"],
    "Charlotte Hornets" => ["Turquoise", "Purple"]
    }
 return xyz[abc].each {|i| i}
end
#team_colors("Brooklyn Nets")

def team_names
  #game_hash.each {|i| print i[0][:team_name]}
  #puts game_hash[:away][:team_name]
  game_hash.each do |i|
    i.each {|g| puts g[0]}
  end
end
team_names
game_hash[:away].invert[1]