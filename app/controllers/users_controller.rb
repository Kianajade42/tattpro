class UsersController < ApplicationController



    get "/users/signup" do
        @user = User.new
        erb :"users/new"
    end 

 post '/users/signup' do 
      @user = User.create(params)
      if @username.save
      session[:username_id] = @username.id 
      flash[:success] = 'Successfully created user account.' 
     redirect "/users/show"
      else
        flash[:danger] = 'Please enter valid registration data'
        redirect '/signup'
  end
end

get "/users/login" do
        @user = User.all 
        erb :"users/login"
    end 


post '/users/login' do
@user = User.find_by(username: params[:username]) 
  if @user&.authenticate(params[:password])
    session.id
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