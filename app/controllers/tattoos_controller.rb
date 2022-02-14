class TattoosController < ApplicationController

 get '/tattoos/show' do
 logged_in?
  @user = current_user 
#   @tattoos = current_user.tattoos 
  @tattoos = Tattoo.all
    erb :'tattoos/show'
end
 

get '/tattoos/new' do
    erb :"/tattoos/new"
end

 post '/tattoos' do
     @tattoos = Tattoo.new(params[:tattoo])
     @tattoos.save
     erb :"/tattoos/new"
end

 get '/tattoos/:id' do
     #@tattoos = Tattoo.find_by(id: params[:id])
      @tattoos = Tattoo.all
        erb :"/tattoos/show"
    end

 get '/tattoos/edit/:id' do
        @tattoos = Tattoo.find_by_id(params[:id])
         erb :"tattoos/edit"
    end 

post '/tattoos/show' do
    
    binding.pry
    
    @tattoos = Tattoo.all
    erb :"/tattoos/show"
end


  patch '/tattoos/:id' do
        @tattoos = Tattoo.where(id: params[:id])
        @tattoos.update(params[:tattoo])
            redirect "/tattoos/edit"

end

    delete '/tattoos/:id' do 
        @tattoos = Tattoo.find_by_id(params[:id])
            @tattoos.delete
            erb :'/tattoos/index'
    end 
 
end