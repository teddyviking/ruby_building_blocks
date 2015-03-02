def caesar_cipher(string, n)
	ciphered = [] #array where we are going to store the ciphered values
	exceptions = %w(! ? ¿ ¡ . : ; , - _) #symbols that we don't want to transform

	numbers = string.split.each do |num|
		num.gsub!(/\w/){|l| l.ord.to_s + ' '}
		#create array with words, each word gets all the letters converted into numbers.
		#the to_s is needed because if not letters won't be recognizable.
		ciphered << num.split.map do |e|
			if exceptions.include?(e) 
				e
				# doesn't convert the puntuation
			else
				result = e.to_i + n
				if ((90...97).cover?(result) && e.to_i < 90 ) || result >= 122
					result -= 25
				else
					result
				end
				result.chr
				# identify when the letters overcome the z and get back to the beginning of the alphabet
			end
		end.join
	end
	puts ciphered.join(' ')
end

caesar_cipher("Hola!",3)

caesar_cipher("Zo me zusta la Zasolina.", 20)

