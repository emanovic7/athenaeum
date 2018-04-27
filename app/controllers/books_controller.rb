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

  #add new book
  get '/books/new' do
    if logged_in?
      erb :'books/add_book'
    else
      redirect to '/login'
    end
  end

#process submitted book info
  post '/books/new' do
    if logged_in?
      @book = Book.create(name: params["book title"])
      @book.author = Author.find_or_create_by(name: params["author name"])
      @book.subject_ids = params[:subjects]
      @book.save

      flash[:message] = "New Book Added!"

      erb :'/books/show_book'
    else
      redirect to '/login'
    end
  end

  #individual book, 
  #is this necessary?!!
  get '/books/:slug' do
    if logged_in?
      @book = Book.find_by_slug(params[:slug])
      erb :'/books/show_book'
    else
      redirect to '/login'
    end
  end

end
