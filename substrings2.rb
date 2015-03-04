class Array
  def partial_include? search
    self.each do |e|
      return true if e[search]
    end
    return false
  end
end

def substrings(s, dictionary)
	matches = {}
	words = s.split(" ")
	words.map! {|word| word.downcase}
	dictionary.each do |word|
		if words.partial_include? (word)
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
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)