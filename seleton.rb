def game_hash
  hash = {
    :home => {
      :team_name => "",
      :colors => [""],
      :players => {
        "name" => {:stat => int, :stat_2 => int}, 
        "name_2" => {:stat => int, :stat_2 => int}
      },
    :team_name => "",
      :colors => [""],
      :players => {
        "name" => {:stat => int, :stat_2 => int}, 
        "name_2" => {:stat => int, :stat_2 => int}
      }
  }
end