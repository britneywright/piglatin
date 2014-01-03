require 'minitest/autorun'

describe "english to pig-latin translation" do
	it "should move the first letter of the word to the end and adds ay at the end" do
		translate_word("pig").must_equal "igpay"
	end

	it "should write each word of a phrase in pig-latin" do
		translate_phrase("went to the park").must_equal "entway otay hetay arkpay"
	end

	it "should write a sentence in pig-latin" do
		translate_sentence("What do you want to do today?").must_equal "Hatway oday ouyay antway otay oday odaytay?"	
	end

end

def translate_word(word)
	word[1..-1] + word[0] + "ay"
end

def translate_phrase(phrase)
	phrase.split(' ').map { |word| translate_word(word) }.join(' ')
end

def translate_sentence(sentence)
	sentence.downcase.gsub(/\w+/){|word| translate_word(word)}.capitalize
end