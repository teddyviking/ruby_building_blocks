def stock_picker(*day)
	beneficios = []
	buy_day = 0
	sell_day = 0
	max_profit = 0
	count = 0

	day.each do |d| 
		beneficios << day.map.with_index{|x, i|  i <= (day.index(d) - 1)? x= 0 : x - d}
		
	end

#con esto tengo ya un array con varias arrays
#ahora quiero seleccionar el array que tiene el beneficio mayor, y de él poder extraer un array con el día de compra y el de venta	

	beneficios.each do |b|

		if b.max.to_i > max_profit
			buy_day = beneficios.index(b)
			sell_day = b.index(b.max)
			max_profit = b.max	
		end
		count +=1
	end

	puts "You should buy on day #{buy_day} and sell on day #{sell_day} for a profit of #{max_profit}"	
	
end

stock_picker(17,3,6,9,15,8,6,1,50)