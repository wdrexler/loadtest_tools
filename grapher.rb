#Usage: ruby ./grapher.rb <cpu/ram>
#This is meant to be used in conjunction with arrayer.
#It takes the resulting cpu.stats or ram.stats and
#Makes the array JavaScript-friendly
type = ARGV[0]

read_file = File.open "#{type}.stats", 'r'

arr = IO.read read_file

arr.gsub!(/nil/, "null")

write_file = File.open "#{type}.graph", 'w'
write_file.write arr