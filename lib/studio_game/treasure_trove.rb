
module StudioGame
  Treasure = Struct.new(:name, :points)

    module TreasureTrove
      def self.random
        TREASURES.sample
      end
      TREASURES = [
        Treasure.new(:pie, 5),
        Treasure.new(:bottle, 25),
        Treasure.new(:hammer, 50),
        Treasure.new(:skillet, 100),
        Treasure.new(:broomstick, 200),
        Treasure.new(:crowbar, 400)]
    end
end
  
# class Person
#   def self.create_people(jobs)
#     jobs.map do |job|
#       new(job)
#     end
#   end

#   def initialize(job)
#     @job = job
#   end
# end

# class Treasure
#   def initialize(name, points)
#     @name, @points = name, points
#   end

#   attr_accessor :name, :points
# end

# class Treasure < Struct.new(:name, :points)
# end

# class Parent
#   def plays_sports
#     true
#   end
# end

# class Child < Parent
#   def plays_sports
#     if likes_playing_sports?
#       super
#     else
#       false
#     end
#   end
# end

# Child.new.plays_sports
# #=> true