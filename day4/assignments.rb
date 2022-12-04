def assignments(file)
  tasks = File.readlines(file).map do |line|
    pairs = line.split(',')
    f = pairs.first.split('-').map(&:to_i)
    l = pairs.last.split('-').map(&:to_i)
    [Range.new(f[0], f[1]), Range.new(l[0], l[1])]
  end
end

tasks = assignments('puzzle_input')
big_overlap = tasks.count {|t| t[0].cover?(t[1]) || t[1].cover?(t[0])}
small_overlap = tasks.count {|t| t[0].include?(t[1].last) || t[1].include?(t[0].last) }

puts "big overlap : #{big_overlap}"
puts "small overlap : #{small_overlap}"