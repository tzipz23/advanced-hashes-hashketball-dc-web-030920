require 'pry'

def game_hash
  hash = {
  :away => {:team_name => "Charlotte Hornets",
  :colors => ["Turquoise", "Purple"],
  :players =>        
   [
     {:player_name => "Jeff Adrien",
     :number => 4,
     :shoe => 18,
     :points => 10,
     :rebounds => 1,
     :assists => 1,
     :steals => 2,
     :blocks => 7,
     :slam_dunks => 2
     },
     {:player_name => "Bismack Biyombo",
     :number => 0,
     :shoe => 16,
     :points => 12,
     :rebounds => 4,
     :assists => 7,
     :steals => 22,
     :blocks => 15,
     :slam_dunks => 10
     },
     {:player_name => "DeSagna Diop",
     :number => 2,
     :shoe => 14,
     :points => 24,
     :rebounds => 12,
     :assists => 12,
     :steals => 4,
     :blocks => 5,
     :slam_dunks => 5
     },
     {:player_name => "Ben Gordon",
     :number => 8,
     :shoe => 15,
     :points => 33,
     :rebounds => 3,
     :assists => 2,
     :steals => 1,
     :blocks => 1,
     :slam_dunks => 0
     },
     {:player_name => "Kemba Walker",
     :number => 33,
     :shoe => 15,
     :points => 6,
     :rebounds => 12,
     :assists => 12,
     :steals => 7,
     :blocks => 5,
     :slam_dunks => 12}
     ]
  },
  :home => { :team_name => "Brooklyn Nets",
  :colors => ["Black", "White"],
  :players =>
   [
     {:player_name => "Alan Anderson",
     :number => 0,
     :shoe => 16,
     :points => 22,
     :rebounds => 12,
     :assists => 12,
     :steals => 3,
     :blocks => 1,
     :slam_dunks => 1
     },
     {:player_name => "Reggie Evans",
     :number => 30,
     :shoe => 14,
     :points => 12,
     :rebounds => 12,
     :assists => 12,
     :steals => 12,
     :blocks => 12,
     :slam_dunks => 7
     },
     {:player_name => "Brook Lopez",
     :number => 11,
     :shoe => 17,
     :points => 17,
     :rebounds => 19,
     :assists => 10,
     :steals => 3,
     :blocks => 1,
     :slam_dunks => 15
     },
     {:player_name => "Mason Plumlee",
     :number => 1,
     :shoe => 19,
     :points => 26,
     :rebounds => 11,
     :assists => 6,
     :steals => 3,
     :blocks => 8,
     :slam_dunks => 5
     },
     {:player_name => "Jason Terry",
     :number => 31,
     :shoe => 15,
     :points => 19,
     :rebounds => 2,
     :assists => 2,
     :steals => 4,
     :blocks => 11,
     :slam_dunks => 1
        }
      ]
    }
  }
end

def player_info(players_name)
   game_hash.each do |location, team_data| 
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_info|
          if player_info[:player_name] == players_name
            return player_info 
          
          end
        end
      end
    end 
  end
end

def num_points_scored(name)
  
  return player_info(name)[:points]
  
  # # given the name of the player return the points 
  # game_hash.each do |location, team_data| 
  #   team_data.each do |attribute, data|
  #     if attribute == :players
  #       data.each do |player_info|
  #         if player_info[:player_name] == players_name
  #           return player_info[:points]
          
  #         end
  #       end
  #     end
  #   end 
  # end
  
  
  
  
  
  
  
  
  
  
  
  # returns # of points for player passed in
  # game_hash.each do |place, team|
  #   team.each do |attribute, data|
  #     if attribute == :players
  #       data.each do |player|
  #         if player[:player_name] == players_name
  #           return player[:points]
  #         end
  #       end
  #     end
  #   end
  # end
 end

def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def team_names
  new_arr = []
  game_hash.each do |place, team|
    new_arr << team[:team_name]
  end
  new_arr
end

def player_numbers(team_name)
    # retrun array of jersey number for that team_name
   nums = []
   game_hash.each do |place, team|
     if team[:team_name] == team_name
       team.each do |attributes, data|
         if attributes == :players
           data.each do |player|
             nums << player[:number]
           end
         end
       end
     end
   end
   nums
 end

def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == players_name
            new_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end






def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
        if player[:shoe] > big_shoe
          big_shoe = player[:shoe]
          rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end



def most_points_scored
  most_points = 0
  points_owner = ""
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        points_owner = player[:player_name]
      end
    end
  end
  points_owner
end



def winning_team
  home_score = 0
  away_score = 0
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
      if place == :away
        away_score += player[:points]
      else
        home_score += player[:points]
      end
    end
   end
    if away_score > home_score
     return game_hash[:away][:team_name]
    else
      return game_hash[:home][:team_name]
  end
end



def winning_team
  home_score = 0
  away_score = 0
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
      if place == :away
        away_score += player[:points]
      else
        home_score += player[:points]
      end
    end
   end
    if away_score > home_score
     return game_hash[:away][:team_name]
    else
      return game_hash[:home][:team_name]
  end
end



def player_with_longest_name
  longest = ''
  longest_length = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      name_length = player[:player_name].length
      longest, longest_length = player[:player_name], name_length if name_length > longest_length
    end
  end
  return longest
end



def long_name_steals_a_ton?
  longest_name = ""
  most_steals = 0
  game_hash.each do |place, team_stats|
    team_stats[:players].each do |player|
      if longest_name.length < player[:player_name].length
        longest_name = player[:player_name]
      if most_steals < player[:steals]
        most_steals = player[:steals]
          
        return true
          end
        end
      end
    end
  end
