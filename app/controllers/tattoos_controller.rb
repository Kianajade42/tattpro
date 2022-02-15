class TattoosController < ApplicationController
#login
 get '/tattoos' do
 logged_in?
  @user = current_user 
  @tattoos = Tattoo.all
    erb :'/tattoos/index'
end
 
#new artwork
get '/tattoos/new' do
    @tattoos = Tattoo.all
    erb :"/tattoos/new"
end

#creatingnewtattoo
 post '/tattoos/new' do
     @tattoos = Tattoo.new(params[:tattoo])
     @tattoos.save = @current_user
     erb :"/tattoos/new"
end

#editing
 get '/tattoos/edit' do
      @tattoos = Tattoo.all
        erb :"/tattoos/edit"
    end
    #displayportfolio
get '/tattoos/show' do
    @tattoos = Tattoo.all
    erb :"tattoos/show"
  end

post '/tattoos/show' do
    @tattoos = Tattoo.all
    erb :"tattoos/show"
  end

post '/tattoos/:id' do
    @tattoos = Tattoo.all
    erb :"/tattoos/edit"
end

#editingportfolio
patch '/tattoos' do
      @tattoos = Tattoo.all
      @tattoos.update(params[:tattoo])
         erb  :"/tattoos/show"
end

    delete '/tattoos/:id' do 
        @tattoos = Tattoo.delete(params[:id])
            erb :'/tattoos/index'
    end 
 
end