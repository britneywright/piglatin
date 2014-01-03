require 'minitest/autorun'

describe "english to pig-latin translation" do
	it "should move the first letter of the word to the end and add ay at the end to words that start with consonants" do
		translate_word("pig").must_equal "igpay"
	end

	it "should add way to the end of words that start with vowels" do
		translate_word("idle").must_equal "idleway"
	end

	it "should write each word of a phrase in pig-latin" do
		translate_phrase("went to go away").must_equal "entway otay ogay awayway"
	end

	it "should write a sentence in pig-latin" do
		translate_sentence("What do you want to do today?").must_equal "Hatway oday ouyay antway otay oday odaytay?"	
	end
end

def translate_word(word)
  vowel_first = word[0].match(/^[aeiou]/)
  if vowel_first
    word + "way"
  else
    word[1..-1] + word[0] + "ay"
  end
end  

def translate_phrase(phrase)
	phrase.split(' ').map { |word| translate_word(word) }.join(' ')
end

def translate_sentence(sentence)
	sentence.downcase.gsub(/\w+/){|word| translate_word(word)}.capitalize
end

# Single line translate_word method
# def translate_word(word)
#  match = (first_letter = word[0].match(/[aeiou]/)) ? (word + "way") : (word[1..-1] + word[0] + "ay")
# end