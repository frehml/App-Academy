require_relative '00_tree_node.rb'

class KnightPathFinder
    def initialize(starting_pos)
        @starting_pos = starting_pos
        @considered_positions = [@starting_pos]

        build_move_tree
    end
    def build_move_tree
        queue = [@starting_pos]
        until queue.empty?
            new_move_positions(queue.shift).each do |pos|
                queue << pos
                print queue
                sleep 1
                PolyTreeNode.new(pos)
            end
        end
    end
    def valid_moves(pos)
        valid_moves = []
        (pos[0]-1..pos[0]+1).each do |x|
            (pos[1]-1..pos[1]+1).each do |y|
                valid_moves << [x,y] if pos != [x,y] && x >= 0 && y >= 0
            end
        end
        valid_moves
    end
    def new_move_positions(pos)
        array = valid_moves(pos).select{ |pos| !@considered_positions.include?(pos)}
        @considered_positions += array
        array
    end
end

p pathfinder = KnightPathFinder.new([0,0])
p pathfinder.build_move_tree
