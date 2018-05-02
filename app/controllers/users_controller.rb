require 'pry'

class UsersController < ApplicationController

  #fetch user's homepage
  get '/users/:id' do
    if !logged_in?
      redirect '/login'
    end

    @user = User.find_by_id(params[:id])
      if !@user.nil? && @user == current_user
        erb :'/users/personal'
      else
        redirect to '/login'
      end

  end



          #Signing Up
          get '/register' do
            if !session[:user_id]
              erb :'/users/register'
            else
              erb '/users/personal'
            end
         end

         post '/register' do
             if params[:user_name] == "" || params[:email] == "" || params[:password_digest] == ""
               redirect to '/register'
             else
               @user=User.create(user_name: params[:user_name], email: params[:email], password: params[:password_digest])
               session[:user_id] = @user.id
               erb :'/users/personal'
             end
         end


  #Loggin In
 get '/login' do
  if !session[:user_id]
    erb :'/users/login'
  else
    redirect to '/users/personal'
  end
 end

 post '/login' do
   user = User.find_by(user_name: params[:user_name])
       if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect '/books'
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
   if !session[:user_id]
     redirect to '/login'
   else
     @subjects = Subject.all
     erb :'/subjects/subjects'
   end
 end

 get '/home' do
   if logged_in?
     @user = User.find(session[:user_id])
     @user.id = session[:user_id]
     erb :'/users/personal'
   else
     erb :'/users/login'
   end
 end



end
