# frozen_string_literal: true

require_relative "dungeon_maker/version"

require "dungeon_maker/dungeon"
require "dungeon_maker/rooms"
require "dungeon_maker/doors"
require "dungeon_maker/walls"

module DungeonMaker
  def self.new_dungeon(number_of_rooms: 10)
    types = [:trapped, :enchanted, :ordinary]
    dungeon = Dungeon.new(number_of_rooms)

    dungeon.rooms.map! do |room|
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

      room.sides.map! do |side|
        make_wall = rand() >= 0.5

        if make_wall
          type = types.sample
          side = case type
            when :trapped
              Walls::TrappedWall.new
            when :enchanted
              Walls::EnchantedWall.new
            when :ordinary
              Walls::OrdinaryWall.new
            else
              Walls::OrdinaryWall.new
            end
        else
          type = types.sample
          side = case type
            when :trapped
              Doors::TrappedDoor.new
            when :enchanted
              Doors::EnchantedDoor.new
            when :ordinary
              Doors::OrdinaryDoor.new
            else
              Doors::OrdinaryDoor.new
            end
        end
      end

      room
    end

    dungeon
  end
end
