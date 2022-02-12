class TattoosController < ApplicationController

get '/tattoos' do
   @tattoos = current_user.tattoos
   erb :"tattoos/index"
end

get '/tattoos/new' do
    erb :"tattoos/new"
end

 post '/tattoos' do
     tattoo = Tattoo.new(params[:tattoo])
     if tattoo.save
        current_user.tattoos.create(params[:tattoo])
        redirect "/tattoos"
     else
        @errors = tattoo.errors.full_messages.join(" - ")
        erb :'/tattoos/new'
 end
 end
 get '/tattoo/:id' do
        @tattoo = Tattoo.find_by(id: params[:id])
        erb :"tattoos/show"
    end

    get '/tattoos/:id/edit' do
        @tattoo = Tattoo.find_by(id: params[:id])
        if @tattoo.user == current_user
            erb :"tattoos/edit"
        else
            redirect "/tattoos"
        end
    end 

    patch '/tattoos/:id' do
        @tattoo = Tattoo.find_by(id: params[:id])
        if @tattoo.user == current_user
            @tattoo.update(params[:tattoo])
            redirect "/tattoos/#{@tattoo.id}"
        else 
            redirect "/tattoos"
        end
    end

    delete '/tattoos/:id' do
        @tattoo = Tattoo.find_by(id: params[:id])
        if @tattoo.user == current_user
            @tattoo.destroy
            redirect '/tattoos'
        else
            redirect '/tattoos'
        end 
    end 

end