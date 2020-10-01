require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "its_a_secret"
  end

  get "/" do
    if logged_in?
      redirect "/inventories"
    else
      erb :"/welcome"
    end
  end

  helpers do
   
    def current_user
      if session[:user_id]
        User.find(session[:user_id])
      end 
    end

    def logged_in?
      !!current_user
    end

    def if_logged_out
      if !logged_in?
        redirect "/users/signin"
      end
    end
    
  end
  
end
  

