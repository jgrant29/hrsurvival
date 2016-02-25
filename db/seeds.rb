require 'faker'

# Create Book

2.times do
   user = User.new(
        name:  Faker::Name.name, 
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10)
        )
    user.skip_confirmation!
    user.save
end
users = User.all

1.times do 
  Book.create!(
    title:     Faker::Book.title,
    body:     Faker::Lorem.paragraph
    )
end
books = Book.all

# Create Chapters
10.times do 
  Chapter.create!(
    book: books.sample,
    title: Faker::Book.title, 
    body:  Faker::Lorem.paragraph(3),
    description: Faker::Lorem.sentence,
    author: Faker::Book.author
    )
end

chapters = Chapter.all

100.times do
    Tableofcontent.create!(
        title: Faker::Lorem.sentence,
        chapter: chapters.sample,
        body: Faker::Lorem.paragraph(500),
        author: Faker::Name.name,
    )
end
tableofcontents = Tableofcontent.all

40.times do
    Article.create!(
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph(500),
    )
end
Articles = Article.all

admin = User.new(
    email: 'justin@accr.biz',
    password: 'dirtbag7!',
    role: 'admin'
    )
admin.skip_confirmation!
admin.save!

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
