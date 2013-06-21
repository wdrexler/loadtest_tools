# Usage: ruby ./arrayer.rb <cpu/ram>
# TODO: Make more generic

type = ARGV[0]
platforms = ['asterisk', 'fs']
ruby_versions = ['1.9.3', '2.0.0']
results = [['Time', 'Asterisk w/ 1.9.3', 'FS w/ 1.9.3', 'Asterisk w/ 2.0.0', 'FS w/ 2.0.0']]
position = 1
current_time = 1

ruby_versions.each do |v|
  platforms.each do |p|
    puts "READING IN: #{p}/#{v}.stats"
    read_file = File.open "#{p}/#{v}/#{type}.stats", 'r'
    until read_file.eof?
      line = read_file.readline
      val = line.split(' ')[2]
      val.gsub!(/m/, '')
      results[current_time] = [current_time] if results[current_time].nil? || results[current_time].empty?
      results[current_time][position] = val.to_i
      puts "WROTE: #{results[current_time].inspect}"
      current_time += 1
    end
    current_time = 1
    position += 1
    read_file.close
  end
end

results.each do |r|
  if r.size < 5
    r.push nil until r.size == 5
  end
end

write_file = File.open "#{type}.stats", 'w'
write_file.write results.inspect
write_file.close
puts results.inspect