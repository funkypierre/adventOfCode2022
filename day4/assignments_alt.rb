# Alternative method using arrays, but I prefer the Range version in the end
def assignments(file)
  tasks = File.readlines(file).map do |line|
    pairs = line.split(',')
    f = pairs.first.split('-').map(&:to_i)
    l = pairs.last.split('-').map(&:to_i)
    [Range.new(f[0], f[1]).to_a, Range.new(l[0], l[1]).to_a]
  end

  big_overlaps = tasks.filter do |t|
    fusion = t[0] & t[1]
    !fusion.empty? && [t[0].size, t[1].size].include?(fusion.size)
  end

  small_overlaps = tasks.map {|t| t[0] & t[1] }.reject {|t| t.empty? }
  puts "big overlaps : #{big_overlaps.count}"
  puts "small overlaps : #{small_overlaps.count}"
end