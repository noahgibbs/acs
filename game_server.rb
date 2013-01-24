#!/usr/bin/env rails runner
# Runner will work again when Rails 4.0 is production

$LOAD_PATH.prepend File.join(File.dirname(__FILE__), "lib", "game")
require "status"

if ARGV.size != 1
  STDERR.puts "Usage: game_server.rb <world_id>"
  exit -2
end

world_id = ARGV.first.to_i

world = World.find(world_id)
if !world
  STDERR.puts "Could not find world with ID #{world_id}!"
  exit -3
end

loop do
  GameStatus.update(world.id)
  break  # For now, one iteration
end
puts "Finished trivial update successfully."
