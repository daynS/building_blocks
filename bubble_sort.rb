def bubble_sort(list)
  return list if list.size <= 1 # already sorted
  swapped = true
  while swapped do
    swapped = false
    0.upto(list.size-2) do |i|
      if list[i] > list[i+1]
        list[i], list[i+1] = list[i+1], list[i] # swap values
        swapped = true
      end
    end    
  end
  list
end

def bubble_sort_by(array)
	return array if array.size <= 1 # already sorted
	swapped = true
  	while swapped do
  		swapped = false
  		0.upto(array.size-2) do |i|
  			result = yield array[i], array[i+1]
  			if result < 0
  				array[i], array[i+1] = array[i+1], array[i] # swap values
  				swapped = true
  			end
  		end
  	end
  	array
end

puts bubble_sort([4,3,78,2,0,2])

array = bubble_sort_by(["hi","hello","hey"]) do |left,right|
	right.length - left.length
end

puts array
