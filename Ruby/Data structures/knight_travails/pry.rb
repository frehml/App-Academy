def valid_moves(pos)
  moves = [
    [pos[0]-1, pos[1]-1],
    [pos[0]-1, pos[1]],
    [pos[0], pos[1]-1],
    [pos[0]+1, pos[1]+1],
    [pos[0], pos[1]+1],
    [pos[0]+1, pos[1]],
    [pos[0]-1, pos[1]+1],
    [pos[0]+1, pos[1]-1]
  ]
  return moves.select do |coord|
      coord[0] >= 0 && coord[1] >= 0 && coord[0] < 8 && coord[1] < 8
  end
end

p valid_moves([0,0])