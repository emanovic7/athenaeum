class SubjectsController < ApplicationController

  #show all subjects
  get '/subjects' do
   if logged_in? && @user = current_user
     @subjects = Subject.all
     erb :'subjects/subjects'
   else
     redirect to '/login'
   end
 end

 #show subject by slug
 get '/subjects/:id' do
   if logged_in? && @user = current_user
     @subject = Subject.find_by_id(params[:id])
     erb :'/subjects/show_subject'
   end
 end


end
