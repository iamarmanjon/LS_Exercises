def century(year)
  year.to_s.end_with?("01")
end

puts century(2000) #== '20th'
puts century(2001) #== '21st'
puts century(1965) #== '20th'
puts century(256) #== '3rd'
puts century(5) #== '1st'
puts century(10103) #== '102nd'
puts century(1052) #== '11th'
puts century(1127) #== '12th'
puts century(11201) #== '113th'
