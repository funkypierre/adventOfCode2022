# https://adventofcode.com/2022/day/1

def calories_counter(file)
  elves = File.read(file).split /\n{2,}/
  calories = elves.map {|e| e.split("\n").map(&:to_i).sum}
  calories.max
end

def top_three_calories_counter(file)
  elves = File.read(file).split /\n{2,}/
  calories = elves.map {|e| e.split("\n").map(&:to_i).sum}
  calories.max(3).sum
end

puts "part 1 example answer : #{calories_counter('ex_input')}"
puts "part 1 puzzle answer : #{calories_counter('puzzle_input')}\n"
puts "part 2 example answer : #{top_three_calories_counter('ex_input')}"
puts "part 2 puzzle answer : #{top_three_calories_counter('puzzle_input')}"