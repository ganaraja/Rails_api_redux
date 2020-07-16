require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


WordAlpha.delete_all
file_url='https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt'
URI.open(file_url) do |file|
  file.read.each_line do |word|
    print(word)
    WordAlpha.create!(:word => word.strip()) unless word.strip().blank?
  end
end