require 'faker'

# Create Book

1.times do 
  Book.create!(
    title:     Faker::Book.title,
    )
end
books = Book.all

# Create Chapters
15.times do 
  Chapter.create!(
    book: books.sample,
    title: Faker::Book.title
    )
end

chapters = Chapter.all

50.times do
    Tableofcontent.create!(
        title: Faker::Book.title,
        chapter: chapters.sample,
        body: Faker::Lorem.paragraph(50),
        author: Faker::Book.author
    )
end
tableofcontents = Tableofcontent.all

10.times do
    Article.create!(
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph(100)
    )
end
Articles = Article.all


puts "Seed Finished"
puts "#{Book.count} books created"
puts "#{Chapter.count} chapters created"
puts "#{Tableofcontent.count} chapters created"
puts "#{Article.count} chapters created"


  


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
