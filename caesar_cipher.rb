def caesar_cipher(word, num)
alphabet = ('a'..'z').to_a
alphabet += ('A'..'Z').to_a
new_word = ""

word.each_char do |i|
  if !alphabet.include?(i)
    new_word +=i
  else
    moveToHere = alphabet.index(i) + num
    if moveToHere > 50 then moveToHere -=26 end
    new_word += alphabet[moveToHere]  
  end
end

return new_word
end

puts caesar_cipher("What a string!", 5)