require_relative 'player'

class Game
  def initialize(inputString)
    @inputString = inputString
    puts "new game #{@inputString}"
    cards = inputString.split(" ")
    hands = cards.each_slice(5).to_a
    player1 = Player.new(1, hands[0])
    player2 = Player.new(2, hands[1])
    puts "player1 has #{player1.points} points"
    puts "player2 has #{player2.points} points"
  end
end
