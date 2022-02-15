class TattoosController < ApplicationController
        #displayportfolio
get '/tattoos' do
    @tattoos = current_user.all
    erb :"tattoos/show"

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

 get '/tattoos/:id' do
        @tattoos = Tattoo.find_by(id: params[:id]) 
        erb :"tattoos/edit"
    end


    get '/tattoos/:id/edit' do
        @tattoo = Tattoo.find_by(id: params[:id])
        if @tattoos.user == current_user
            erb :"tattoos/edit"
        else
            redirect "/tattoos"
        end
    end 

#editingportfolio
patch '/tattoos/:id' do
      @tattoos = Tattoo.find_by(id: params[:id])
      if @book.user == current_user
         @tattoos.update(params[:tattoo])
         redirect "/tattoos/#{@tattoo.id}"
      else
        redirect "/tattoos"  
end
end
    
delete  '/tattoos/index' do
        @tattoos = Tattoo.find_by(id: params[:id])
        if @tattoos.user == current_user
           @tattoos.destroy
         redirect '/tattoos'
        else
             redirect '/tattoos'
        end
end
end


 
