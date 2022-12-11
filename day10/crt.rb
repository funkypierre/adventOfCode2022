def crt(file)
  lines = File.readlines(file)

  cycles_cpu = {
    1 => 1
  }

  cur_cycle = 1
  cur_cpu = 1

  lines.each do |line|
    ins, nb = line.split(' ')
    if ins == 'addx'
      cur_cycle += 1
      cycles_cpu[cur_cycle] = cur_cpu
      cur_cycle += 1
      cur_cpu += nb.to_i
      cycles_cpu[cur_cycle] = cur_cpu
    else
      cur_cycle += 1
      cycles_cpu[cur_cycle] = cur_cpu
    end
  end

  cycles_to_check = [20, 60, 100, 140, 180, 220]
  puts "strentgh : #{cycles_to_check.map { |c| cycles_cpu[c] * c }.sum}"

  break_line = [41, 81, 121, 161, 201]
  screen = ['', '', '', '', '', '']
  cur_line = 0
  cycles_cpu.each_pair do |cycle, cpu|
    cur_line += 1 if break_line.include? cycle
    screen[cur_line].concat (cpu - 1..cpu + 1).include?(cycle - 1 - (40 * cur_line)) ? '#' : '.'
  end

  puts screen
end

crt('ex_input')
crt('puzzle_input')