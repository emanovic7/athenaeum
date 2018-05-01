require 'rack-flash'


class BooksController < ApplicationController
  use Rack::Flash

  #get user's books
  get '/books' do
    if !logged_in?
      erb :'users/login'
    else
      @books = Book.all
      erb :'books/books_list'
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
      @book = current_user.books.create(name: params["book title"])
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

  #edit book
 get '/books/:slug/edit' do
   if logged_in?
     @book = Book.find_by_id(params[:id])
       if @book.user_id == current_user.id
         erb :'books/edit_book'
       else
         redirect to '/books'
       end
   else
     redirect to '/login'
   end
 end

 #process editting
 patch '/books/:slug' do
   if logged_in?
     if params[:title] == "" || params[:author] == "" || params[:subject] == ""
       redirect to '/books/#{params[:slug]}/edit'
   else
      @book = Book.find_by_slug(params[:slug])
       if @book && @book.user == current_user
         if @book.update(content: params[:content])
           redirect to "/books/#{@book.slug}"
         else
           redirect to "/books/#{@book.slug}/edit"
         end
       else
         redirect to '/books'
       end
     end
     else
       redirect to '/login'
     end
 end

 #delete book
  get '/books/:slug/delete' do
    if logged_in?
      @book = Book.find_by_slug(params[:slug])
      if @book && @book.user == current_user
        @book.delete
      end
      redirect to '/books'
    else
      redirect to '/login'
    end
  end

end
