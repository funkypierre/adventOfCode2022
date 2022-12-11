def bb_cadum(string)
  x = 0
  y = 3 # 13 for part 2
  while y < string.size
    return y + 1 if string[x..y].chars.uniq.size == 4 # 14 for part 2
    x += 1
    y += 1
  end
end
