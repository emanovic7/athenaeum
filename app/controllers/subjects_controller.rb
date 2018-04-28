class SubjectsController < ApplicationController

  #show all subjects
  get '/subjects' do
   if logged_in?
     @subjects = Subject.all
     erb :'subjects/subjects'
   else
     redirect to '/login'
   end
 end

 #show subject by slug
 get '/subjects/:slug' do
   @subject = Subject.find_by_slug(params[:slug])
   erb :'/subjects/show_subject'
 end


end
