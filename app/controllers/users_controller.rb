class UsersController < ApplicationController


    get "/users/signup" do
        @user = User.new(username: params[:username])
        erb :"users/new"
    end 

 post '/users/signup' do 
  
      @user = User.new(params)
      @user.save
      session.id = current_user
      
      erb :'/users/show'
  end


get "/users/login" do
        @user = User.all 
        erb :"users/login"
    end 


post '/users/login' do
@user = User.find_by(username: params[:username]) 
  if @user&.authenticate(params[:password])
    @current_user = session[:user_id]= @user.id
    erb :'/users/show'
    end
end

 get '/users/show' do
    session.id
    erb :"users/show"
  end


    get "/logout" do
        session.clear
        redirect '/'
    end 

end 