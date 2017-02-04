$:.unshift(File.dirname(__FILE__))
require 'networking'
require 'decisionmaker'

NAME = "RubyBotMk13_#{Time.now.strftime('%H%M%S')}"

network = Networking.new
player, map = network.configure
decisionmaker = Decisionmaker.new(network, player, map)

while true
  decisionmaker.next_turn

  network.send_moves(decisionmaker.moves)
end

