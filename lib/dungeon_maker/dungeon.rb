module DungeonMaker
  class Dungeon
    attr_accessor :rooms
    
    def initialize(number_of_rooms)
      @rooms = Array.new(number_of_rooms)
    end
  end
end

