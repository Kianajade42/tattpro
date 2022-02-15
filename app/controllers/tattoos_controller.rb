class TattoosController < ApplicationController
        #displayportfolio
get '/tattoos/show' do
    @tattoos = Tattoo.all
    erb :"tattoos/show"
  end

#login
 get '/tattoos' do
#  logged_in?
#   @current_user 
#   @tattoos = Tattoo.find_by(params[:id])
#   find_by(params[:user_id])
  @tattoos = Tattoo.all
    erb :'tattoos/index'
end

 #new artwork
get '/tattoos/new' do
    erb :'tattoos/new'
end

#creatingnewtattoo
post '/tattoos' do
    @tattoos = Tattoo.new(params)
    @tattoos.user_id= session[:user_id]
    @tattoos.save
    redirect "/tattoos/show"
  end

post '/tattoos' do
    @tattoos = Tattoo.all
    erb :"tattoos/edit"
end

#editingform
 get '/tattoos/edit' do
    # @tattoos = Tattoo.find_by(:id (params[:id])
      @tattoos = Tattoo.all
    #  if @tattoos.user == current_user
        erb :"tattoos/edit"
    end
    
#editingportfolio
patch '/tattoos' do
   # @current_user
      @tattoos = Tattoo.find_by_id(params[:id])
    
      @tattoos.update(name: params[:name], client: params[:client], placement: params[:placement], description: params[:discription],)
         redirect to 'tattoos'
end

 delete "/tattoos/index"  do
@tattoos = Tattoo.find_by(params[:tattoo])
@tattoos.destroy

redirect to '/tattoos'
end
end