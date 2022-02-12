class UsersController < ApplicationController


    get "/signup" do
        erb :"users/new"
    end 

    # post "/signup" do
    #     user = User.new(params[:user])
    #     if user.save
    #         session[:user_id] = user.id 
    #         redirect "/users/#{user.id}"
    #     else 
    #         @errors = user.errors.full_messages.join(" - ")
    #         erb :'/users/new'
    #     end
    # end
    post "/signup" do
 user = User.new(:username => params[:username], :password => params[:password])
  if user.save
    redirect "/login"
  else
    redirect "/signup"
  end
end

    get "/login" do
        erb :"users/login"
    end 

  get "/users/:id" do
        @user = User.find_by(id: params[:id])
        erb :"/users/show"
    end 
    
    post '/login' do
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to "/users/#{user.id}"
      else
          redirect to '/login'
      end
  end
    # post "/login" do
    #     user = User.find_by(username: params[:user][:username])
    #     if user && user.authenticate(params[:user][:password])
    #         session[:user_id] = user.id 
    #         redirect "/users/#{user.id}"
    #     else 
    #         redirect "/login"
    #     end
    # end


    get "/logout" do
        session.clear
        redirect '/'
    end 

end 