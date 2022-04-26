#require 'pry'

class Player
    attr_accessor :name, :life_points
    @@all_users= []

    def initialize(name)
        @name = name
        @life_points = 10
        @@all_users << self
    end

    def show_state #définis le nombre de points de vie 
        puts "#{@name} a #{@life_points} points de vie !"
    end

    def gets_damage(number_damages) #calcule la perte de points de vie
        @life_points = @life_points - number_damages
        if @life_points <= 0
        puts "#{@name} est mort !"
        end
    end

    def attacks(player)
        puts "#{name} décide d'attaquer #{player.name}"
        damage = compute_damage
        puts "il lui inflige #{damage} points de dommage"
        return player.gets_damage(damage)
       
    end

    def compute_damage
        return rand(1..6) #calcule un nombre au hasard entre 1 et 6
    end


end



class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize (name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state 
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}!"
    end

    def compute_damage
        rand(1..6) * @weapon_level
      end


      def search_weapon
        weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon}"
        if weapon > @weapon_level 
            @weapon_level  = weapon
            puts "youhou tu la prends"
        else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle.."
        end
      end

      def search_health_pack
        health = rand(1..6)
        if health == 1
            puts "Tu n'as rien trouvé... "
        elsif health >= 2 && health <= 5
                @life_points  = @life_points + 50 and @life_points <100
                puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        else health == 6 
            @life_points = @life_points + 80 and @life_points <100
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
      end



end
#binding.pry