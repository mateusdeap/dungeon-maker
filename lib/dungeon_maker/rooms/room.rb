module DungeonMaker
  module Rooms
    class Room
      attr_accessor :sides

      def initialize
        @sides = Array.new(4)
      end
    end
  end
end
