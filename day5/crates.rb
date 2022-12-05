def crates(file)
  lines = File.readlines(file, chomp: true)
  moves_first_index = lines.find_index {|l| l.include? 'move' }
  moves = lines[moves_first_index...lines.size]
  cargo = lines[0...moves_first_index - 1] # line before is empty
  
  crates = {}

  cargo.last.chars.each_with_index do |char, index|
    next unless ('0'..'9').include? char
    crates[char.to_i] = cargo[0...cargo.length - 1].map { |l| l[index].scan /\p{Upper}/ }.flatten
  end

  moves.each do |move|
    nb, first_index, last_index = move.scan(/\d+/).map(&:to_i)
    crates[last_index].unshift(*crates[first_index].first(nb).reverse)
    # remove .reverse for part 2
    crates[first_index].shift(nb)
  end

  puts crates.values.map(&:first).join('')
end

crates('ex_input')
crates('puzzle_input')