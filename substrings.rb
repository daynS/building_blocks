def substrings(s, dictionary)
	matches = {}
	words = s.split(" ")
	words.map! {|word| word.downcase}
	words.each do |word|
		if dictionary.include? word
			if matches.has_key?(word)
				matches[word] += 1
			else
				matches[word] = 1
			end
		end
	end
	matches
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below down down", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)