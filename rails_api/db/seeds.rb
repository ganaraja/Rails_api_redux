require 'open-uri'


WordAlpha.delete_all
file_url='https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt'
URI.open(file_url) do |file|
  file.read.each_line do |word|
    print(word)
    WordAlpha.create!(:word => word.strip()) unless word.strip().blank?
  end
end
