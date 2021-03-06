class UsersController < ApplicationController
get "/login" do 
  
  erb :"users/login"
end
    get "/new" do
    erb :"users/new"
    end 

# get "/users/new" do
#     erb :"users/new"
#     end 

    post "/new" do
        user = User.new(params[:user_id])
        if user.save
            session[:user_id] = user.id 
            redirect "/users/#{user.id}"
        else 
            @errors = user.errors.full_messages.join(" - ")
            erb :'/users/new'
        end
    end

 post "/login" do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/users/#{user.id}"
        else 
            redirect "/login"
        end
    end
  get "/users/:id" do
        @user = User.find_by(id: params[:id])
        erb :"/users/show"
    end 

    get "/about" do
        @user = User.find_by(params[:session])
        erb :"/about"
    end 

get "/logout" do
        session.clear
        redirect '/'
    end 
  end
