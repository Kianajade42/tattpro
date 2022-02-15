require './config/environment'

class ApplicationController < Sinatra::Base
configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

get "/about" do 

erb :"/about"
end

get "/" do
        erb :welcome, { :locals => params, :layout => :layout }
    end

    helpers do

   def logged_in?
      !!session[:user_id]
   end
   
   def current_user
   @current_user ||= User.find_by_id(id: session[:user_id])
    end

end
end

