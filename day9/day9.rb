# currently unfinished with part 2

def toto(file)
lines = File.readlines(file)
  visited = {0 => [0]}

  head_x = 0
  head_y = 0
  tail_x = 0
  tail_y = 0

  lines.each do |line|
    infos = line.split(' ')
    dir = infos[0]
    nb = infos[1].to_i
    (1..nb).each do |n|
      prev_x = head_x
      prev_y = head_y
      if ['R', 'L'].include? dir
        head_x += (dir == 'L' ? -1 : 1)
      end
      if ['U', 'D'].include? dir
        head_y += (dir == 'D' ? -1 : 1)
      end
      if [-2, 2].include?(head_x - tail_x) || [-2, 2].include?(head_y - tail_y)
        tail_x = prev_x
        tail_y = prev_y
        visited[tail_y] = [] unless visited[tail_y]
        visited[tail_y] |= [tail_x]
      end
    end
  end

  puts visited
  puts visited.values.map(&:count).sum
end

def tata(file)
lines = File.readlines(file)
  visited = {0 => [0]}

  head_x = 0
  head_y = 0
  knots = {
    1 => [0, 0], #head
    2 => [0, 0]  #tail
  }

  lines.each do |line|
    infos = line.split(' ')
    dir = infos[0]
    nb = infos[1].to_i
    puts line
    (1..nb).each do |n|
      knots.each_pair do |knot, coor|
        prev_head_x = knots[1][1]
        prev_head_y = knots[1][0]
        if knot == 1 #head
          if ['R', 'L'].include? dir
            knots[1][1] += (dir == 'L' ? -1 : 1)
          end
          if ['U', 'D'].include? dir
            knots[1][0] += (dir == 'D' ? -1 : 1)
          end
          puts "head goes to #{knots[1].join(',')}"
        end
        if knot == 2 && [-2, 2].include?(knots[1][1] - knots[2][1]) || [-2, 2].include?(knots[1][0] - knots[2][0])
          tail_x = prev_head_x
          tail_y = prev_head_y
          knots[knot] = [tail_y, tail_x]
          puts "tail goes to #{knots[knot].join(',')}"
          visited[tail_y] = [] unless visited[tail_y]
          visited[tail_y] |= [tail_x]
        end
      end
    end
  end

  puts visited
  puts visited.values.map(&:count).sum
end

def titi(file)
lines = File.readlines(file)
  visited = {0 => [0]}

  head_x = 0
  head_y = 0
  tails = {
    1 => [0, 0],
    2 => [0, 0],
    3 => [0, 0],
    4 => [0, 0],
    5 => [0, 0],
    6 => [0, 0],
    7 => [0, 0],
    8 => [0, 0],
    9 => [0, 0],
  }

  [lines.first].each do |line|
    infos = line.split(' ')
    dir = infos[0]
    nb = infos[1].to_i
    (1..nb).each do |n|
      prev_x = head_x
      prev_y = head_y
      if ['R', 'L'].include? dir
        head_x += (dir == 'L' ? -1 : 1)
      end
      if ['U', 'D'].include? dir
        head_y += (dir == 'D' ? -1 : 1)
      end
      tails.each_key do |tail|
        
      end
    end
  end

  puts visited.values.map(&:count).sum
end

toto('ex_input')
tata('ex_input')
#titi('ex_input')