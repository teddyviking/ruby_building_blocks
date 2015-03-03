#!/usr/bin/ruby 

def substrings(phrase,array)
	
	substrings = {}
	input = phrase.downcase

	array.each do |word|
		occurrences = 0
		
		if input.include?(word)
			ocurrences = input.scan(/#{word}/).size
			substrings[word] = ocurrences
		end

	end
	
	puts substrings
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)