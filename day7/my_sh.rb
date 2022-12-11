def my_sh(file)
  lines = File.readlines(file)
  files = {}
  dirs = []
  lines.each do |line|
    infos = line.split(' ')
    if infos[1] == 'cd'
      if infos.last == '..'
        dirs.pop
      else
        dirs.push(infos.last)
      end
    end
    if infos.first != '$' && infos.first != 'dir'
      size = infos.first
      str = ''
      dirs.each do |dir|
        str << dir
        files[str] = 0 unless files[str]
        files[str] += size.to_i
      end
    end
  end

  puts "part 1 #{files.values.filter {|v| v <= 100_000}.sum}"

  total_space = 70_000_000
  update_size = 30_000_000
  total_used_space = files.dig('/')

  needed_space = update_size - (total_space - total_used_space)
  puts "part 2 : #{files.values.filter {|v| v >= needed_space}.min}"
end

my_sh('ex_input')
my_sh('puzzle_input')
