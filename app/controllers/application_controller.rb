require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "athenaeum_secret"
  end

  get '/' do

    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

=begin
  def redirect_if_not_logged_in
     if !logged_in?
       redirect "/login?error=You have to be logged in to do that"
     end
   end
=end

end
