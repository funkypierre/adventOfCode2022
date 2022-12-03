# https://adventofcode.com/2022/day/2

def gg_ez(file)
  rules = {
    'rock' => 'scissors',
    'paper' => 'rock',
    'scissors' => 'paper'
  }
  shapes = {
    'A' => 'rock',
    'X' => 'rock',
    'B' => 'paper',
    'Y' => 'paper',
    'C' => 'scissors',
    'Z' => 'scissors'
  }
  scores = {
    'rock' => 1,
    'paper' => 2,
    'scissors' => 3
  }

  game = File.readlines(file).map {|line| line.split(' ') }
  results = game.map do |moves|
    op = shapes[moves.first]
    me = shapes[moves.last]
    score = if op == me
      3 # draw
    elsif rules[me] == op
      6 # win
    else
      0 # lose
    end
    score + scores[me]
  end

  results.sum
end

def gg_ez_again(file)
  rules = {
    'rock' => 'scissors',
    'paper' => 'rock',
    'scissors' => 'paper'
  }
  shapes = {
    'A' => 'rock',
    'B' => 'paper',
    'C' => 'scissors'
  }
  scores = {
    'rock' => 1,
    'paper' => 2,
    'scissors' => 3
  }

  game = File.readlines(file).map {|line| line.split(' ') }
  results = game.map do |moves|
    op = shapes[moves.first]
    decision = moves.last
    score = if decision == 'Y'
      3 + scores[op] # draw
    elsif decision == 'Z'
      6 + scores[rules.key(op)] # win
    else
      0 + scores[rules[op]] # lose
    end
    score
  end

  results.sum
end

puts "part 1 example answer : #{gg_ez('ex_input')}"
puts "part 1 puzzle answer : #{gg_ez('puzzle_input')}\n"
puts "part 2 example answer : #{gg_ez_again('ex_input')}"
puts "part 2 puzzle answer : #{gg_ez_again('puzzle_input')}\n"