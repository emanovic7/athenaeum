class BooksController < ApplicationController

  #get user's books
  get '/books' do
    if logged_in?
      @books = Book.all
      erb :'/books/books_list'
    else
      erb :'login'
    end

  end

end
