require_relative '00_tree_node.rb'

class KnightPathFinder
  def initialize(start_pos)
    @start_pos = start_pos
    @considered_positions = [start_pos]
    build_move_tree
  end

  def self.valid_moves(pos)
    moves = [
      [pos[0]-2, pos[1]-1],
      [pos[0]-2, pos[1]+1],
      [pos[0]+2, pos[1]-1],
      [pos[0]+2, pos[1]+1],
      [pos[0]-1, pos[1]+2],
      [pos[0]-1, pos[1]-2],
      [pos[0]+1, pos[1]-2],
      [pos[0]+1, pos[1]+2]
    ]
    return moves.select do |coord|
        coord[0] >= 0 && coord[1] >= 0 && coord[0] < 8 && coord[1] < 8
    end
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos)
    new_moves = moves.select{ |coord| !@considered_positions.include?(coord)}
    @considered_positions += new_moves
    return new_moves
  end

  attr_accessor :root_node

  def build_move_tree
    self.root_node = PolyTreeNode.new(@start_pos)
    nodes = [root_node]
    until nodes.empty?
      current_node = nodes.shift
      current_value = current_node.value
      next_moves = new_move_positions(current_value)
      next_moves.each do |next_move|
        next_node = PolyTreeNode.new(next_move)
        current_node.add_child(next_node)
        nodes << next_node
      end
    end
  end

  def find_path(end_pos)
    end_node = root_node.dfs(end_pos)
    trace_path_back(end_node).reverse
  end

  def trace_path_back(node)
    current_node = node
    values = []
    until current_node.nil?
      values << current_node.value
      current_node = current_node.parent
    end
    return values
  end
end

kpf = KnightPathFinder.new([0,0])
p kpf.find_path([7, 6])