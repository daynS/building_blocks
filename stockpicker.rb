def stock_picker(days)
	best_days = []
	best_profit = 0

	days.each do |daysPrice|
		buy_day = days.index(daysPrice)
		sell_day = buy_day+1
		i = days.index(daysPrice)

		until i == days.size-1 do
			profit = days[sell_day] - days[buy_day]
			if profit > best_profit
				best_profit = profit
				best_days[0] = buy_day
				best_days[1] = sell_day
			end
			sell_day += 1
			i += 1
		end
	end
	return best_days
end

array = [17,3,6,9,15,8,6,1,10]
puts stock_picker(array)