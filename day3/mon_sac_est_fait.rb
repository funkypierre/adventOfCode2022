# https://adventofcode.com/2022/day/3

def mon_sac_est_fait(file)
  bags = File.readlines(file).map {|line| line.split('')}
  priorities = ['a'..'z', 'A'..'Z'].flat_map(&:to_a)

  total = 0
  bags.each do |bag|
    comps = bag.each_slice(bag.size / 2).to_a
    item = (comps[0] & comps[1]).first
    total += 1 + priorities.find_index(item)
  end

  total
end

def mon_sac_est_refait(file)
  bags = File.readlines(file).map {|line| line.split('')}
  priorities = ['a'..'z', 'A'..'Z'].flat_map(&:to_a)

  total = 0
  bags.each_slice(3) do |lines|
    item = (lines[0] & lines[1] & lines[2]).first
    total += 1 + priorities.find_index(item)
  end

  total
end

puts "part 1 example answer : #{mon_sac_est_fait('ex_input')}"
puts "part 1 puzzle answer : #{mon_sac_est_fait('puzzle_input')}\n"
puts "part 2 example answer : #{mon_sac_est_refait('ex_input')}"
puts "part 2 example answer : #{mon_sac_est_refait('puzzle_input')}"
