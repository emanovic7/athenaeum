require 'rack-flash'

class AuthorsController < ApplicationController
  use Rack::Flash

  get '/authors/:id' do
    if logged_in? && @user = current_user
      @author = Author.find_by_id(params[:id])
      erb :'/authors/show'
    else
      redirect to '/login'
    end
  end

  get '/authors' do
    if logged_in? && @user = current_user
      @authors = Author.all
      erb :'/authors/authors'
    else
      redirect to '/login'
    end
  end


  get '/authors/new' do
   if logged_in?
     erb :'/authors/create_author'
   else
     redirect to '/login'
   end
 end

 post '/authors/new' do
    if logged_in?
      @author = Author.create(name: params[:name])
      @author.save

      flash[:message] = "New Author Created!"

      erb :'/authors/show_author'
    else
      redirect to '/login'
    end
  end

  get '/authors/:slug/edit' do
    if logged_in?
      @author = Author.find_by_slug(params[:slug])
      erb :'/authors/edit_author'
    else
      redirect to '/login'
    end
  end

  patch '/authors/:slug' do
    @author = Author.find_by_slug(params[:slug])
    @author.update(params[:author])
    @author.save

    flash[:message] = "Author Successfully Updated!"

    redirect("/authors/show_author")
  end


end
