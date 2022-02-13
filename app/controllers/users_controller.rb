class UsersController < ApplicationController

 get '/users/:id' do
    if !logged_in?
      redirect '/users/show'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/login'
    end
  end

    get "/signup" do
        erb :"users/new"
    end 

 post '/signup' do 
      @user = User.create(:username => params[:username], :password => params[:password])
      if @user.save
      session[:user_id] = @user.id
     redirect "/users/#{user.id}"
      else
            erb :'/users/new'
    end
  end

    get "/login" do
        erb :"users/login"
    end 

    post "/login" do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/users/#{user.id}"
        else 
            redirect "/login"
        end
    end


    get "/logout" do
        session.clear
        redirect '/'
    end 

end 