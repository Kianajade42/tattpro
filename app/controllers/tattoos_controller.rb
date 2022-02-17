class TattoosController < ApplicationController
        #displayportfolio

get '/tattoos/' do
    @tattoos = Tattoo.find_by(current_user)
    erb :'tattoos/index'
end
get '/tattoos' do
    @tattoos = Tattoo.find_by(current_user)
    erb :'tattoos/index'
end
get '/tattoos/show' do
    @tattoos = Tattoo.find_by(current_user)
    erb :'tattoos/show'
  end

#new artwork
get '/tattoos/new' do
    erb :'tattoos/new'
end

#creatingnewtattoo
post '/tattoos/show' do
    @tattoos = Tattoo.new(params[:tattoos])
    @tattoos.save
    redirect "/tattoos/show"
  end

 get '/tattoos/:id' do
        @tattoos = Tattoo.find_by(current_user)
        # Tattoo.find_by(id: params[:id]) 
    
        erb :"tattoos/edit"
    end


    get '/tattoos/edit/:id' do
        @tattoos = Tattoo.find_by(current_user)
            erb :"tattoos/edit"

    end 

#editingportfolio
patch '/tattoos' do
     @tattoos = Tattoo.find_by(params[:id])
     @tattoos.name = params[:name]
     @tattoos.client = params[:client]
     @tattoos.description = params[:description]
     @tattoos.placement = params[:placement]
     @tattoos.save
        redirect to "/tattoos"  
# end
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


 
