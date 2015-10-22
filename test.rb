require 'date'

#time = DateTime.parse('2013-11-07 00:00:00+00:00', '%Y-%m-%dT%H:%M:%S%z')
#test_time = DateTime.parse('2013-11-07 19:30:03 -0800', '%Y-%m-%dT%H:%M:%S%z')

time = DateTime.parse('2013-11-07 00:00:00+00:00')
end_time = time+1
test_time = DateTime.parse('2013-11-07 19:30:03 -0800')

puts test_time.day >= time.day # expect true
puts test_time.day > end_time.day # expect false

puts time
puts end_time
puts test_time
