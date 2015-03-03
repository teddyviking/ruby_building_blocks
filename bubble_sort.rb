def bubble_sort(numbers)
	finish = false

	while !finish
		finish = true

		numbers.each.with_index do |n, index|
			if numbers[index + 1] && n > numbers[index + 1]
				numbers[index], numbers[index + 1] = numbers[index + 1], numbers[index]
				finish = false
			end
		end
	end
	p numbers

end

def bubble_sort_by(array)
	finish = false

	while !finish
		finish = true

		(0...(array.length - 1)).each do |i|
			if yield(array[i], array[i + 1]) < 0
				array[i], array[i + 1] = array[i + 1], array[i]
				finish = false
			end
		end
	end
	p array
end




bubble_sort([4,3,78,2,0,2])

bubble_sort_by(["hi","hello","hey","lolazos"]) do |left,right|
	right.length - left.length
end