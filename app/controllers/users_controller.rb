require 'pry'

class UsersController < ApplicationController

  #fetch user's homepage
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/personal'
  end

  #Signing Up
  get '/register' do
    if !logged_in?
      erb :'/users/register'
    else
      erb :'/users/personal'
    end
 end

         post '/register' do
             if params[:user_name] == "" || params[:email] == "" || params[:password_digest] == ""
               redirect to '/register'
             else
               @user=User.new(user_name: params[:user_name], email: params[:email], password: params[:password_digest])
               @user.save
               session[:user_id] = @user.id
               redirect to '/books'
             end
         end

  #Loggin In
 get '/login' do
   if !logged_in?
     erb :'/users/login'
   else
     erb :'books/books_list'
   end
 end

 post '/login' do
   @user = User.find_by(user_name: params[:user_name])
       if user && user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect to '/books'
     else
       redirect to '/login'
     end
 end



 get '/logout' do
   if logged_in?
     session.destroy
     redirect to '/'
   else
     redirect to '/login'
   end
 end


 #list user's books' subject
 get '/users/books/subjects' do
   if logged_in?
     @subjects = Subject.all #make subjects controller?
     erb :'/subjects/subjects'
   else
     redirect to '/login'
   end
 end

 get '/home' do
   if current_user
     erb :'/users/personal'
   else
     erb :'/users/login'
   end
 end



end
