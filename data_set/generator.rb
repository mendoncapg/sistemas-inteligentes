require 'byebug'

color = [139, 0, 255]
r1, g1, b1 = color
target = 7

def all_values_for(n)
  values = []
  number = n
  size = 11
  while(number+1<255 && (n-number)**2<=size**2) do
    number = number + 1
    values << number
  end
  number = n
  while(number-1>0 && (n-number)**2<=size**2) do
    number = number - 1
    values << number
  end
  values
end

def reduce(list)
  number = 40
  partition = list.each_slice((list.count/number).to_int).to_a
  begining = partition[0]
  ending = partition[number-1]
  middle = partition[(number/2).ceil]
  return begining + ending + middle
end

def check_distances(list, color)
  r0, g0, b0 = color
  list.each do |test|
    r, g, b = test
    
    d = Math.sqrt((r-r0)**2 + (g-g0)**2 + (b-b0)**2)
    
    if d > 20
      list.delete(test)
      puts(d)
    end
  end
  list
end

def create_data_target(size, target)
  targets = []
  while size >=1
    targets << target
    size = size - 1
  end
  targets
end


data_set = []

all_values_for(r1).each do |r|
  all_values_for(b1).each do |b|
    all_values_for(g1).each do |g|
      data_set << [r, g, b]
    end
  end
end


reduced_data_set = reduce(data_set)
puts(reduced_data_set.count)
final_data_set = check_distances(reduced_data_set, color)
puts(final_data_set.count)
data_target = create_data_target(final_data_set.count, target)
print(final_data_set)
print("#####################################################")
print(data_target)