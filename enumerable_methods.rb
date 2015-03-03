module Enumerable
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
	end

	def my_each_with_index
		i=0
		while i < self.size
			yield(self[i], i)
			i +=1
		end
	end

	def my_select
		result = []
		self.my_each{|n|result << n if yield n}
		return result
	end

	def my_all?
		result = true
		self.my_each{|n| result = false if !yield n	}	
		result
	end

	def my_any?
		self.my_each{|n| return true if yield n }	
		return false
	end

	def my_none?
		self.my_each{|n| return false if yield n }	
		return true
	end

	def my_count
		counter = 0
		self.my_each {|n| counter += 1 if yield n }
		counter
	end

	def my_map
		array = []
		self.my_each{|n| array.push(yield n) }
		array
	end

	def my_inject(result=nil)
		if result == nil
			result = self[0]
			x = 1
		else
			x = 0
		end
		
		self[x..self.size].my_each {|n| result = yield(result, n)}
		result
	end

	def my_map_2(proc)
		array = []
		self.my_each{|n| array.push(proc.call(n))}
		array
	end

	def my_map_3(proc)
		array = []
		if block_given? && proc
			self.my_each{|n| array.push(proc.call(yield(n)))}
		elsif proc
			self.my_each{|n| array.push(proc.call(n))}
		end
		array
	end

	
end


stuff = ["pork", "do", "party", "hard", "hell"]

#stuff.my_each_with_index{|s, index| puts "#{index + 1}. Welcome to #{s.capitalize}"}

#puts stuff.my_none?{|item| item.length < 1 }

guay = Proc.new {|item| item + "GUAY"}

puts stuff.my_map_3(guay)

#puts [5, 3, 5, 4].my_inject { |sum, n| sum + n }

def multiply_els(argument)
		argument.my_inject {|result, n| result * n}
end

puts multiply_els([2,4,5]) #=> 40
