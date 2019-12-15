require 'byebug'
red = [255, 0, 0]
orange = [255, 127, 0]
yellow = [255, 255, 0]
green = [0, 255, 0]
blue = [0, 0, 255]
indigo = [46, 43, 95]
violet = [139, 0, 255]

undefined_colors = []

def check_distance(pattern, color)
  r0, g0, b0 = pattern
  r, g, b = color
  return Math.sqrt((r-r0)**2 + (g-g0)**2 + (b-b0)**2) > 20
end

while undefined_colors.count < 300
  r = rand(1..255)
  g = rand(1..255)
  b = rand(1..255)

  d1 = check_distance(red, [r, g, b])
  d2 = check_distance(orange, [r, g, b])
  d3 = check_distance(yellow, [r, g, b])
  d4 = check_distance(green, [r, g, b])
  d5 = check_distance(blue, [r, g, b])
  d6 = check_distance(indigo, [r, g, b])
  d7 =  check_distance(violet, [r, g, b])
  
  undefined_colors << [r, g, b] if d1 && d2 && d3 && d4 && d5 && d6 && d7
end

targets = []

i = 0
while i<300
  targets << 0
  i = i + 1
end

print(undefined_colors)
print (targets)