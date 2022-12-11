def monkey_business(file)
  lines = File.read(file).split(/\n{2,}/).map {|l| l.split("\n")}
  monkeys = {}
  primes = []
  lines.size.times do |index|
    part = lines[index]
    primes.push part[3].split(' ').last.to_i
    monkeys[index] = {
      items: part[1].split(/[^\d]/).reject(&:empty?).map(&:to_i),
      operation: part[2].split(' ').last(2),
      divisable_by: primes.last,
      throw_to_monkeys: {
        true: part[4].split(' ').last.to_i,
        false: part[5].split(' ').last.to_i
      },
      inspected: 0
    }
  end

  lcm = primes.reduce(:lcm)

  # 20 for part 1
  10_000.times do
    monkeys.each_pair do |index, monkey|
      monkey[:items].each do |item|
        op_by = monkey[:operation][1] == 'old' ? item : monkey[:operation][1].to_i
        worry = item.public_send monkey[:operation][0].to_sym,op_by
        worry = (worry / 1) % lcm # /3 for part 1
        decision = (worry % monkey[:divisable_by]) == 0
        next_monkey = monkey[:throw_to_monkeys][decision.to_s.to_sym]
        monkeys[next_monkey][:items].push worry
      end
      monkey[:inspected] += monkey[:items].size
      monkey[:items] = []
    end
  end

  monkeys.each_pair do |index, monkey|
    puts "Monkey #{index} inspected items #{monkey[:inspected]} times"
  end

  total = monkeys.transform_values {|m| m[:inspected]}.values.max(2).inject(:*)
  puts "Monkey ultimate power : #{total}"
end

monkey_business('ex_input')
monkey_business('puzzle_input')