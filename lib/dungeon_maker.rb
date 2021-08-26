# frozen_string_literal: true

require_relative "dungeon_maker/version"

require "dungeon_maker/dungeon"
require "dungeon_maker/rooms"

module DungeonMaker
  def self.new_dungeon(number_of_rooms: 10)
    types = [:trapped, :enchanted, :ordinary]
    dungeon = Dungeon.new(number_of_rooms)

    dungeon.rooms.each do |room|
      type = types.sample

      room = case type
        when :trapped
          Rooms::TrappedRoom.new
        when :enchanted
          Rooms::EnchantedRoom.new
        when :ordinary
          Rooms::OrdinaryRoom.new
        else
          Rooms::OrdinaryRoom.new
        end

      room.sides.each do |side|
        make_wall = rand() >= 0.5

        if make_wall
          type = types.sample
          side = case type
            when :trapped
              TrappedWall.new
            when :enchanted
              EnchantedWall.new
            when :ordinary
              OrdinaryWall.new
            else
              OrdinaryWall.new
            end
        else
          type = types.sample
          side = case type
            when :trapped
              TrappedDoor.new
            when :enchanted
              EnchantedDoor.new
            when :ordinary
              OrdinaryDoor.new
            else
              OrdinaryDoor.new
            end
        end
      end
    end

    dungeon
  end
end
