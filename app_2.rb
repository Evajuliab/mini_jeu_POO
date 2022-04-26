require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Quel est ton prénom ?"
puts name = gets.chomp

player1 = Player.new('Josiane')
player2 = Player.new('José')
name = HumanPlayer.new(name)

while name.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    
    puts name.show_state

    puts "Quelle action veux tu effectuer ?
a - chercher une meilleure arme
s - chercher à se soigner

Attaquer un joueur en vue :"
puts "tape 0 pour attaquer Josiane  #{player1.show_state}"
puts "tape 1 pour attaquer José  #{player2.show_state}"
print "> "
choice = gets.chomp.to_s

if choice == "a"
    puts name.search_weapon
elsif choice == "s"
    puts name.search_health_pack
elsif choice == "0"
    puts "#{name.attacks(player1)}"
elsif choice == "1"
    puts "#{name.attacks(player2)}"
end

    puts "Les autres joueurs t'attaquent !"
    if player1.life_points < 0
        puts "Josiane est morte"
    else
    puts "#{player1.attacks(name)}"
    end
    if player2.life_points < 0
        puts "José est mort"
    else
    puts "#{player2.attacks(name)}"
    end
end


puts "La partie est finie"
if name.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
else puts "Loser ! Tu as perdu !" 
end