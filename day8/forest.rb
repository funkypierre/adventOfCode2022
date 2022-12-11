def visible_trees(file)
  trees = File.readlines(file).map {|line| line.chop.chars.map(&:to_i)}
  visible = 0

  max_y = trees.size - 1
  max_x = trees[0].size - 1

  for y in (1...max_y)
    for x in (1...max_x)
      cur_tree = trees[y][x]
      
      top_line = (0..y - 1).map {|yy| trees[yy][x]}.reverse
      top_visible = top_line.max && top_line.max < cur_tree

      right_line = trees[y][x + 1..max_x]
      right_visible = right_line.max && right_line.max < cur_tree
      
      left_line = trees[y][0..x - 1].reverse
      left_visible = left_line.max && left_line.max < cur_tree
      
      bottom_line = (y + 1..max_y).map {|yy| trees[yy][x]}
      bottom_visible = bottom_line.max && bottom_line.max < cur_tree

      visible += 1 if top_visible || right_visible || left_visible || bottom_visible
    end
  end

  total = visible + (max_y * 2) + (max_x * 2)
  puts "#{total} trees are visible"
end

def highest_scenic_score(file)
  trees = File.readlines(file).map {|line| line.chop.chars.map(&:to_i)}
  highest = 0

  max_y = trees.size - 1
  max_x = trees[0].size - 1

  for y in (1...max_y)
    for x in (1...max_x)
      cur_tree = trees[y][x]
      
      top_line = (0..y - 1).map {|yy| trees[yy][x]}.reverse
      top_closest = top_line.index {|t| t >= cur_tree }
      top = top_closest ? top_closest + 1 : top_line.size # no closest means the whole line is smaller

      right_line = trees[y][x + 1..max_x]
      right_closest = right_line.index {|t| t >= cur_tree }
      right = right_closest ? right_closest + 1 : right_line.size
      
      left_line = trees[y][0..x - 1].reverse
      left_closest = left_line.index {|t| t >= cur_tree }
      left = left_closest ? left_closest + 1 : left_line.size
      
      bottom_line = (y + 1..max_y).map {|yy| trees[yy][x]}
      bottom_closest = bottom_line.index {|t| t >= cur_tree }
      bottom = bottom_closest ? bottom_closest + 1 : bottom_line.size
      
      total = left * right * bottom * top
      highest = total if total > highest
    end
  end

  puts "highest scenic score is #{highest}"
end

puts "part 1"
visible_trees('ex_input')
visible_trees('puzzle_input')
puts "\npart 2"
highest_scenic_score('ex_input')
highest_scenic_score('puzzle_input')
