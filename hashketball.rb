  def game_hash
    nba_hash = {

      home:

        {

          team_name:  "Brooklyn Nets",

          colors:  ["Black", "White"],

          players:  {

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

                number: 30,

                shoe: 14,

                points: 12,

                rebounds: 12,

                assists: 12,

                steals: 12,

                blocks: 12,

                slam_dunks: 7

                     },




             "Brook Lopez" =>

              {

                number: 11,

                shoe: 17,

                points: 17,

                rebounds: 19,

                assists: 10,

                steals: 3,

                blocks: 1,

                slam_dunks: 15

                },

             "Mason Plumlee" =>

              {

                number: 1,

                shoe: 19,

                points: 26,

                rebounds: 12,

                assists: 6,

                steals: 3,

                blocks: 8,

                slam_dunks: 5

                },

               "Jason Terry" =>

                            {

                number: 31,

                shoe: 15,

                points: 19,

                rebounds: 2,

                assists: 2,

                steals: 4,

                blocks: 11,

                slam_dunks: 1

                }

            }

      },




       away:

         {

          team_name: "Charlotte Hornets",

          colors:  ["Turquoise", "Purple"],

          players:  {

            "Jeff Adrien" =>

              {

              number: 4,

              shoe: 18,

              points: 10,

              rebounds: 1,

              assists: 1,

              steals: 2,

              blocks: 7,

              slam_dunks: 2

              },

             "Bismak Biyombo" =>

              {

              number: 0,

              shoe: 16,

              points: 12,

              rebounds: 4,

              assists: 7,

              steals: 7,

              blocks: 15,

              slam_dunks: 10

              },




             "DeSagna Diop" =>

              {

              number: 2,

              shoe: 14,

              points: 24,

              rebounds: 12,

              assists: 12,

              steals: 4,

              blocks: 5,

              slam_dunks: 5

              },

              "Ben Gordon" =>

              {

              number: 8,

              shoe: 15,

              points: 33,

              rebounds: 3,

              assists: 2,

              steals: 1,

              blocks: 1,

              slam_dunks: 0

              },

              "Brendan Haywood" =>

                            {

              number: 33,

              shoe: 15,

              points: 6,

              rebounds: 12,

              assists: 12,

              steals: 22,

              blocks: 5,

              slam_dunks: 12

              }

           }

       }




     }

end




def num_points_scored(player_name)




  game_hash.each do |loc, team_info|

#key home away

 #val team-name, colors, players

      team_info[:players].each do |name, stats|

# key name

# val number=>0, :shoe=>16, :points=>22, :re

# bounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1

        stats.each do |att, val|

          if name == player_name

            return stats[:points]

          end

        end

      end




  end




end

def shoe_size(player_name)




  game_hash.each do |loc, team_info|

#key home away

 #val team-name, colors, players

      team_info[:players].each do |name, stats|

# key name

# val number=>0, :shoe=>16, :points=>22, :re

# bounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1

        stats.each do |att, val|

          if name == player_name

            return stats[:shoe]

          end

        end

      end

  end

end




def team_colors(team_name)


  game_hash.each do |loc, team_info|

#key home away

 #val team-name, colors, players

      team_info.each do |info, val|

# key team-name, colors, players

# val

         if val == team_name

            return team_info[:colors]

          end

      end

  end

end




def team_names

  teams =[]

  game_hash.each do |loc, team_info|

#key home away

 #val team-name, colors, players

#       team_info.each do |info, val|

# # key team-name, colors, players

# # val

      teams << game_hash[loc][:team_name]




  end

  return teams

end




def player_numbers(ball_name)

  jersey_box =[]

  game_hash.each do |loc, team_info|

#key home away

 #val team-name, colors, players

      team_info[:players].each do |name, stats|

# key name

# val number=>0, :shoe=>16, :points=>22, :re

# bounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1

         if team_info[:team_name] == ball_name

           jersey_box << stats[:number]

         end

     end

  end

  return jersey_box

end




def player_stats(player_name)

  game_hash.each do |loc, team_info|

#key home away

 #val team-name, colors, players

      team_info[:players].each do |name, stats|

# key name

# val number=>0, :shoe=>16, :points=>22, :re

# bounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1

          stats.each do |att, val|

            if name == player_name

              return stats

            end

          end

      end

   end

end







def big_shoe_rebounds

    shoe_box =[]

    game_hash.each do |loc, team_info|

            #key home away

             #val team-name, colors, players

        team_info[:players].each do |name, stats|

      # key name

      # val number=>0, :shoe=>16, :points=>22, :re

      # bounds=>12, :assists=>12, :steals=>3, :blocks=>1, :slam_dunks=>1

            stats.each do |att, val|

              shoe_box << stats[:shoe]

            end

        end

    end

          sort_box = shoe_box.sort

          lrg = sort_box.pop




  game_hash.each do |loc, team_info|

            #key home away

             #val team-name, colors, players

     team_info[:players].each do |name, stats|




              if stats[:shoe] == 16

                return stats[:rebounds]

              end




      end

  end

end
