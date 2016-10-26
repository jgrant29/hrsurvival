class NewWelcomeController < ApplicationController
  def index
    @book = Book.first
    @chapter = @book.chapters
    set_meta_tags title: "Virginia and Federal Employment Law",
                  description: "Human Resource and Employment Law Advice by Andrew (Andy) Wampler with Wilson Worley Law Firm",
                  keywords: 'Human Resources, Virginia, Federal, Law, Forms, Policies, Employment',
                  author: "Andrew (Andy) Wampler with Wilson Worley Law Firm"
  end
end
