
class BooksController < ApplicationController

  #get user's books
  get '/books' do
  if logged_in? && @user = current_user
    @books = Book.all
    erb :'/books/books_list'
  else
    redirect to '/login'
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
      if params["book title"] == "" || params["author name"] == ""
        flash[:message] = "Fill in all contents"
        redirect to '/books/new'
      else
        @book = current_user.books.find_or_create_by(name: params["book title"])
        @book.author = Author.find_or_create_by(name: params["author name"])
        @book.subject_ids = params[:subjects] || @book.subject = params[:subject]
        @book.save
        flash[:message] = "New Book Added!"
      end
      erb :'/books/show_book'
    else
      redirect to '/login'
    end
  end

  #individual book,
  #is this necessary?!!
  get '/books/:id' do
    if logged_in?
      @book = Book.find_by_id(params[:id])
      if @book && @book.user == current_user
        erb :'/books/show_book'
      else
        redirect to '/books'
      end
    else
      redirect to '/login'
    end
  end

  #edit book
 get '/books/:id/edit' do
   if logged_in?
     @book = Book.find_by_id(params[:id])
     if @book && @book.user == current_user
         erb :'books/edit_book'
       else
         redirect to '/books'
     end
   else
     redirect to '/login'
   end
 end

 #process editting

 patch '/books/:id' do
   if logged_in?
     if params[:name] == ""
       redirect to "/books/#{params[:id]}/edit"
   else
      @book = Book.find_by_id(params[:id])
       if @book && @book.user == current_user
          @book.update(name: params["book title"])
          @book.author = Author.find_or_create_by(name: params["author name"])
          @book.save
          erb :'books/show_book'
       else
         redirect to '/books'
       end
     end
     else
       redirect to '/login'
     end
 end



 #delete book
  delete '/books/:id/delete' do
    if logged_in?
      @book = Book.find_by_id(params[:id])
      if @book && @book.user == current_user
        @book.delete
      end
      redirect to '/books'
    else
      redirect to '/login'
    end
  end


end
