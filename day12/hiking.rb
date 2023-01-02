def find_edges(map, y, x)
  edges = []
  top = map.dig(y - 1, x) if y - 1 >= 0
  down = map.dig(y + 1, x) if y + 1 < map.size
  left = map.dig(y, x - 1) if x - 1 >= 0
  right = map.dig(y, x + 1) if x + 1 < map.first.size

  cur = map.dig(y, x)
  # from S to E
  edges.push(coor(y - 1, x)) if top && top <= cur + 1
  edges.push(coor(y + 1, x)) if down && down <= cur + 1
  edges.push(coor(y, x - 1)) if left && left <= cur + 1
  edges.push(coor(y, x + 1)) if right && right <= cur + 1

  # from E to S
  #edges.push(coor(y - 1, x)) if top && cur - top <= 1
  #edges.push(coor(y + 1, x)) if down && cur - down <= 1
  #edges.push(coor(y, x - 1)) if left && cur - left <= 1
  #edges.push(coor(y, x + 1)) if right && cur - right <= 1

  edges
end

def coor(y, x)
  "#{y},#{x}"
end

def hiking(file)
  map = []
  start_node_key = nil
  end_node_key = nil

  File.readlines(file).each_with_index do |l, y|
    map[y] = []
    l.strip.split('').each_with_index do |c, x|
      start_node_key = coor(y, x) if c == 'S'
      end_node_key = coor(y, x) if c == 'E'
      char = c == 'S' ? 1 : c == 'E' ? 26 : ('a'..'z').find_index(c) + 1
      map[y].push char
    end
  end

  graph = {}

  map.each_with_index do |line, y|
    line.each_index do |x|
      graph[coor(y, x)] = {
        visited: false,
        edges: find_edges(map, y, x),
        path_from_start: []
      }
    end
  end

  puts "need to find #{end_node_key} from #{start_node_key}"

  queue = [start_node_key]
  graph[start_node_key][:visited] = true
  while !queue.empty?
    cur_node_key = queue.shift
    cur_node = graph[cur_node_key]
    cur_node[:path_from_start].push cur_node_key
    if cur_node_key == end_node_key
      puts "finished path : #{cur_node[:path_from_start].size - 1}"
    end
    cur_node[:edges].each do |edge_key|
      edge_node = graph[edge_key]
      if !edge_node[:visited]
        queue.push edge_key
        edge_node[:visited] = true
        edge_node[:path_from_start].concat cur_node[:path_from_start]
      end
    end
  end
end

def hiking_again(file)
  map = []
  start_node_key = []
  end_node_key = nil

  File.readlines(file).each_with_index do |l, y|
    map[y] = []
    l.strip.split('').each_with_index do |c, x|
      start_node_key.push coor(y, x) if c == 'S' || c == 'a'
      end_node_key = coor(y, x) if c == 'E'
      char = c == 'S' ? 1 : c == 'E' ? 26 : ('a'..'z').find_index(c) + 1
      map[y].push char
    end
  end

  graph = {}

  map.each_with_index do |line, y|
    line.each_index do |x|
      graph[coor(y, x)] = {
        visited: false,
        edges: find_edges(map, y, x),
        path_from_start: []
      }
    end
  end

  finished_paths = []

  start_node_key.each do |start_key|
    queue = [start_key]
    graph[start_key][:visited] = true
    while !queue.empty?
      cur_node_key = queue.shift
      cur_node = graph[cur_node_key]
      cur_node[:path_from_start].push cur_node_key
      if cur_node_key == end_node_key
        finished_paths.push cur_node[:path_from_start].size - 1
      end
      cur_node[:edges].each do |edge_key|
        edge_node = graph[edge_key]
        if !edge_node[:visited]
          queue.push edge_key
          edge_node[:visited] = true
          edge_node[:path_from_start].concat cur_node[:path_from_start]
        end
      end
    end

    graph.each_value do |value|
      value[:visited] = false
      value[:path_from_start] = []
    end
  end

  puts "shortest path size is #{finished_paths.min}"
end

hiking('ex_input')
hiking('puzzle_input')
hiking_again('ex_input')
hiking_again('puzzle_input')