class NewWelcomeController < ApplicationController
  def index
    @book = Book.first
    @chapter = @book.chapters
  end
end
